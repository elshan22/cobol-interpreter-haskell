{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }


%token
    'number'            { NumberToken $$ }
    'integer'           { IntegerToken $$ }
    'identification'    { IdentificationToken }
    'data'              { DataToken }
    'procedure'         { ProcedureToken }
    'end'               { EndToken}
    'division'          { DivisionToken }
    'id'                { IdToken }
    'program'           { ProgramToken }
    'working'           { WorkingToken }
    'storage'           { StorageToken }
    'section'           { SectionToken }
    'pic'               { PicToken }
    's9'                { NumericToken }
    'a'                 { AlphaNumericToken }
    'value'             { ValueToken }
    'exit'              { ExitToken }
    'move'              { MoveToken }
    'to'                { ToToken }
    'add'               { AddToken }
    'giving'            { GivingToken }
    'subtract'          { SubtractToken }
    'from'              { FromToken }
    'multiply'          { MultiplyToken }
    'by'                { ByToken }
    'divide'            { DivideToken }
    'into'              { IntoToken }
    'remainder'         { RemainderToken }
    'compute'           { ComputeToken }
    'if'                { IfToken }
    'then'              { ThenToken }
    'else'              { ElseToken }
    'perform'           { PerformToken }
    'until'             { UntilToken }
    'varying'           { VaryingToken }
    'function'          { FunctionToken }
    'display'           { DisplayToken }
    'or'                { OrToken }
    'and'               { AndToken }
    'not'               { NotToken }
    'equals'            { EqualsToken }
    '=>'                { ArrowToken }
    '<='                { LessOrEqualToken }
    '<'                 { LessToken }
    '>='                { GreaterEqualToken }
    '>'                 { GreaterToken }
    '+'                 { PlusToken }
    '-'                 { MinusToken }
    '*'                 { TimesToken }
    '/'                 { DividesToken }
    '.'                 { DotToken }
    ','                 { CommaToken }
    '='                 { AssignToken }
    '('                 { LeftPToken }
    ')'                 { RightPToken }
    '['                 { LeftBToken }
    ']'                 { RightBToken }
    '?'                 { QuestionToken }
    ':'                 { CollonToken }
    'string'            { StringToken $$ }
    'var'               { IdentifierToken $$ }

%%

Program
    : IdentificationDivision DataDivision ProcedureDivision EndStatement    { TypedProgram $1 $2 $3 $4 }
    | IdentificationDivision ProcedureDivision EndStatement                 { NoneTypeProgram $1 $2 $3 }

IdentificationDivision
    : 'identification' 'division' '.' 'program' '-' 'id' '.' 'var'  { IdentificationDivision $8 }

DataDivision
    : 'data' 'division' '.' DataSection { DataDivision $4 }

ProcedureDivision
    : 'procedure' 'division' '.' ProcedureSection   { ProcedureDivision $4 }

EndStatement
    : 'end' 'program' '.' 'var' { HasEnd $4 }
    | {- empty -}               { NoEnd }

DataSection
    : 'working' '-' 'storage' 'section' '.' DataDeclarations    { DataSection $6 }

ProcedureSection
    : Paragraph                     { SingleParagraph $1 }
    | ProcedureSection Paragraph    { MultiParagraph $1 $2 }

DataDeclarations
    : DataDeclarations VariableDeclaration  { Declarations $1 $2 }
    | {- empty -}                           { NoDeclaration }

Paragraph
    : 'var' '.' Statements  { Paragraph $1 $3 }

VariableDeclaration
    : 'integer' 'var' 'pic' DataType DefaultValue '.'    { VarDeclaration $1 $2 $4 $5 }

DataType
    : 'a'       { AlphanumericString }
    | 's9'      { SignedNumber }

DefaultValue
    : 'value' Expression    { HasDefault $2 }
    | {- empty -}           { NoDefault }

Value
    : 'string'  { StringValue $1 }
    | 'number'  { NumberValue $1 }
    | 'integer' { NumberValue (fromIntegral $1) }

