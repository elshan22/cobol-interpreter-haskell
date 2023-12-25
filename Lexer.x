-- Lexer.x
{
module Lexer where
}

%wrapper "basic"

$digit = [0-9]
$letter = [a-zA-Z]
@id = ($letter)($letter|$digit)*
@number = $digit+(\.$digit+)?
@integer = $digit+
@string = '(([^\']:?|\\')*)'

tokens :-

$white+ ;
@integer            { \s -> IntegerToken $ read s }
@number             { \s -> NumberToken $ read s }
"IDENTIFICATION"    { \s -> IdentificationToken }
"DATA"              { \s -> DataToken }
"PROCEDURE"         { \s -> ProcedureToken }
"END"               { \s -> EndToken}
"DIVISION"          { \s -> DivisionToken }
"ID"                { \s -> IdToken }
"PROGRAM"           { \s -> ProgramToken }
"WORKING"           { \s -> WorkingToken }
"STORAGE"           { \s -> StorageToken }
"SECTION"           { \s -> SectionToken }
"PIC"               { \s -> PicToken }
"S9"                { \s -> NumericToken }
"A"                 { \s -> AlphaNumericToken }
"VALUE"             { \s -> ValueToken }
"EXIT"              { \s -> ExitToken }
"MOVE"              { \s -> MoveToken }
"TO"                { \s -> ToToken }
"ADD"               { \s -> AddToken }
"GIVING"            { \s -> GivingToken }
"SUBTRACT"          { \s -> SubtractToken }
"FROM"              { \s -> FromToken }
"MULTIPLY"          { \s -> MultiplyToken }
"BY"                { \s -> ByToken }
"DIVIDE"            { \s -> DivideToken }
"INTO"              { \s -> IntoToken }
"REMAINDER"         { \s -> RemainderToken }
"COMPUTE"           { \s -> ComputeToken }
"IF"                { \s -> IfToken }
"THEN"              { \s -> ThenToken }
"ELSE"              { \s -> ElseToken }
"PERFORM"           { \s -> PerformToken }
"UNTIL"             { \s -> UntilToken }
"VARYING"           { \s -> VaryingToken }
"FUNCTION"          { \s -> FunctionToken }
"DISPLAY"           { \s -> DisplayToken }
"OR"                { \s -> OrToken }
"AND"               { \s -> AndToken }
"NOT"               { \s -> NotToken }
"EQUALS"            { \s -> EqualsToken }
"=>"                { \s -> ArrowToken }
"<="                { \s -> LessOrEqualToken }
"<"                 { \s -> LessToken }
">="                { \s -> GreaterEqualToken }
">"                 { \s -> GreaterToken }
"+"                 { \s -> PlusToken }
"-"                 { \s -> MinusToken }
"*"                 { \s -> TimesToken }
"/"                 { \s -> DividesToken }
"."                 { \s -> DotToken }
","                 { \s -> CommaToken }
"="                 { \s -> AssignToken }
"("                 { \s -> LeftPToken }
")"                 { \s -> RightPToken }
"["                 { \s -> LeftBToken }
"]"                 { \s -> RightBToken }
"?"                 { \s -> QuestionToken }
":"                 { \s -> CollonToken }
@string             { \(x:s) -> StringToken $ init s }
@id                 { \s -> IdentifierToken s }


{
    data Token
    = IntegerToken Integer
    | NumberToken Float
    | IdentificationToken
    | DataToken
    | ProcedureToken
    | EndToken
    | DivisionToken
    | IdToken
    | ProgramToken
    | WorkingToken
    | StorageToken
    | SectionToken
    | PicToken
    | NumericToken
    | AlphaNumericToken
    | ValueToken
    | ExitToken
    | MoveToken
    | ToToken
    | AddToken
    | GivingToken
    | SubtractToken
    | FromToken
    | MultiplyToken
    | ByToken
    | DivideToken
    | IntoToken
    | RemainderToken
    | ComputeToken
    | IfToken
    | ThenToken
    | ElseToken
    | PerformToken
    | UntilToken
    | VaryingToken
    | FunctionToken
    | DisplayToken
    | OrToken
    | AndToken
    | NotToken
    | EqualsToken
    | ArrowToken
    | LessToken
    | LessOrEqualToken
    | GreaterToken
    | GreaterEqualToken
    | PlusToken
    | MinusToken
    | TimesToken
    | DividesToken
    | DotToken
    | CommaToken
    | AssignToken
    | LeftPToken
    | RightPToken
    | LeftBToken
    | RightBToken
    | QuestionToken
    | CollonToken
    | StringToken String
    | IdentifierToken String
    deriving (Show, Eq)
}