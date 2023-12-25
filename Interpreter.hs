module Interpreter where

import Data.Typeable
import Lexer
import Parser
import Environment
import Parser (Program(TypedProgram, NoneTypeProgram), PerformStatement (ParagraphPerform), Variable (NormalVariable, ListVariable), FunctionStatement)

data Evaluated
    = Evaluated Value Environment
    deriving Show;

valueToString :: Value -> String
valueToString (StrValue x) = x
valueToString (NumValue x) = show x

valueToNumber :: Value -> Float
valueToNumber (StrValue x) = read x
valueToNumber (NumValue x) = x

valueToBool :: Value -> Bool
valueToBool (CondValue x) = x

valueToParagraphStatements :: Value -> Statements
valueToParagraphStatements (ParValue x) = x
valueToParagraphStatements _ = error "You cannot perform a non-paragraph variable!"

valueToFunctionVariables :: Value -> Variables
valueToFunctionVariables (FunValue vars exp env) = vars

valueToFunctionOutput :: Value -> Expression
valueToFunctionOutput (FunValue vars exp env) = exp

valueToFunctionEnvironment :: Value -> Environment
valueToFunctionEnvironment (FunValue vars exp env) = env

getEnv :: Evaluated -> Environment
getEnv (Evaluated v env) = env

getValue :: Evaluated -> Value
getValue (Evaluated v env) = v

floatList :: Integer -> Float -> [Float]
floatList 0 _ = []
floatList n k = k:floatList (n-1) k

stringList :: Integer -> String -> [String]
stringList 0 _ = []
stringList n k = k:stringList (n-1) k

variableCount :: Variables -> Integer
variableCount (SingleVariable var) = 1
variableCount (MultiVariables vars var) = 1 + (variableCount vars) 

expressionCount :: Expressions -> Integer
expressionCount (SingleExpression exp) = 1
expressionCount (MultiExpressions exps exp) = 1 + (expressionCount exps)

-- You should change the function so if there are values with different types,
-- It gives an error in which the datatypes of the two variables are specified
addValues :: Value -> Value -> Value
addValues (NumValue x) (NumValue y) = NumValue (x + y)
addValues (StrValue x) (StrValue y) = StrValue (x ++ y)
-- TODO: WRITE YOUR CODE HERE

concatLists :: Value -> Value -> Value
concatLists (StrList x1 y1) (StrList x2 y2) = StrList (x1 + x2) (y1 ++ y2)
concatLists (NumList x1 y1) (NumList x2 y2) = NumList (x1 + x2) (y1 ++ y2)

-- You should change the function so if there are values with different types,
-- It gives an error in which the datatypes of the two variables are specified
subtractValues :: Value -> Value -> Value
subtractValues (NumValue x) (NumValue y) = NumValue(x - y)
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if there are values with different types,
-- It gives an error in which the datatypes of the two variables are specified
multiplyValues :: Value -> Value -> Value
multiplyValues (NumValue x) (NumValue y) = NumValue (x * y)
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if there are values with different types,
-- It gives an error in which the datatypes of the two variables are specified
divideValues :: Value -> Value -> Value
divideValues (NumValue x) (NumValue y) = NumValue (x / y)
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if there are values with different types,
-- It gives an error in which the datatypes of the two variables are specified
modValues :: Value -> Value -> Value
modValues (NumValue x) (NumValue y) = NumValue (x - (y * fromIntegral (floor (x / y))))
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if there are values with different types,
-- It gives an error in which the datatypes of the two variables are specified
logicalOperationOnValues :: (Bool -> Bool -> Bool) -> Value -> Value -> Value
logicalOperationOnValues op (CondValue x) (CondValue y) = CondValue (op x y)
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if the index is not a number or the first value is not a list,
-- It gives an error in which the problem is specified
listQuery :: Value -> Value -> Value
listQuery (StrList n (x:xs)) (NumValue k) = if (k < fromIntegral n) && (k >= 0) then 
                                                if k == (fromIntegral $ floor k) then
                                                    if k == 0 then StrValue x
                                                    else listQuery (StrList (n-1) xs) (NumValue (k-1))
                                                else error ("Index of a list cannot be " ++ show k ++ " becuase it's not an integer!")
                                            else error ("Index " ++ (show $ floor k) ++ " is out of bound for list with length " ++ show n ++ "!")