Statements
    : Statements Statement '.'  { MultiStatement $1 $2 }
    | Statement '.'             { SingleStatement $1 }

Statement
    : MoveStmt          { MoveStatement $1 }
    | ArithmeticStmt    { ArithmeticStatement $1 }
    | ComputeStmt       { CompStatement $1 }
    | IfStmt            { IfStatement $1 }
    | PerformStmt       { PerformStatement $1 }
    | FunctionStmt      { DeclareFunction $1 }
    | DisplayStmt       { ShowStatement $1 }
    | 'exit'            { ExitStatement }

MoveStmt
    : 'move' Expression 'to' Variables { Move $2 $4 }

ArithmeticStmt
    : AddStmt   { AddStatement $1 }
    | SubStmt   { SubtractStatement $1 }
    | MultStmt  { MultiplyStatement $1 }
    | DivStmt   { DivisionStatement $1 }

Variable
    : 'var'                     { NormalVariable $1 }
    | 'var' '[' Expression ']'  { ListVariable $1 $3 }

AddStmt
    : 'add' Expression 'to' Variable        { SingleAdd $2 $4 }
    | 'add' Expressions 'giving' Variable   { MultiAdd $2 $4 }

SubStmt
    : 'subtract' Expressions 'from' Variable                        { MultiSubtract $2 $4 }
    | 'subtract' Expressions 'from' Expression 'giving' Variable    { SingleSubtract $2 $4 $6 }

MultStmt
    : 'multiply' Expression 'by' Variable       { MultiplyTo $2 $4 }
    | 'multiply' Expressions 'giving' Variable  { MultiplyGiving $2 $4 }

DivStmt
    : 'divide' Expression 'into' Variable                           { DivideInto $2 $4 }
    | 'divide' Expression ',' Expression 'giving' Variable          { DivideGiving $2 $4 $6 }
    | 'divide' Expression 'into' Expression 'remainder' Variable    { DivideRemainder $2 $4 $6 }

ComputeStmt
    : 'compute' Variable '=' Expression     { ComputeStatement $2 $4 }

IfStmt
    : 'if' Disjunction 'then' Statements                                    { IfOnlyStatement $2 $4 }
    | 'if' Disjunction 'then' Statements 'else' Statements 'end' '-' 'if'   { IfElseStatement $2 $4 $6 }

PerformStmt
    : 'perform' Statements 'until' Disjunction                                                          { ConditionalPerform $4 $2 }
    | 'perform' 'until' Disjunction Statements 'end' '-' 'perform'                                      { ConditionalPerform $3 $4 }
    | 'perform' 'varying' 'var' 'from' Expression 'to' Expression Step Statements 'end' '-' 'perform'   { RangePerform $3 $5 $7 $8 $9 }
    | 'perform' 'var'                                                                                   { ParagraphPerform $2 }

Step
    : 'by' Expression   { HasStep $2 }
    | {- empty -}       { HasNoStep }

FunctionStmt
    : 'function' 'var' '=' Variables '=>' Expression    { FunctionStatement $2 $4 $6 }

DisplayStmt
    : 'display' Expression  { DisplayStatement $2 }

Variables
    : Variables ',' Variable    { MultiVariables $1 $3 }
    | Variable                  { SingleVariable $1 }

Expressions
    : Expressions ',' Expression    { MultiExpressions $1 $3 }
    | Expression                    { SingleExpression $1 }

Disjunction
    : Conjunction                   { HasNoOr $1 }
    | Disjunction 'or' Conjunction  { HasOr $1 $3 }

Conjunction
    : Inversion                     { HasNoAnd $1 }
    | Conjunction 'and' Inversion   { HasAnd $1 $3 }

Inversion
    : 'not' Inversion   { HasInversion $2 }
    | Comparison        { HasNoInversion $1 }