listQuery (NumList n (x:xs)) (NumValue k) = if (k < fromIntegral n) && (k >= 0) then
                                                if k == (fromIntegral $ floor k) then
                                                    if k == 0 then NumValue x
                                                    else listQuery (NumList (n-1) xs) (NumValue (k-1))
                                                else error ("Index of a list cannot be " ++ show k ++ " becuase it's not an integer!")
                                            else error ("Index " ++ (show $ floor k) ++ " is out of bound for list with length " ++ show n ++ "!")
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if the updated value is not matched with list datatype,
-- It gives an error in which the expected datatype and the value of the expression is specified
listChange :: Value -> Value -> Value -> Value
listChange (StrList n (x:xs)) (NumValue k) (StrValue s) = if (k < fromIntegral n) && (k >= 0) then
                                                            if k == (fromIntegral $ floor k) then
                                                                if k == 0 then (StrList n (s:xs))
                                                                else concatLists (StrList 1 [x])
                                                                (listChange (StrList (n-1) xs) (NumValue (k-1)) (StrValue s))
                                                            else error ("Index of a list cannot be " ++ show k ++ " becuase it's not an integer!")
                                                        else error ("Index " ++ (show $ floor k) ++ " is out of bound for list with length " ++ show n ++ "!")
listChange (NumList n (x:xs)) (NumValue k) (NumValue y) = if (k < fromIntegral n) && (k >= 0) then
                                                            if k == (fromIntegral $ floor k) then
                                                                if k == 0 then (NumList n (y:xs))
                                                                else concatLists (NumList 1 [x])
                                                                (listChange (NumList (n-1) xs) (NumValue (k-1)) (NumValue y))
                                                            else error ("Index of a list cannot be " ++ show k ++ " becuase it's not an integer!")
                                                        else error ("Index " ++ (show $ floor k) ++ " is out of bound for list with length " ++ show n ++ "!")
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if one of expressions have different datatype than the others,
-- It gives an error in which the expected datatype and the value of the expression is specified
sumOfExpressions :: Expressions -> Environment -> Value
sumOfExpressions (SingleExpression exp) env = getValue $ evaluateExpression exp env
sumOfExpressions (MultiExpressions exps exp) env = addValues (sumOfExpressions exps env) (getValue $ evaluateExpression exp env)
-- TODO: WRITE YOUR CODE HERE

-- You should change the function so if one of expressions have different datatype than the others,
-- It gives an error in which the expected datatype and the value of the expression is specified
productOfExpressions :: Expressions -> Environment -> Value
productOfExpressions (SingleExpression exp) env = getValue $ evaluateExpression exp env
productOfExpressions (MultiExpressions exps exp) env = multiplyValues (productOfExpressions exps env) (getValue $ evaluateExpression exp env)
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so it can accept programs without a data division
evaluateProgram :: Program -> Environment -> Evaluated
evaluateProgram (TypedProgram id_div data_div proc_div end) env = 
                evaluateProcedureDivision proc_div (getEnv $
                evaluateDataDivision data_div (getEnv $
                evaluateEndStatement end (getEnv $
                evaluateIdentificationDivision id_div env)))
evaluateProgram (NoneTypeProgram id_div proc_div end) env =
                Evaluated NothingValue env -- TODO: WRITE YOUR CODE HERE

evaluateIdentificationDivision :: IdentificationDivision -> Environment -> Evaluated
evaluateIdentificationDivision (IdentificationDivision name) env =
                Evaluated NothingValue (extendEnv env "program-id" (StrValue name))

evaluateDataDivision :: DataDivision -> Environment -> Evaluated
evaluateDataDivision (DataDivision data_section) = evaluateDataSection data_section

evaluateProcedureDivision :: ProcedureDivision -> Environment -> Evaluated
evaluateProcedureDivision (ProcedureDivision proc_section) = evaluateProcedureSection proc_section

evaluateEndStatement :: EndStatement -> Environment -> Evaluated
evaluateEndStatement NoEnd env = Evaluated NothingValue (popEnv env "program-id")
evaluateEndStatement (HasEnd name) env = if (searchEnv env "program-id") == StrValue name
                                         then Evaluated NothingValue (popEnv env "program-id")
                                         else error ("There is no program called " ++ name ++ "!")

evaluateDataSection :: DataSection -> Environment -> Evaluated
evaluateDataSection (DataSection data_declaration) = evaluateDataDeclarations data_declaration

evaluateProcedureSection :: ProcedureSection -> Environment -> Evaluated
evaluateProcedureSection (SingleParagraph paragraph) env = evaluateParagraph paragraph env
evaluateProcedureSection (MultiParagraph proc_section paragraph) env =
                evaluateParagraph paragraph (getEnv $ evaluateProcedureSection proc_section env)

evaluateDataDeclarations :: DataDeclarations -> Environment -> Evaluated
evaluateDataDeclarations (Declarations data_dec var_dec) env =
                evaluateVariableDeclaration var_dec (getEnv $ evaluateDataDeclarations data_dec env)
evaluateDataDeclarations NoDeclaration env = Evaluated NothingValue env

evaluateParagraph :: Paragraph -> Environment -> Evaluated
evaluateParagraph (Paragraph name statements) env = if name == "main"
                then evaluateStatements statements (extendEnv env name (ParValue statements))
                else Evaluated NothingValue (extendEnv env name (ParValue statements))

-- You should change the below code so if the default value didn't match the datatype,
-- It gives an error in which the expected datatype and the default value provided for it is specified
evaluateVariableDeclaration :: VariableDeclaration -> Environment -> Evaluated
evaluateVariableDeclaration (VarDeclaration 0 name SignedNumber NoDefault) env = error ("Size of the variable " ++ name ++ " cannot be zero!")
evaluateVariableDeclaration (VarDeclaration 1 name SignedNumber NoDefault) env =
                Evaluated NothingValue (extendEnv env name (NumValue 0))
evaluateVariableDeclaration (VarDeclaration size name SignedNumber NoDefault) env =
                Evaluated NothingValue (extendEnv env name (NumList size (floatList size 0)))
evaluateVariableDeclaration (VarDeclaration 0 name SignedNumber (HasDefault exp)) env = error ("Size of the variable " ++ name ++ " cannot be zero!")
evaluateVariableDeclaration (VarDeclaration 1 name SignedNumber (HasDefault exp)) env =
                Evaluated NothingValue (extendEnv env name (getValue $ evaluateExpression exp env))
evaluateVariableDeclaration (VarDeclaration size name SignedNumber (HasDefault exp)) env =
                Evaluated NothingValue (extendEnv env name (NumList size (floatList size (valueToNumber $ getValue $ evaluateExpression exp env))))
evaluateVariableDeclaration (VarDeclaration 0 name AlphanumericString NoDefault) env = error ("Size of the variable " ++ name ++ " cannot be zero!")
evaluateVariableDeclaration (VarDeclaration 1 name AlphanumericString NoDefault) env =
                Evaluated NothingValue (extendEnv env name (StrValue ""))
evaluateVariableDeclaration (VarDeclaration size name AlphanumericString NoDefault) env =
                Evaluated NothingValue (extendEnv env name (StrList size (stringList size "")))
evaluateVariableDeclaration (VarDeclaration 0 name AlphanumericString (HasDefault exp)) env = error ("Size of the variable " ++ name ++ " cannot be zero!")
evaluateVariableDeclaration (VarDeclaration 1 name AlphanumericString (HasDefault exp)) env =
                Evaluated NothingValue (extendEnv env name (getValue $ evaluateExpression exp env))
evaluateVariableDeclaration (VarDeclaration size name AlphanumericString (HasDefault exp)) env =
                Evaluated NothingValue (extendEnv env name (StrList size (stringList size (valueToString $ getValue $ evaluateExpression exp env))))
-- TODO: WRITE YOUR CODE HERE

evaluateStatements :: Statements -> Environment -> Evaluated
evaluateStatements (SingleStatement statement) env = evaluateStatement statement env
evaluateStatements (MultiStatement statements statement) env = let val = evaluateStatements statements env in
                if getValue val == EXIT_VALUE then Evaluated EXIT_VALUE (getEnv val) else evaluateStatement statement (getEnv val)