Comparison
    : Eq    { EqualComparison $1 }
    | NotEq { NotEqualComparison $1 }
    | Lt    { LessThanComparison $1 }
    | Lte   { LessThanOrEqualComparison $1 }
    | Gt    { GreaterThanComparison $1 }
    | Gte   { GreaterThanOrEqualComparison $1 }

Eq
    : Expression 'equals' Expression    { IsEq $1 $3 }

NotEq
    : Expression 'not' 'equals' Expression  { IsNotEq $1 $4 }

Lt
    : Expression '<' Expression { IsLessThan $1 $3 }

Lte
    : Expression '<=' Expression    { IsLessThanOrEqual $1 $3 }

Gt
    : Expression '>' Expression { IsGreaterThan $1 $3 }

Gte
    : Expression '>=' Expression { IsGreaterThanOrEqual $1 $3 }

Expression
    : '(' Disjunction ')' '?' Expression ':' Expression { ConditionalExpression $2 $5 $7 }
    | Sum                                               { EmptySum $1 }

Sum
    : Sum '+' Term          { AddSum $1 $3 }
    | Sum '-' Term          { SubtractSum $1 $3 }
    | Term                  { EmptyTerm $1 }

Term
    : Term '*' Factor   { MultiplyTerm $1 $3 }
    | Term '/' Factor   { DivideTerm $1 $3 }
    | Factor            { EmptyFactor $1 }

Factor
    : '+' Factor            { PositiveFactor $2 }
    | '-' Factor            { NegativeFactor $2 }
    | '(' Expression ')'    { ParenthesesExpression $2 }
    | Element               { EmptyElement $1 }

Element
    : Variable                                  { VarElement $1 }
    | 'var' '(' Expressions ')'                 { FunctionElement $1 $3 }
    | Value                                     { ValueElement $1 }