evaluateStatement :: Statement -> Environment -> Evaluated
evaluateStatement (MoveStatement move) env = evaluateMoveStatement move env
evaluateStatement (ArithmeticStatement arithmetic) env = evaluateArithmeticStatement arithmetic env
evaluateStatement (CompStatement compute) env = evaluateComputeStatement compute env
evaluateStatement (IfStatement if_stmt) env = evaluateIfStatement if_stmt env
evaluateStatement (PerformStatement perform) env = evaluatePerformStatement perform env
evaluateStatement (DeclareFunction func) env = evaluateFunctionStatement func env
evaluateStatement (ShowStatement display_var) env = evaluateDisplayStatement display_var env
evaluateStatement ExitStatement env = Evaluated EXIT_VALUE env

-- You should change the below code so if the expression doesn't match all of the variables datatypes,
-- It gives an error in which the first mismatched variable with the expression datatype is specified
evaluateMoveStatement :: MoveStatement -> Environment -> Evaluated
evaluateMoveStatement (Move exp (SingleVariable (NormalVariable var))) env = Evaluated NothingValue
                (updateEnv env var (getValue $ evaluateExpression exp env))
evaluateMoveStatement (Move exp (SingleVariable (ListVariable var expr))) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx (getValue $ evaluateExpression exp env)))
evaluateMoveStatement (Move exp (MultiVariables vars (NormalVariable var))) env = Evaluated NothingValue (updateEnv
                (getEnv $ evaluateMoveStatement (Move exp vars) env) var (getValue $ evaluateExpression exp env))
evaluateMoveStatement (Move exp (MultiVariables vars (ListVariable var expr))) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv (getEnv $ evaluateMoveStatement (Move exp vars) env) var (listChange
                (searchEnv env var) idx (getValue $ evaluateExpression exp env)))
-- TODO: WRITE YOUR CODE HERE

evaluateArithmeticStatement :: ArithmeticStatement -> Environment -> Evaluated
evaluateArithmeticStatement (AddStatement add) env = evaluateAddStatment add env
evaluateArithmeticStatement (SubtractStatement sub) env = evaluateSubStatement sub env
evaluateArithmeticStatement (MultiplyStatement mult) env = evaluateMultStatement mult env
evaluateArithmeticStatement (DivisionStatement divide) env = evaluateDivStatement divide env

-- You should change the below code so if the expressions datatypes is mismatched with variable datatype,
-- It gives an error in which the first mismatched expression with the variable datatype is specified
evaluateAddStatment :: AddStatement -> Environment -> Evaluated
evaluateAddStatment (SingleAdd exp (NormalVariable var)) env = Evaluated NothingValue
                (updateEnv env var (addValues (searchEnv env var) (getValue $ evaluateExpression exp env)))
evaluateAddStatment (SingleAdd exp (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx
                (addValues (listQuery (searchEnv env var) idx) (getValue $ evaluateExpression exp env))))
evaluateAddStatment (MultiAdd exps (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (sumOfExpressions exps env))
evaluateAddStatment (MultiAdd exps (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx (sumOfExpressions exps env)))
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the expressions datatypes is mismatched with variable datatype,
-- It gives an error in which the first mismatched expression with the variable datatype is specified
evaluateSubStatement :: SubStatement -> Environment -> Evaluated
evaluateSubStatement (SingleSubtract exps exp (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (subtractValues
                (getValue $ evaluateExpression exp env) (sumOfExpressions exps env)))
evaluateSubStatement (SingleSubtract exps exp (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx
                (subtractValues (getValue $ evaluateExpression exp env) (sumOfExpressions exps env))))
evaluateSubStatement (MultiSubtract exps (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (subtractValues
                (searchEnv env var) (sumOfExpressions exps env)))
evaluateSubStatement (MultiSubtract exps (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx
                (subtractValues (listQuery (searchEnv env var) idx) (sumOfExpressions exps env))))
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the expressions datatypes is mismatched with variable datatype,
-- It gives an error in which the first mismatched expression with the variable datatype is specified
evaluateMultStatement :: MultStatement -> Environment -> Evaluated
evaluateMultStatement (MultiplyTo exp (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (multiplyValues
                (searchEnv env var) (getValue $ evaluateExpression exp env)))
evaluateMultStatement (MultiplyTo exp (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx
                (multiplyValues (listQuery (searchEnv env var) idx) (getValue $ evaluateExpression exp env))))
evaluateMultStatement (MultiplyGiving exps (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (productOfExpressions exps env))
evaluateMultStatement (MultiplyGiving exps (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx (productOfExpressions exps env)))
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the expressions datatypes is mismatched with variable datatype,
-- It gives an error in which the first mismatched expression with the variable datatype is specified
evaluateDivStatement :: DivStatement -> Environment -> Evaluated
evaluateDivStatement (DivideInto exp (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (divideValues
                (searchEnv env var) (getValue $ evaluateExpression exp env)))
evaluateDivStatement (DivideInto exp (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx
                (divideValues (listQuery (searchEnv env var) idx) (getValue $ evaluateExpression exp env))))
evaluateDivStatement (DivideGiving exp1 exp2 (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (divideValues
                (getValue $ evaluateExpression exp1 env) (getValue $ evaluateExpression exp2 env)))
evaluateDivStatement (DivideGiving exp1 exp2 (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx
                (divideValues (getValue $ evaluateExpression exp1 env) (getValue $ evaluateExpression exp2 env))))
evaluateDivStatement (DivideRemainder exp1 exp2 (NormalVariable var)) env = Evaluated NothingValue (updateEnv env var (modValues
                (getValue $ evaluateExpression exp1 env) (getValue $ evaluateExpression exp2 env)))
evaluateDivStatement (DivideRemainder exp1 exp2 (ListVariable var expr)) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx
                (modValues (getValue $ evaluateExpression exp1 env) (getValue $ evaluateExpression exp2 env))))
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the expression datatype doesn't match the variable datatype,
-- It gives an error in which the datatype of the variable and the expression is specified
evaluateComputeStatement :: ComputeStatement -> Environment -> Evaluated
evaluateComputeStatement (ComputeStatement (NormalVariable var) exp) env = Evaluated NothingValue
                (updateEnv env var (getValue $ evaluateExpression exp env))
evaluateComputeStatement (ComputeStatement (ListVariable var expr) exp) env = let idx = (getValue $ evaluateExpression expr env) in
                Evaluated NothingValue (updateEnv env var (listChange (searchEnv env var) idx (getValue $ evaluateExpression exp env)))
-- TODO: WRITE YOUR CODE HERE

evaluateIfStatement :: IfStatement -> Environment -> Evaluated
evaluateIfStatement (IfOnlyStatement condition statements) env = if (getValue $ evaluateDisjunction condition env) == CondValue True
                then evaluateStatements statements env
                else Evaluated NothingValue env
evaluateIfStatement (IfElseStatement condition stmts1 stmts2) env = if (getValue $ evaluateDisjunction condition env) == CondValue True
                then evaluateStatements stmts1 env
                else evaluateStatements stmts2 env

performHelper :: String -> Value -> Value -> Value -> Statements -> Environment -> Evaluated
performHelper var val1 val2 val3 statements env = if val1 < val2
                then let eval = evaluateStatements statements (extendUpdateEnv env var val1) in
                    if getValue eval == EXIT_VALUE then Evaluated NothingValue (getEnv eval)
                    else performHelper var (addValues val1 val3) val2 val3 statements (getEnv eval)
                else Evaluated NothingValue env

-- You should change the below code so if the expression datatype is not a number,
-- It gives an error in which the expressions value is specified
evaluatePerformStatement :: PerformStatement -> Environment -> Evaluated
evaluatePerformStatement (ConditionalPerform condition statements) env = if (getValue $ evaluateDisjunction condition env) == CondValue True
                then let eval = evaluateStatements statements env in
                    if getValue eval == EXIT_VALUE then Evaluated NothingValue (getEnv eval)
                    else evaluatePerformStatement (ConditionalPerform condition statements) (getEnv eval)
                else Evaluated NothingValue env
evaluatePerformStatement (RangePerform var exp1 exp2 (HasStep exp3) statements) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                                                                          val2 = (getValue $ evaluateExpression exp2 env)
                                                                                          val3 = (getValue $ evaluateExpression exp3 env) in
                performHelper var val1 val2 val3 statements env
evaluatePerformStatement (RangePerform var exp1 exp2 HasNoStep statements) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                                                                     val2 = (getValue $ evaluateExpression exp2 env) in
                performHelper var val1 val2 (NumValue 1) statements env
evaluatePerformStatement (ParagraphPerform var) env = let eval = evaluateStatements (valueToParagraphStatements (searchEnv env var)) env in
                                                                if getValue eval == EXIT_VALUE then Evaluated NothingValue (getEnv eval)
                                                                else eval
-- TODO: WRITE YOUR CODE HERE

evaluateFunctionStatement :: FunctionStatement -> Environment -> Evaluated
evaluateFunctionStatement (FunctionStatement var vars exp) env = Evaluated NothingValue (extendEnv env var (FunValue vars exp env))

evaluateDisplayStatement :: DisplayStatement -> Environment -> Evaluated
evaluateDisplayStatement (DisplayStatement exp) env = let val = getValue $ evaluateExpression exp env in
                Evaluated NothingValue (updateEnv env "_prints_" (concatLists
                    (searchEnv env "_prints_") (StrList 1 [valueToString val])))

evaluateDisjunction :: Disjunction -> Environment -> Evaluated
evaluateDisjunction (HasNoOr con) env = evaluateConjunction con env
evaluateDisjunction (HasOr dis con) env = let val1 = (getValue $ evaluateDisjunction dis env)
                                              val2 = (getValue $ evaluateConjunction con env) in
                Evaluated (logicalOperationOnValues (||) val1 val2) env

evaluateConjunction :: Conjunction -> Environment -> Evaluated
evaluateConjunction (HasNoAnd inv) env = evaluateInversion inv env
evaluateConjunction (HasAnd con inv) env = let val1 = (getValue $ evaluateConjunction con env)
                                               val2 = (getValue $ evaluateInversion inv env) in
                Evaluated (logicalOperationOnValues (&&) val1 val2) env

evaluateInversion :: Inversion -> Environment -> Evaluated
evaluateInversion (HasNoInversion comp) env = evaluateComparison comp env
evaluateInversion (HasInversion inv) env = Evaluated (CondValue (not $ valueToBool $ getValue $ evaluateInversion inv env)) env

evaluateComparison :: Comparison -> Environment -> Evaluated
evaluateComparison (EqualComparison eq) env = evaluateEquality eq env
evaluateComparison (NotEqualComparison eq) env = evaluateEquality eq env
evaluateComparison (LessThanComparison uneq) env = evaluateUnequality uneq env
evaluateComparison (LessThanOrEqualComparison uneq) env = evaluateUnequality uneq env
evaluateComparison (GreaterThanComparison uneq) env = evaluateUnequality uneq env
evaluateComparison (GreaterThanOrEqualComparison uneq) env = evaluateUnequality uneq env

-- You should change the below code so if the two expressions had different datatypes,
-- It gives an error in which the value of the expressions is specified
evaluateEquality :: Equality -> Environment -> Evaluated
evaluateEquality (IsEq exp1 exp2) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                            val2 = (getValue $ evaluateExpression exp2 env) in
                Evaluated (CondValue (val1 == val2)) env
evaluateEquality (IsNotEq exp1 exp2) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                               val2 = (getValue $ evaluateExpression exp2 env) in
                Evaluated (CondValue (val1 /= val2)) env
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the two expressions had different datatypes,
-- It gives an error in which the value of the expressions is specified
evaluateUnequality :: Unequality -> Environment -> Evaluated
evaluateUnequality (IsLessThan exp1 exp2) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                                    val2 = (getValue $ evaluateExpression exp2 env) in
                Evaluated (CondValue (val1 < val2)) env
evaluateUnequality (IsLessThanOrEqual exp1 exp2) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                                           val2 = (getValue $ evaluateExpression exp2 env) in
                Evaluated (CondValue (val1 <= val2)) env
evaluateUnequality (IsGreaterThan exp1 exp2) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                                       val2 = (getValue $ evaluateExpression exp2 env) in
                Evaluated (CondValue (val1 > val2)) env
evaluateUnequality (IsGreaterThanOrEqual exp1 exp2) env = let val1 = (getValue $ evaluateExpression exp1 env)
                                                              val2 = (getValue $ evaluateExpression exp2 env) in
                Evaluated (CondValue (val1 >= val2)) env
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the two expressions had different datatypes,
-- It gives an error in which the value of the expressions is specified
evaluateExpression :: Expression -> Environment -> Evaluated
evaluateExpression (ConditionalExpression cond exp1 exp2) env = if (getValue $ evaluateDisjunction cond env) == CondValue True
                then evaluateExpression exp1 env
                else evaluateExpression exp2 env
evaluateExpression (EmptySum sum) env = evaluateSum sum env
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the two expressions had different datatypes,
-- It gives an error in which the value of the expressions is specified
evaluateSum :: Sum -> Environment -> Evaluated
evaluateSum (AddSum sum term) env = let val1 = (getValue $ evaluateSum sum env)
                                        val2 = (getValue $ evaluateTerm term env) in
                Evaluated (addValues val1 val2) env
evaluateSum (SubtractSum sum term) env = let val1 = (getValue $ evaluateSum sum env)
                                             val2 = (getValue $ evaluateTerm term env) in
                Evaluated (subtractValues val1 val2) env
evaluateSum (EmptyTerm term) env = evaluateTerm term env
-- TODO: WRITE YOUR CODE HERE

-- You should change the below code so if the two expressions had different datatypes,
-- It gives an error in which the value of the expressions is specified
evaluateTerm :: Term -> Environment -> Evaluated
evaluateTerm (MultiplyTerm term factor) env = let val1 = (getValue $ evaluateTerm term env)
                                                  val2 = (getValue $ evaluateFactor factor env) in
                Evaluated (multiplyValues val1 val2) env
evaluateTerm (DivideTerm term factor) env = let val1 = (getValue $ evaluateTerm term env)
                                                val2 = (getValue $ evaluateFactor factor env) in
                Evaluated (divideValues val1 val2) env
evaluateTerm (EmptyFactor factor) env = evaluateFactor factor env
-- TODO: WRITE YOUR CODE HERE

evaluateFactor :: Factor -> Environment -> Evaluated
evaluateFactor (PositiveFactor factor) env = evaluateFactor factor env
evaluateFactor (NegativeFactor factor) env = Evaluated (subtractValues (NumValue 0) (getValue $ evaluateFactor factor env)) env
evaluateFactor (ParenthesesExpression exp) env = evaluateExpression exp env
evaluateFactor (EmptyElement element) env = evaluateElement element env

appendExpressions :: Environment -> Environment -> Variables -> Expressions -> Environment
appendExpressions env func_env (SingleVariable (NormalVariable var)) (SingleExpression exp) =
                extendUpdateEnv func_env var (getValue $ evaluateExpression exp env)
appendExpressions env func_env (SingleVariable (ListVariable var exp)) (SingleExpression expr) =
                error "Function argument can't named like a list!"
appendExpressions env func_env (MultiVariables vars (NormalVariable var)) (MultiExpressions exps exp) =
                extendUpdateEnv (appendExpressions env func_env vars exps) var (getValue $ evaluateExpression exp env)
appendExpressions env func_env (MultiVariables vars (ListVariable var exp)) (MultiExpressions exps expr) =
                error "Function argument can't named like a list!"

evaluateVariable :: Variable -> Environment -> Evaluated
evaluateVariable (NormalVariable var) env = Evaluated (searchEnv env var) env
evaluateVariable (ListVariable var exp) env = Evaluated (listQuery (searchEnv env var) (getValue $ evaluateExpression exp env)) env

evaluateElement :: Element -> Environment -> Evaluated
evaluateElement (VarElement variable) env = evaluateVariable variable env
evaluateElement (FunctionElement var exps) env = let func = searchEnv env var
                                                     var_num = (variableCount $ valueToFunctionVariables func)
                                                     exp_num = expressionCount exps in
                if var_num == exp_num then evaluateExpression (valueToFunctionOutput func) (appendExpressions
                env (valueToFunctionEnvironment func) (valueToFunctionVariables func) exps)
                else error ("Function " ++ var ++ " needs " ++ show var_num ++ " arguments but " ++ show exp_num ++ " are provided!")
evaluateElement (ValueElement (StringValue x)) env = Evaluated (StrValue x) env
evaluateElement (ValueElement (NumberValue x)) env = Evaluated (NumValue x) env

printValues :: Value -> IO ()
printValues (StrList 0 _) = putStrLn ""
printValues (StrList n (x:xs)) = do putStrLn x
                                    printValues (StrList (n-1) xs)

main :: IO ()
main = do
    text <- readFile "code.txt"
    printValues (searchEnv (getEnv $ evaluateProgram (Parser.parser $ Lexer.alexScanTokens text) initEnv) "_prints_")