{

    data Program
    = TypedProgram IdentificationDivision DataDivision ProcedureDivision EndStatement
    | NoneTypeProgram IdentificationDivision ProcedureDivision EndStatement
    deriving (Show, Eq, Ord);

    data IdentificationDivision
    = IdentificationDivision String
    deriving (Show, Eq, Ord);

    data DataDivision
    = DataDivision DataSection
    deriving (Show, Eq, Ord);

    data ProcedureDivision
    = ProcedureDivision ProcedureSection
    deriving (Show, Eq, Ord);

    data EndStatement
    = HasEnd String
    | NoEnd
    deriving (Show, Eq, Ord);

    data DataSection
    = DataSection DataDeclarations
    deriving (Show, Eq, Ord);

    data ProcedureSection
    = SingleParagraph Paragraph
    | MultiParagraph ProcedureSection Paragraph
    deriving (Show, Eq, Ord);

    data DataDeclarations
    = Declarations DataDeclarations VariableDeclaration
    | NoDeclaration
    deriving (Show, Eq, Ord);

    data Paragraph
    = Paragraph String Statements
    deriving (Show, Eq, Ord);

    data VariableDeclaration
    = VarDeclaration Integer String DataType DefaultValue
    deriving (Show, Eq, Ord);

    data DataType
    = SignedNumber
    | AlphanumericString
    deriving (Show, Eq, Ord);

    data DefaultValue
    = HasDefault Expression
    | NoDefault
    deriving (Show, Eq, Ord);

    data DataValue
    = StringValue String
    | NumberValue Float
    deriving (Show, Eq, Ord);

    data Statements
    = SingleStatement Statement
    | MultiStatement Statements Statement
    deriving (Show, Eq, Ord);

    data Statement
    = MoveStatement MoveStatement
    | ArithmeticStatement ArithmeticStatement
    | CompStatement ComputeStatement
    | IfStatement IfStatement
    | PerformStatement PerformStatement
    | DeclareFunction FunctionStatement
    | ShowStatement DisplayStatement
    | ExitStatement
    deriving (Show, Eq, Ord);

    data MoveStatement
    = Move Expression Variables
    deriving (Show, Eq, Ord);

    data ArithmeticStatement
    = AddStatement AddStatement
    | SubtractStatement SubStatement
    | MultiplyStatement MultStatement
    | DivisionStatement DivStatement
    deriving (Show, Eq, Ord);

    data Variable
    = NormalVariable String
    | ListVariable String Expression
    deriving (Show, Eq, Ord);

    data AddStatement
    = SingleAdd Expression Variable
    | MultiAdd Expressions Variable
    deriving (Show, Eq, Ord);

    data SubStatement
    = SingleSubtract Expressions Expression Variable
    | MultiSubtract Expressions Variable
    deriving (Show, Eq, Ord);

    data MultStatement
    = MultiplyTo Expression Variable
    | MultiplyGiving Expressions Variable
    deriving (Show, Eq, Ord);

    data DivStatement
    = DivideInto Expression Variable
    | DivideGiving Expression Expression Variable
    | DivideRemainder Expression Expression Variable
    deriving (Show, Eq, Ord);

    data ComputeStatement
    = ComputeStatement Variable Expression
    deriving (Show, Eq, Ord);

    data IfStatement
    = IfOnlyStatement Disjunction Statements
    | IfElseStatement Disjunction Statements Statements
    deriving (Show, Eq, Ord);

    data PerformStatement
    = ConditionalPerform Disjunction Statements
    | RangePerform String Expression Expression Step Statements
    | ParagraphPerform String
    deriving (Show, Eq, Ord);

    data Step
    = HasStep Expression
    | HasNoStep
    deriving (Show, Eq, Ord);

    data FunctionStatement
    = FunctionStatement String Variables Expression
    deriving (Show, Eq, Ord);

    data DisplayStatement
    = DisplayStatement Expression
    deriving (Show, Eq, Ord);

    data Variables
    = SingleVariable Variable
    | MultiVariables Variables Variable
    deriving (Show, Eq, Ord);

    data Expressions
    = SingleExpression Expression
    | MultiExpressions Expressions Expression
    deriving (Show, Eq, Ord);

    data Disjunction
    = HasNoOr Conjunction
    | HasOr Disjunction Conjunction
    deriving (Show, Eq, Ord);

    data Conjunction
    = HasNoAnd Inversion
    | HasAnd Conjunction Inversion
    deriving (Show, Eq, Ord);

    data Inversion
    = HasNoInversion Comparison
    | HasInversion Inversion
    deriving (Show, Eq, Ord);

    data Comparison
    = EqualComparison Equality
    | NotEqualComparison Equality
    | LessThanComparison Unequality
    | LessThanOrEqualComparison Unequality
    | GreaterThanComparison Unequality
    | GreaterThanOrEqualComparison Unequality
    deriving (Show, Eq, Ord);

    data Equality
    = IsEq Expression Expression
    | IsNotEq Expression Expression
    deriving (Show, Eq, Ord);

    data Unequality
    = IsLessThan Expression Expression
    | IsLessThanOrEqual Expression Expression
    | IsGreaterThan Expression Expression
    | IsGreaterThanOrEqual Expression Expression
    deriving (Show, Eq, Ord);

    data Expression
    = ConditionalExpression Disjunction Expression Expression
    | EmptySum Sum
    deriving (Show, Eq, Ord);

    data Sum
    = AddSum Sum Term
    | SubtractSum Sum Term
    | EmptyTerm Term
    deriving (Show, Eq, Ord);

    data Term
    = MultiplyTerm Term Factor
    | DivideTerm Term Factor
    | EmptyFactor Factor
    deriving (Show, Eq, Ord);

    data Factor
    = PositiveFactor Factor
    | NegativeFactor Factor
    | ParenthesesExpression Expression
    | EmptyElement Element
    deriving (Show, Eq, Ord);

    data Element
    = VarElement Variable
    | FunctionElement String Expressions
    | ValueElement DataValue
    deriving (Show, Eq, Ord);

    parseError :: [Token] -> a;
    parseError _ = error "Parse error";
}