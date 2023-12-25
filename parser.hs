{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33
	| HappyAbsSyn34 t34
	| HappyAbsSyn35 t35
	| HappyAbsSyn36 t36
	| HappyAbsSyn37 t37
	| HappyAbsSyn38 t38
	| HappyAbsSyn39 t39
	| HappyAbsSyn40 t40
	| HappyAbsSyn41 t41
	| HappyAbsSyn42 t42
	| HappyAbsSyn43 t43
	| HappyAbsSyn44 t44
	| HappyAbsSyn45 t45
	| HappyAbsSyn46 t46
	| HappyAbsSyn47 t47
	| HappyAbsSyn48 t48

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,866) ([0,0,0,4,0,0,0,0,0,0,1,0,0,0,0,0,32768,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1536,0,0,0,0,0,0,256,0,0,0,0,0,0,128,0,0,0,0,0,0,64,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,16384,0,0,0,0,4,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,8,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,32,0,0,0,2048,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,51884,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,256,0,0,0,44032,25802,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,0,0,12288,1544,0,0,12288,0,0,3072,386,0,0,3072,0,0,33536,96,0,0,768,0,0,8384,24,0,0,192,0,0,2096,6,0,0,0,0,0,0,1,0,0,12,0,512,24707,0,0,0,0,12971,31,4096,0,0,0,0,0,0,1024,0,0,12288,0,0,3072,386,0,0,0,32,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,0,0,0,0,0,0,49152,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48,0,0,33292,1,0,0,12,0,0,24707,0,0,0,3,0,49280,6176,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,16384,0,0,0,0,43776,6962,0,0,0,0,192,0,8192,2096,6,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,16384,32,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,984,0,0,0,3072,0,0,33538,96,0,0,0,0,0,4096,0,0,0,0,0,0,8192,0,0,0,0,16384,0,128,0,0,0,0,64,0,32,0,0,0,0,256,0,0,0,0,0,0,16,0,2,0,0,0,0,0,0,0,0,0,0,16384,0,8192,0,0,0,0,1024,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,64,0,0,0,0,0,0,16,0,0,192,0,0,2096,6,0,0,48,0,0,33292,1,0,0,0,0,0,16384,0,0,0,0,0,0,4096,0,0,49152,0,0,12288,1544,0,0,12288,0,0,3072,386,0,0,3072,0,0,33536,96,0,0,768,0,0,8384,24,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,12,0,0,24707,0,0,0,3,0,49152,6176,0,0,49152,0,0,12288,1544,0,0,12288,0,0,3072,386,0,0,3072,0,0,33536,96,0,0,768,0,32768,8384,24,0,0,0,43712,1612,0,0,0,0,48,0,2048,33292,1,0,0,0,256,0,0,0,0,0,0,12971,57,0,0,0,49152,0,0,12320,1544,0,0,0,0,0,0,256,0,0,3072,0,0,33536,96,0,0,0,0,8192,16384,0,0,0,0,0,24576,4111,0,0,0,0,0,0,0,0,0,0,12,0,0,24707,0,0,0,0,0,0,0,0,0,49152,0,0,12288,1544,0,0,12288,0,0,3072,386,0,0,3072,0,0,33536,96,0,0,768,0,0,8384,24,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,1152,0,0,0,0,0,0,0,0,0,0,0,0,512,8,0,0,0,0,0,8,0,0,0,0,45058,37674,1,0,0,0,3072,0,0,33536,96,0,0,0,0,16384,0,0,0,0,0,43712,1644,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,768,0,0,8384,24,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,256,0,0,0,0,0,0,64,0,0,0,0,0,0,16,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12971,25,0,0,0,0,0,1,0,0,0,0,0,0,0,2048,0,0,0,3072,0,0,33536,96,0,0,0,0,0,0,0,0,0,192,0,0,2096,6,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,4096,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,768,0,0,8384,24,0,0,2048,43712,1612,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,192,0,0,2096,6,0,0,0,6,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44032,25802,0,0,0,0,768,0,0,8384,24,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,12971,25,0,0,0,0,0,0,0,1,0,0,12288,0,0,3072,386,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Program","IdentificationDivision","DataDivision","ProcedureDivision","EndStatement","DataSection","ProcedureSection","DataDeclarations","Paragraph","VariableDeclaration","DataType","DefaultValue","Value","Statements","Statement","MoveStmt","ArithmeticStmt","Variable","AddStmt","SubStmt","MultStmt","DivStmt","ComputeStmt","IfStmt","PerformStmt","Step","FunctionStmt","DisplayStmt","Variables","Expressions","Disjunction","Conjunction","Inversion","Comparison","Eq","NotEq","Lt","Lte","Gt","Gte","Expression","Sum","Term","Factor","Element","'number'","'integer'","'identification'","'data'","'procedure'","'end'","'division'","'id'","'program'","'working'","'storage'","'section'","'pic'","'s9'","'a'","'value'","'exit'","'move'","'to'","'add'","'giving'","'subtract'","'from'","'multiply'","'by'","'divide'","'into'","'remainder'","'compute'","'if'","'then'","'else'","'perform'","'until'","'varying'","'function'","'display'","'or'","'and'","'not'","'equals'","'=>'","'<='","'<'","'>='","'>'","'+'","'-'","'*'","'/'","'.'","','","'='","'('","')'","'['","']'","'?'","':'","'string'","'var'","%eof"]
        bit_start = st Prelude.* 110
        bit_end = (st Prelude.+ 1) Prelude.* 110
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..109]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (51) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (51) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (52) = happyShift action_8
action_2 (6) = happyGoto action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (55) = happyShift action_10
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (110) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (52) = happyShift action_8
action_5 (53) = happyShift action_9
action_5 (6) = happyGoto action_6
action_5 (7) = happyGoto action_7
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (53) = happyShift action_9
action_6 (7) = happyGoto action_16
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (54) = happyShift action_15
action_7 (8) = happyGoto action_14
action_7 _ = happyReduce_7

action_8 (55) = happyShift action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (55) = happyShift action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (99) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (57) = happyShift action_21
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (99) = happyShift action_20
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (99) = happyShift action_19
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_2

action_15 (57) = happyShift action_18
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (54) = happyShift action_15
action_16 (8) = happyGoto action_17
action_16 _ = happyReduce_7

action_17 _ = happyReduce_1

action_18 (99) = happyShift action_28
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (58) = happyShift action_27
action_19 (9) = happyGoto action_26
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (109) = happyShift action_25
action_20 (10) = happyGoto action_23
action_20 (12) = happyGoto action_24
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (96) = happyShift action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (56) = happyShift action_33
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (109) = happyShift action_25
action_23 (12) = happyGoto action_32
action_23 _ = happyReduce_5

action_24 _ = happyReduce_9

action_25 (99) = happyShift action_31
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_4

action_27 (96) = happyShift action_30
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (109) = happyShift action_29
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_6

action_30 (59) = happyShift action_59
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (65) = happyShift action_48
action_31 (66) = happyShift action_49
action_31 (68) = happyShift action_50
action_31 (70) = happyShift action_51
action_31 (72) = happyShift action_52
action_31 (74) = happyShift action_53
action_31 (77) = happyShift action_54
action_31 (78) = happyShift action_55
action_31 (81) = happyShift action_56
action_31 (84) = happyShift action_57
action_31 (85) = happyShift action_58
action_31 (17) = happyGoto action_35
action_31 (18) = happyGoto action_36
action_31 (19) = happyGoto action_37
action_31 (20) = happyGoto action_38
action_31 (22) = happyGoto action_39
action_31 (23) = happyGoto action_40
action_31 (24) = happyGoto action_41
action_31 (25) = happyGoto action_42
action_31 (26) = happyGoto action_43
action_31 (27) = happyGoto action_44
action_31 (28) = happyGoto action_45
action_31 (30) = happyGoto action_46
action_31 (31) = happyGoto action_47
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_10

action_33 (99) = happyShift action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (109) = happyShift action_104
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (65) = happyShift action_48
action_35 (66) = happyShift action_49
action_35 (68) = happyShift action_50
action_35 (70) = happyShift action_51
action_35 (72) = happyShift action_52
action_35 (74) = happyShift action_53
action_35 (77) = happyShift action_54
action_35 (78) = happyShift action_55
action_35 (81) = happyShift action_56
action_35 (84) = happyShift action_57
action_35 (85) = happyShift action_58
action_35 (18) = happyGoto action_103
action_35 (19) = happyGoto action_37
action_35 (20) = happyGoto action_38
action_35 (22) = happyGoto action_39
action_35 (23) = happyGoto action_40
action_35 (24) = happyGoto action_41
action_35 (25) = happyGoto action_42
action_35 (26) = happyGoto action_43
action_35 (27) = happyGoto action_44
action_35 (28) = happyGoto action_45
action_35 (30) = happyGoto action_46
action_35 (31) = happyGoto action_47
action_35 _ = happyReduce_13

action_36 (99) = happyShift action_102
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_24

action_38 _ = happyReduce_25

action_39 _ = happyReduce_33

action_40 _ = happyReduce_34

action_41 _ = happyReduce_35

action_42 _ = happyReduce_36

action_43 _ = happyReduce_26

action_44 _ = happyReduce_27

action_45 _ = happyReduce_28

action_46 _ = happyReduce_29

action_47 _ = happyReduce_30

action_48 _ = happyReduce_31

action_49 (49) = happyShift action_68
action_49 (50) = happyShift action_69
action_49 (95) = happyShift action_70
action_49 (96) = happyShift action_71
action_49 (102) = happyShift action_72
action_49 (108) = happyShift action_73
action_49 (109) = happyShift action_74
action_49 (16) = happyGoto action_61
action_49 (21) = happyGoto action_62
action_49 (44) = happyGoto action_101
action_49 (45) = happyGoto action_64
action_49 (46) = happyGoto action_65
action_49 (47) = happyGoto action_66
action_49 (48) = happyGoto action_67
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (49) = happyShift action_68
action_50 (50) = happyShift action_69
action_50 (95) = happyShift action_70
action_50 (96) = happyShift action_71
action_50 (102) = happyShift action_72
action_50 (108) = happyShift action_73
action_50 (109) = happyShift action_74
action_50 (16) = happyGoto action_61
action_50 (21) = happyGoto action_62
action_50 (33) = happyGoto action_99
action_50 (44) = happyGoto action_100
action_50 (45) = happyGoto action_64
action_50 (46) = happyGoto action_65
action_50 (47) = happyGoto action_66
action_50 (48) = happyGoto action_67
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (49) = happyShift action_68
action_51 (50) = happyShift action_69
action_51 (95) = happyShift action_70
action_51 (96) = happyShift action_71
action_51 (102) = happyShift action_72
action_51 (108) = happyShift action_73
action_51 (109) = happyShift action_74
action_51 (16) = happyGoto action_61
action_51 (21) = happyGoto action_62
action_51 (33) = happyGoto action_97
action_51 (44) = happyGoto action_98
action_51 (45) = happyGoto action_64
action_51 (46) = happyGoto action_65
action_51 (47) = happyGoto action_66
action_51 (48) = happyGoto action_67
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (49) = happyShift action_68
action_52 (50) = happyShift action_69
action_52 (95) = happyShift action_70
action_52 (96) = happyShift action_71
action_52 (102) = happyShift action_72
action_52 (108) = happyShift action_73
action_52 (109) = happyShift action_74
action_52 (16) = happyGoto action_61
action_52 (21) = happyGoto action_62
action_52 (33) = happyGoto action_95
action_52 (44) = happyGoto action_96
action_52 (45) = happyGoto action_64
action_52 (46) = happyGoto action_65
action_52 (47) = happyGoto action_66
action_52 (48) = happyGoto action_67
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (49) = happyShift action_68
action_53 (50) = happyShift action_69
action_53 (95) = happyShift action_70
action_53 (96) = happyShift action_71
action_53 (102) = happyShift action_72
action_53 (108) = happyShift action_73
action_53 (109) = happyShift action_74
action_53 (16) = happyGoto action_61
action_53 (21) = happyGoto action_62
action_53 (44) = happyGoto action_94
action_53 (45) = happyGoto action_64
action_53 (46) = happyGoto action_65
action_53 (47) = happyGoto action_66
action_53 (48) = happyGoto action_67
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (109) = happyShift action_93
action_54 (21) = happyGoto action_92
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (49) = happyShift action_68
action_55 (50) = happyShift action_69
action_55 (88) = happyShift action_91
action_55 (95) = happyShift action_70
action_55 (96) = happyShift action_71
action_55 (102) = happyShift action_72
action_55 (108) = happyShift action_73
action_55 (109) = happyShift action_74
action_55 (16) = happyGoto action_61
action_55 (21) = happyGoto action_62
action_55 (34) = happyGoto action_80
action_55 (35) = happyGoto action_81
action_55 (36) = happyGoto action_82
action_55 (37) = happyGoto action_83
action_55 (38) = happyGoto action_84
action_55 (39) = happyGoto action_85
action_55 (40) = happyGoto action_86
action_55 (41) = happyGoto action_87
action_55 (42) = happyGoto action_88
action_55 (43) = happyGoto action_89
action_55 (44) = happyGoto action_90
action_55 (45) = happyGoto action_64
action_55 (46) = happyGoto action_65
action_55 (47) = happyGoto action_66
action_55 (48) = happyGoto action_67
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (65) = happyShift action_48
action_56 (66) = happyShift action_49
action_56 (68) = happyShift action_50
action_56 (70) = happyShift action_51
action_56 (72) = happyShift action_52
action_56 (74) = happyShift action_53
action_56 (77) = happyShift action_54
action_56 (78) = happyShift action_55
action_56 (81) = happyShift action_56
action_56 (82) = happyShift action_77
action_56 (83) = happyShift action_78
action_56 (84) = happyShift action_57
action_56 (85) = happyShift action_58
action_56 (109) = happyShift action_79
action_56 (17) = happyGoto action_76
action_56 (18) = happyGoto action_36
action_56 (19) = happyGoto action_37
action_56 (20) = happyGoto action_38
action_56 (22) = happyGoto action_39
action_56 (23) = happyGoto action_40
action_56 (24) = happyGoto action_41
action_56 (25) = happyGoto action_42
action_56 (26) = happyGoto action_43
action_56 (27) = happyGoto action_44
action_56 (28) = happyGoto action_45
action_56 (30) = happyGoto action_46
action_56 (31) = happyGoto action_47
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (109) = happyShift action_75
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (49) = happyShift action_68
action_58 (50) = happyShift action_69
action_58 (95) = happyShift action_70
action_58 (96) = happyShift action_71
action_58 (102) = happyShift action_72
action_58 (108) = happyShift action_73
action_58 (109) = happyShift action_74
action_58 (16) = happyGoto action_61
action_58 (21) = happyGoto action_62
action_58 (44) = happyGoto action_63
action_58 (45) = happyGoto action_64
action_58 (46) = happyGoto action_65
action_58 (47) = happyGoto action_66
action_58 (48) = happyGoto action_67
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (60) = happyShift action_60
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (99) = happyShift action_141
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_95

action_62 _ = happyReduce_93

action_63 _ = happyReduce_58

action_64 (95) = happyShift action_139
action_64 (96) = happyShift action_140
action_64 _ = happyReduce_82

action_65 (97) = happyShift action_137
action_65 (98) = happyShift action_138
action_65 _ = happyReduce_85

action_66 _ = happyReduce_88

action_67 _ = happyReduce_92

action_68 _ = happyReduce_20

action_69 _ = happyReduce_21

action_70 (49) = happyShift action_68
action_70 (50) = happyShift action_69
action_70 (95) = happyShift action_70
action_70 (96) = happyShift action_71
action_70 (102) = happyShift action_135
action_70 (108) = happyShift action_73
action_70 (109) = happyShift action_74
action_70 (16) = happyGoto action_61
action_70 (21) = happyGoto action_62
action_70 (47) = happyGoto action_136
action_70 (48) = happyGoto action_67
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (49) = happyShift action_68
action_71 (50) = happyShift action_69
action_71 (95) = happyShift action_70
action_71 (96) = happyShift action_71
action_71 (102) = happyShift action_135
action_71 (108) = happyShift action_73
action_71 (109) = happyShift action_74
action_71 (16) = happyGoto action_61
action_71 (21) = happyGoto action_62
action_71 (47) = happyGoto action_134
action_71 (48) = happyGoto action_67
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (49) = happyShift action_68
action_72 (50) = happyShift action_69
action_72 (88) = happyShift action_91
action_72 (95) = happyShift action_70
action_72 (96) = happyShift action_71
action_72 (102) = happyShift action_72
action_72 (108) = happyShift action_73
action_72 (109) = happyShift action_74
action_72 (16) = happyGoto action_61
action_72 (21) = happyGoto action_62
action_72 (34) = happyGoto action_132
action_72 (35) = happyGoto action_81
action_72 (36) = happyGoto action_82
action_72 (37) = happyGoto action_83
action_72 (38) = happyGoto action_84
action_72 (39) = happyGoto action_85
action_72 (40) = happyGoto action_86
action_72 (41) = happyGoto action_87
action_72 (42) = happyGoto action_88
action_72 (43) = happyGoto action_89
action_72 (44) = happyGoto action_133
action_72 (45) = happyGoto action_64
action_72 (46) = happyGoto action_65
action_72 (47) = happyGoto action_66
action_72 (48) = happyGoto action_67
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_19

action_74 (102) = happyShift action_131
action_74 (104) = happyShift action_115
action_74 _ = happyReduce_37

action_75 (101) = happyShift action_130
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (65) = happyShift action_48
action_76 (66) = happyShift action_49
action_76 (68) = happyShift action_50
action_76 (70) = happyShift action_51
action_76 (72) = happyShift action_52
action_76 (74) = happyShift action_53
action_76 (77) = happyShift action_54
action_76 (78) = happyShift action_55
action_76 (81) = happyShift action_56
action_76 (82) = happyShift action_129
action_76 (84) = happyShift action_57
action_76 (85) = happyShift action_58
action_76 (18) = happyGoto action_103
action_76 (19) = happyGoto action_37
action_76 (20) = happyGoto action_38
action_76 (22) = happyGoto action_39
action_76 (23) = happyGoto action_40
action_76 (24) = happyGoto action_41
action_76 (25) = happyGoto action_42
action_76 (26) = happyGoto action_43
action_76 (27) = happyGoto action_44
action_76 (28) = happyGoto action_45
action_76 (30) = happyGoto action_46
action_76 (31) = happyGoto action_47
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (49) = happyShift action_68
action_77 (50) = happyShift action_69
action_77 (88) = happyShift action_91
action_77 (95) = happyShift action_70
action_77 (96) = happyShift action_71
action_77 (102) = happyShift action_72
action_77 (108) = happyShift action_73
action_77 (109) = happyShift action_74
action_77 (16) = happyGoto action_61
action_77 (21) = happyGoto action_62
action_77 (34) = happyGoto action_128
action_77 (35) = happyGoto action_81
action_77 (36) = happyGoto action_82
action_77 (37) = happyGoto action_83
action_77 (38) = happyGoto action_84
action_77 (39) = happyGoto action_85
action_77 (40) = happyGoto action_86
action_77 (41) = happyGoto action_87
action_77 (42) = happyGoto action_88
action_77 (43) = happyGoto action_89
action_77 (44) = happyGoto action_90
action_77 (45) = happyGoto action_64
action_77 (46) = happyGoto action_65
action_77 (47) = happyGoto action_66
action_77 (48) = happyGoto action_67
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (109) = happyShift action_127
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_54

action_80 (79) = happyShift action_125
action_80 (86) = happyShift action_126
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (87) = happyShift action_124
action_81 _ = happyReduce_63

action_82 _ = happyReduce_65

action_83 _ = happyReduce_68

action_84 _ = happyReduce_69

action_85 _ = happyReduce_70

action_86 _ = happyReduce_71

action_87 _ = happyReduce_72

action_88 _ = happyReduce_73

action_89 _ = happyReduce_74

action_90 (88) = happyShift action_118
action_90 (89) = happyShift action_119
action_90 (91) = happyShift action_120
action_90 (92) = happyShift action_121
action_90 (93) = happyShift action_122
action_90 (94) = happyShift action_123
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (49) = happyShift action_68
action_91 (50) = happyShift action_69
action_91 (88) = happyShift action_91
action_91 (95) = happyShift action_70
action_91 (96) = happyShift action_71
action_91 (102) = happyShift action_72
action_91 (108) = happyShift action_73
action_91 (109) = happyShift action_74
action_91 (16) = happyGoto action_61
action_91 (21) = happyGoto action_62
action_91 (36) = happyGoto action_117
action_91 (37) = happyGoto action_83
action_91 (38) = happyGoto action_84
action_91 (39) = happyGoto action_85
action_91 (40) = happyGoto action_86
action_91 (41) = happyGoto action_87
action_91 (42) = happyGoto action_88
action_91 (43) = happyGoto action_89
action_91 (44) = happyGoto action_90
action_91 (45) = happyGoto action_64
action_91 (46) = happyGoto action_65
action_91 (47) = happyGoto action_66
action_91 (48) = happyGoto action_67
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (101) = happyShift action_116
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (104) = happyShift action_115
action_93 _ = happyReduce_37

action_94 (75) = happyShift action_113
action_94 (100) = happyShift action_114
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (69) = happyShift action_112
action_95 (100) = happyShift action_109
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (73) = happyShift action_111
action_96 _ = happyReduce_62

action_97 (71) = happyShift action_110
action_97 (100) = happyShift action_109
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_62

action_99 (69) = happyShift action_108
action_99 (100) = happyShift action_109
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (67) = happyShift action_107
action_100 _ = happyReduce_62

action_101 (67) = happyShift action_106
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_23

action_103 (99) = happyShift action_105
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_3

action_105 _ = happyReduce_22

action_106 (109) = happyShift action_93
action_106 (21) = happyGoto action_151
action_106 (32) = happyGoto action_177
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (109) = happyShift action_93
action_107 (21) = happyGoto action_176
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (109) = happyShift action_93
action_108 (21) = happyGoto action_175
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (49) = happyShift action_68
action_109 (50) = happyShift action_69
action_109 (95) = happyShift action_70
action_109 (96) = happyShift action_71
action_109 (102) = happyShift action_72
action_109 (108) = happyShift action_73
action_109 (109) = happyShift action_74
action_109 (16) = happyGoto action_61
action_109 (21) = happyGoto action_62
action_109 (44) = happyGoto action_174
action_109 (45) = happyGoto action_64
action_109 (46) = happyGoto action_65
action_109 (47) = happyGoto action_66
action_109 (48) = happyGoto action_67
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (49) = happyShift action_68
action_110 (50) = happyShift action_69
action_110 (95) = happyShift action_70
action_110 (96) = happyShift action_71
action_110 (102) = happyShift action_72
action_110 (108) = happyShift action_73
action_110 (109) = happyShift action_74
action_110 (16) = happyGoto action_61
action_110 (21) = happyGoto action_172
action_110 (44) = happyGoto action_173
action_110 (45) = happyGoto action_64
action_110 (46) = happyGoto action_65
action_110 (47) = happyGoto action_66
action_110 (48) = happyGoto action_67
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (109) = happyShift action_93
action_111 (21) = happyGoto action_171
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (109) = happyShift action_93
action_112 (21) = happyGoto action_170
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (49) = happyShift action_68
action_113 (50) = happyShift action_69
action_113 (95) = happyShift action_70
action_113 (96) = happyShift action_71
action_113 (102) = happyShift action_72
action_113 (108) = happyShift action_73
action_113 (109) = happyShift action_74
action_113 (16) = happyGoto action_61
action_113 (21) = happyGoto action_168
action_113 (44) = happyGoto action_169
action_113 (45) = happyGoto action_64
action_113 (46) = happyGoto action_65
action_113 (47) = happyGoto action_66
action_113 (48) = happyGoto action_67
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (49) = happyShift action_68
action_114 (50) = happyShift action_69
action_114 (95) = happyShift action_70
action_114 (96) = happyShift action_71
action_114 (102) = happyShift action_72
action_114 (108) = happyShift action_73
action_114 (109) = happyShift action_74
action_114 (16) = happyGoto action_61
action_114 (21) = happyGoto action_62
action_114 (44) = happyGoto action_167
action_114 (45) = happyGoto action_64
action_114 (46) = happyGoto action_65
action_114 (47) = happyGoto action_66
action_114 (48) = happyGoto action_67
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (49) = happyShift action_68
action_115 (50) = happyShift action_69
action_115 (95) = happyShift action_70
action_115 (96) = happyShift action_71
action_115 (102) = happyShift action_72
action_115 (108) = happyShift action_73
action_115 (109) = happyShift action_74
action_115 (16) = happyGoto action_61
action_115 (21) = happyGoto action_62
action_115 (44) = happyGoto action_166
action_115 (45) = happyGoto action_64
action_115 (46) = happyGoto action_65
action_115 (47) = happyGoto action_66
action_115 (48) = happyGoto action_67
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (49) = happyShift action_68
action_116 (50) = happyShift action_69
action_116 (95) = happyShift action_70
action_116 (96) = happyShift action_71
action_116 (102) = happyShift action_72
action_116 (108) = happyShift action_73
action_116 (109) = happyShift action_74
action_116 (16) = happyGoto action_61
action_116 (21) = happyGoto action_62
action_116 (44) = happyGoto action_165
action_116 (45) = happyGoto action_64
action_116 (46) = happyGoto action_65
action_116 (47) = happyGoto action_66
action_116 (48) = happyGoto action_67
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_67

action_118 (89) = happyShift action_164
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (49) = happyShift action_68
action_119 (50) = happyShift action_69
action_119 (95) = happyShift action_70
action_119 (96) = happyShift action_71
action_119 (102) = happyShift action_72
action_119 (108) = happyShift action_73
action_119 (109) = happyShift action_74
action_119 (16) = happyGoto action_61
action_119 (21) = happyGoto action_62
action_119 (44) = happyGoto action_163
action_119 (45) = happyGoto action_64
action_119 (46) = happyGoto action_65
action_119 (47) = happyGoto action_66
action_119 (48) = happyGoto action_67
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (49) = happyShift action_68
action_120 (50) = happyShift action_69
action_120 (95) = happyShift action_70
action_120 (96) = happyShift action_71
action_120 (102) = happyShift action_72
action_120 (108) = happyShift action_73
action_120 (109) = happyShift action_74
action_120 (16) = happyGoto action_61
action_120 (21) = happyGoto action_62
action_120 (44) = happyGoto action_162
action_120 (45) = happyGoto action_64
action_120 (46) = happyGoto action_65
action_120 (47) = happyGoto action_66
action_120 (48) = happyGoto action_67
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (49) = happyShift action_68
action_121 (50) = happyShift action_69
action_121 (95) = happyShift action_70
action_121 (96) = happyShift action_71
action_121 (102) = happyShift action_72
action_121 (108) = happyShift action_73
action_121 (109) = happyShift action_74
action_121 (16) = happyGoto action_61
action_121 (21) = happyGoto action_62
action_121 (44) = happyGoto action_161
action_121 (45) = happyGoto action_64
action_121 (46) = happyGoto action_65
action_121 (47) = happyGoto action_66
action_121 (48) = happyGoto action_67
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (49) = happyShift action_68
action_122 (50) = happyShift action_69
action_122 (95) = happyShift action_70
action_122 (96) = happyShift action_71
action_122 (102) = happyShift action_72
action_122 (108) = happyShift action_73
action_122 (109) = happyShift action_74
action_122 (16) = happyGoto action_61
action_122 (21) = happyGoto action_62
action_122 (44) = happyGoto action_160
action_122 (45) = happyGoto action_64
action_122 (46) = happyGoto action_65
action_122 (47) = happyGoto action_66
action_122 (48) = happyGoto action_67
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (49) = happyShift action_68
action_123 (50) = happyShift action_69
action_123 (95) = happyShift action_70
action_123 (96) = happyShift action_71
action_123 (102) = happyShift action_72
action_123 (108) = happyShift action_73
action_123 (109) = happyShift action_74
action_123 (16) = happyGoto action_61
action_123 (21) = happyGoto action_62
action_123 (44) = happyGoto action_159
action_123 (45) = happyGoto action_64
action_123 (46) = happyGoto action_65
action_123 (47) = happyGoto action_66
action_123 (48) = happyGoto action_67
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (49) = happyShift action_68
action_124 (50) = happyShift action_69
action_124 (88) = happyShift action_91
action_124 (95) = happyShift action_70
action_124 (96) = happyShift action_71
action_124 (102) = happyShift action_72
action_124 (108) = happyShift action_73
action_124 (109) = happyShift action_74
action_124 (16) = happyGoto action_61
action_124 (21) = happyGoto action_62
action_124 (36) = happyGoto action_158
action_124 (37) = happyGoto action_83
action_124 (38) = happyGoto action_84
action_124 (39) = happyGoto action_85
action_124 (40) = happyGoto action_86
action_124 (41) = happyGoto action_87
action_124 (42) = happyGoto action_88
action_124 (43) = happyGoto action_89
action_124 (44) = happyGoto action_90
action_124 (45) = happyGoto action_64
action_124 (46) = happyGoto action_65
action_124 (47) = happyGoto action_66
action_124 (48) = happyGoto action_67
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (65) = happyShift action_48
action_125 (66) = happyShift action_49
action_125 (68) = happyShift action_50
action_125 (70) = happyShift action_51
action_125 (72) = happyShift action_52
action_125 (74) = happyShift action_53
action_125 (77) = happyShift action_54
action_125 (78) = happyShift action_55
action_125 (81) = happyShift action_56
action_125 (84) = happyShift action_57
action_125 (85) = happyShift action_58
action_125 (17) = happyGoto action_157
action_125 (18) = happyGoto action_36
action_125 (19) = happyGoto action_37
action_125 (20) = happyGoto action_38
action_125 (22) = happyGoto action_39
action_125 (23) = happyGoto action_40
action_125 (24) = happyGoto action_41
action_125 (25) = happyGoto action_42
action_125 (26) = happyGoto action_43
action_125 (27) = happyGoto action_44
action_125 (28) = happyGoto action_45
action_125 (30) = happyGoto action_46
action_125 (31) = happyGoto action_47
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (49) = happyShift action_68
action_126 (50) = happyShift action_69
action_126 (88) = happyShift action_91
action_126 (95) = happyShift action_70
action_126 (96) = happyShift action_71
action_126 (102) = happyShift action_72
action_126 (108) = happyShift action_73
action_126 (109) = happyShift action_74
action_126 (16) = happyGoto action_61
action_126 (21) = happyGoto action_62
action_126 (35) = happyGoto action_156
action_126 (36) = happyGoto action_82
action_126 (37) = happyGoto action_83
action_126 (38) = happyGoto action_84
action_126 (39) = happyGoto action_85
action_126 (40) = happyGoto action_86
action_126 (41) = happyGoto action_87
action_126 (42) = happyGoto action_88
action_126 (43) = happyGoto action_89
action_126 (44) = happyGoto action_90
action_126 (45) = happyGoto action_64
action_126 (46) = happyGoto action_65
action_126 (47) = happyGoto action_66
action_126 (48) = happyGoto action_67
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (71) = happyShift action_155
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (65) = happyShift action_48
action_128 (66) = happyShift action_49
action_128 (68) = happyShift action_50
action_128 (70) = happyShift action_51
action_128 (72) = happyShift action_52
action_128 (74) = happyShift action_53
action_128 (77) = happyShift action_54
action_128 (78) = happyShift action_55
action_128 (81) = happyShift action_56
action_128 (84) = happyShift action_57
action_128 (85) = happyShift action_58
action_128 (86) = happyShift action_126
action_128 (17) = happyGoto action_154
action_128 (18) = happyGoto action_36
action_128 (19) = happyGoto action_37
action_128 (20) = happyGoto action_38
action_128 (22) = happyGoto action_39
action_128 (23) = happyGoto action_40
action_128 (24) = happyGoto action_41
action_128 (25) = happyGoto action_42
action_128 (26) = happyGoto action_43
action_128 (27) = happyGoto action_44
action_128 (28) = happyGoto action_45
action_128 (30) = happyGoto action_46
action_128 (31) = happyGoto action_47
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (49) = happyShift action_68
action_129 (50) = happyShift action_69
action_129 (88) = happyShift action_91
action_129 (95) = happyShift action_70
action_129 (96) = happyShift action_71
action_129 (102) = happyShift action_72
action_129 (108) = happyShift action_73
action_129 (109) = happyShift action_74
action_129 (16) = happyGoto action_61
action_129 (21) = happyGoto action_62
action_129 (34) = happyGoto action_153
action_129 (35) = happyGoto action_81
action_129 (36) = happyGoto action_82
action_129 (37) = happyGoto action_83
action_129 (38) = happyGoto action_84
action_129 (39) = happyGoto action_85
action_129 (40) = happyGoto action_86
action_129 (41) = happyGoto action_87
action_129 (42) = happyGoto action_88
action_129 (43) = happyGoto action_89
action_129 (44) = happyGoto action_90
action_129 (45) = happyGoto action_64
action_129 (46) = happyGoto action_65
action_129 (47) = happyGoto action_66
action_129 (48) = happyGoto action_67
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (109) = happyShift action_93
action_130 (21) = happyGoto action_151
action_130 (32) = happyGoto action_152
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (49) = happyShift action_68
action_131 (50) = happyShift action_69
action_131 (95) = happyShift action_70
action_131 (96) = happyShift action_71
action_131 (102) = happyShift action_72
action_131 (108) = happyShift action_73
action_131 (109) = happyShift action_74
action_131 (16) = happyGoto action_61
action_131 (21) = happyGoto action_62
action_131 (33) = happyGoto action_150
action_131 (44) = happyGoto action_98
action_131 (45) = happyGoto action_64
action_131 (46) = happyGoto action_65
action_131 (47) = happyGoto action_66
action_131 (48) = happyGoto action_67
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (86) = happyShift action_126
action_132 (103) = happyShift action_149
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (88) = happyShift action_118
action_133 (89) = happyShift action_119
action_133 (91) = happyShift action_120
action_133 (92) = happyShift action_121
action_133 (93) = happyShift action_122
action_133 (94) = happyShift action_123
action_133 (103) = happyShift action_148
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_90

action_135 (49) = happyShift action_68
action_135 (50) = happyShift action_69
action_135 (95) = happyShift action_70
action_135 (96) = happyShift action_71
action_135 (102) = happyShift action_72
action_135 (108) = happyShift action_73
action_135 (109) = happyShift action_74
action_135 (16) = happyGoto action_61
action_135 (21) = happyGoto action_62
action_135 (44) = happyGoto action_147
action_135 (45) = happyGoto action_64
action_135 (46) = happyGoto action_65
action_135 (47) = happyGoto action_66
action_135 (48) = happyGoto action_67
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_89

action_137 (49) = happyShift action_68
action_137 (50) = happyShift action_69
action_137 (95) = happyShift action_70
action_137 (96) = happyShift action_71
action_137 (102) = happyShift action_135
action_137 (108) = happyShift action_73
action_137 (109) = happyShift action_74
action_137 (16) = happyGoto action_61
action_137 (21) = happyGoto action_62
action_137 (47) = happyGoto action_146
action_137 (48) = happyGoto action_67
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (49) = happyShift action_68
action_138 (50) = happyShift action_69
action_138 (95) = happyShift action_70
action_138 (96) = happyShift action_71
action_138 (102) = happyShift action_135
action_138 (108) = happyShift action_73
action_138 (109) = happyShift action_74
action_138 (16) = happyGoto action_61
action_138 (21) = happyGoto action_62
action_138 (47) = happyGoto action_145
action_138 (48) = happyGoto action_67
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (49) = happyShift action_68
action_139 (50) = happyShift action_69
action_139 (95) = happyShift action_70
action_139 (96) = happyShift action_71
action_139 (102) = happyShift action_135
action_139 (108) = happyShift action_73
action_139 (109) = happyShift action_74
action_139 (16) = happyGoto action_61
action_139 (21) = happyGoto action_62
action_139 (46) = happyGoto action_144
action_139 (47) = happyGoto action_66
action_139 (48) = happyGoto action_67
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (49) = happyShift action_68
action_140 (50) = happyShift action_69
action_140 (95) = happyShift action_70
action_140 (96) = happyShift action_71
action_140 (102) = happyShift action_135
action_140 (108) = happyShift action_73
action_140 (109) = happyShift action_74
action_140 (16) = happyGoto action_61
action_140 (21) = happyGoto action_62
action_140 (46) = happyGoto action_143
action_140 (47) = happyGoto action_66
action_140 (48) = happyGoto action_67
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (11) = happyGoto action_142
action_141 _ = happyReduce_12

action_142 (50) = happyShift action_191
action_142 (13) = happyGoto action_190
action_142 _ = happyReduce_8

action_143 (97) = happyShift action_137
action_143 (98) = happyShift action_138
action_143 _ = happyReduce_84

action_144 (97) = happyShift action_137
action_144 (98) = happyShift action_138
action_144 _ = happyReduce_83

action_145 _ = happyReduce_87

action_146 _ = happyReduce_86

action_147 (103) = happyShift action_148
action_147 _ = happyFail (happyExpListPerState 147)

action_148 _ = happyReduce_91

action_149 (106) = happyShift action_189
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (100) = happyShift action_109
action_150 (103) = happyShift action_188
action_150 _ = happyFail (happyExpListPerState 150)

action_151 _ = happyReduce_60

action_152 (90) = happyShift action_187
action_152 (100) = happyShift action_178
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (86) = happyShift action_126
action_153 _ = happyReduce_51

action_154 (54) = happyShift action_186
action_154 (65) = happyShift action_48
action_154 (66) = happyShift action_49
action_154 (68) = happyShift action_50
action_154 (70) = happyShift action_51
action_154 (72) = happyShift action_52
action_154 (74) = happyShift action_53
action_154 (77) = happyShift action_54
action_154 (78) = happyShift action_55
action_154 (81) = happyShift action_56
action_154 (84) = happyShift action_57
action_154 (85) = happyShift action_58
action_154 (18) = happyGoto action_103
action_154 (19) = happyGoto action_37
action_154 (20) = happyGoto action_38
action_154 (22) = happyGoto action_39
action_154 (23) = happyGoto action_40
action_154 (24) = happyGoto action_41
action_154 (25) = happyGoto action_42
action_154 (26) = happyGoto action_43
action_154 (27) = happyGoto action_44
action_154 (28) = happyGoto action_45
action_154 (30) = happyGoto action_46
action_154 (31) = happyGoto action_47
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (49) = happyShift action_68
action_155 (50) = happyShift action_69
action_155 (95) = happyShift action_70
action_155 (96) = happyShift action_71
action_155 (102) = happyShift action_72
action_155 (108) = happyShift action_73
action_155 (109) = happyShift action_74
action_155 (16) = happyGoto action_61
action_155 (21) = happyGoto action_62
action_155 (44) = happyGoto action_185
action_155 (45) = happyGoto action_64
action_155 (46) = happyGoto action_65
action_155 (47) = happyGoto action_66
action_155 (48) = happyGoto action_67
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (87) = happyShift action_124
action_156 _ = happyReduce_64

action_157 (65) = happyShift action_48
action_157 (66) = happyShift action_49
action_157 (68) = happyShift action_50
action_157 (70) = happyShift action_51
action_157 (72) = happyShift action_52
action_157 (74) = happyShift action_53
action_157 (77) = happyShift action_54
action_157 (78) = happyShift action_55
action_157 (80) = happyShift action_184
action_157 (81) = happyShift action_56
action_157 (84) = happyShift action_57
action_157 (85) = happyShift action_58
action_157 (18) = happyGoto action_103
action_157 (19) = happyGoto action_37
action_157 (20) = happyGoto action_38
action_157 (22) = happyGoto action_39
action_157 (23) = happyGoto action_40
action_157 (24) = happyGoto action_41
action_157 (25) = happyGoto action_42
action_157 (26) = happyGoto action_43
action_157 (27) = happyGoto action_44
action_157 (28) = happyGoto action_45
action_157 (30) = happyGoto action_46
action_157 (31) = happyGoto action_47
action_157 _ = happyReduce_49

action_158 _ = happyReduce_66

action_159 _ = happyReduce_79

action_160 _ = happyReduce_80

action_161 _ = happyReduce_77

action_162 _ = happyReduce_78

action_163 _ = happyReduce_75

action_164 (49) = happyShift action_68
action_164 (50) = happyShift action_69
action_164 (95) = happyShift action_70
action_164 (96) = happyShift action_71
action_164 (102) = happyShift action_72
action_164 (108) = happyShift action_73
action_164 (109) = happyShift action_74
action_164 (16) = happyGoto action_61
action_164 (21) = happyGoto action_62
action_164 (44) = happyGoto action_183
action_164 (45) = happyGoto action_64
action_164 (46) = happyGoto action_65
action_164 (47) = happyGoto action_66
action_164 (48) = happyGoto action_67
action_164 _ = happyFail (happyExpListPerState 164)

action_165 _ = happyReduce_48

action_166 (105) = happyShift action_182
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (69) = happyShift action_181
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (99) = happyReduce_45
action_168 _ = happyReduce_93

action_169 (76) = happyShift action_180
action_169 _ = happyFail (happyExpListPerState 169)

action_170 _ = happyReduce_44

action_171 _ = happyReduce_43

action_172 (99) = happyReduce_41
action_172 _ = happyReduce_93

action_173 (69) = happyShift action_179
action_173 _ = happyFail (happyExpListPerState 173)

action_174 _ = happyReduce_61

action_175 _ = happyReduce_40

action_176 _ = happyReduce_39

action_177 (100) = happyShift action_178
action_177 _ = happyReduce_32

action_178 (109) = happyShift action_93
action_178 (21) = happyGoto action_201
action_178 _ = happyFail (happyExpListPerState 178)

action_179 (109) = happyShift action_93
action_179 (21) = happyGoto action_200
action_179 _ = happyFail (happyExpListPerState 179)

action_180 (109) = happyShift action_93
action_180 (21) = happyGoto action_199
action_180 _ = happyFail (happyExpListPerState 180)

action_181 (109) = happyShift action_93
action_181 (21) = happyGoto action_198
action_181 _ = happyFail (happyExpListPerState 181)

action_182 _ = happyReduce_38

action_183 _ = happyReduce_76

action_184 (65) = happyShift action_48
action_184 (66) = happyShift action_49
action_184 (68) = happyShift action_50
action_184 (70) = happyShift action_51
action_184 (72) = happyShift action_52
action_184 (74) = happyShift action_53
action_184 (77) = happyShift action_54
action_184 (78) = happyShift action_55
action_184 (81) = happyShift action_56
action_184 (84) = happyShift action_57
action_184 (85) = happyShift action_58
action_184 (17) = happyGoto action_197
action_184 (18) = happyGoto action_36
action_184 (19) = happyGoto action_37
action_184 (20) = happyGoto action_38
action_184 (22) = happyGoto action_39
action_184 (23) = happyGoto action_40
action_184 (24) = happyGoto action_41
action_184 (25) = happyGoto action_42
action_184 (26) = happyGoto action_43
action_184 (27) = happyGoto action_44
action_184 (28) = happyGoto action_45
action_184 (30) = happyGoto action_46
action_184 (31) = happyGoto action_47
action_184 _ = happyFail (happyExpListPerState 184)

action_185 (67) = happyShift action_196
action_185 _ = happyFail (happyExpListPerState 185)

action_186 (96) = happyShift action_195
action_186 _ = happyFail (happyExpListPerState 186)

action_187 (49) = happyShift action_68
action_187 (50) = happyShift action_69
action_187 (95) = happyShift action_70
action_187 (96) = happyShift action_71
action_187 (102) = happyShift action_72
action_187 (108) = happyShift action_73
action_187 (109) = happyShift action_74
action_187 (16) = happyGoto action_61
action_187 (21) = happyGoto action_62
action_187 (44) = happyGoto action_194
action_187 (45) = happyGoto action_64
action_187 (46) = happyGoto action_65
action_187 (47) = happyGoto action_66
action_187 (48) = happyGoto action_67
action_187 _ = happyFail (happyExpListPerState 187)

action_188 _ = happyReduce_94

action_189 (49) = happyShift action_68
action_189 (50) = happyShift action_69
action_189 (95) = happyShift action_70
action_189 (96) = happyShift action_71
action_189 (102) = happyShift action_72
action_189 (108) = happyShift action_73
action_189 (109) = happyShift action_74
action_189 (16) = happyGoto action_61
action_189 (21) = happyGoto action_62
action_189 (44) = happyGoto action_193
action_189 (45) = happyGoto action_64
action_189 (46) = happyGoto action_65
action_189 (47) = happyGoto action_66
action_189 (48) = happyGoto action_67
action_189 _ = happyFail (happyExpListPerState 189)

action_190 _ = happyReduce_11

action_191 (109) = happyShift action_192
action_191 _ = happyFail (happyExpListPerState 191)

action_192 (61) = happyShift action_206
action_192 _ = happyFail (happyExpListPerState 192)

action_193 (107) = happyShift action_205
action_193 _ = happyFail (happyExpListPerState 193)

action_194 _ = happyReduce_57

action_195 (81) = happyShift action_204
action_195 _ = happyFail (happyExpListPerState 195)

action_196 (49) = happyShift action_68
action_196 (50) = happyShift action_69
action_196 (95) = happyShift action_70
action_196 (96) = happyShift action_71
action_196 (102) = happyShift action_72
action_196 (108) = happyShift action_73
action_196 (109) = happyShift action_74
action_196 (16) = happyGoto action_61
action_196 (21) = happyGoto action_62
action_196 (44) = happyGoto action_203
action_196 (45) = happyGoto action_64
action_196 (46) = happyGoto action_65
action_196 (47) = happyGoto action_66
action_196 (48) = happyGoto action_67
action_196 _ = happyFail (happyExpListPerState 196)

action_197 (54) = happyShift action_202
action_197 (65) = happyShift action_48
action_197 (66) = happyShift action_49
action_197 (68) = happyShift action_50
action_197 (70) = happyShift action_51
action_197 (72) = happyShift action_52
action_197 (74) = happyShift action_53
action_197 (77) = happyShift action_54
action_197 (78) = happyShift action_55
action_197 (81) = happyShift action_56
action_197 (84) = happyShift action_57
action_197 (85) = happyShift action_58
action_197 (18) = happyGoto action_103
action_197 (19) = happyGoto action_37
action_197 (20) = happyGoto action_38
action_197 (22) = happyGoto action_39
action_197 (23) = happyGoto action_40
action_197 (24) = happyGoto action_41
action_197 (25) = happyGoto action_42
action_197 (26) = happyGoto action_43
action_197 (27) = happyGoto action_44
action_197 (28) = happyGoto action_45
action_197 (30) = happyGoto action_46
action_197 (31) = happyGoto action_47
action_197 _ = happyFail (happyExpListPerState 197)

action_198 _ = happyReduce_46

action_199 _ = happyReduce_47

action_200 _ = happyReduce_42

action_201 _ = happyReduce_59

action_202 (96) = happyShift action_213
action_202 _ = happyFail (happyExpListPerState 202)

action_203 (73) = happyShift action_212
action_203 (29) = happyGoto action_211
action_203 _ = happyReduce_56

action_204 _ = happyReduce_52

action_205 (49) = happyShift action_68
action_205 (50) = happyShift action_69
action_205 (95) = happyShift action_70
action_205 (96) = happyShift action_71
action_205 (102) = happyShift action_72
action_205 (108) = happyShift action_73
action_205 (109) = happyShift action_74
action_205 (16) = happyGoto action_61
action_205 (21) = happyGoto action_62
action_205 (44) = happyGoto action_210
action_205 (45) = happyGoto action_64
action_205 (46) = happyGoto action_65
action_205 (47) = happyGoto action_66
action_205 (48) = happyGoto action_67
action_205 _ = happyFail (happyExpListPerState 205)

action_206 (62) = happyShift action_208
action_206 (63) = happyShift action_209
action_206 (14) = happyGoto action_207
action_206 _ = happyFail (happyExpListPerState 206)

action_207 (64) = happyShift action_218
action_207 (15) = happyGoto action_217
action_207 _ = happyReduce_18

action_208 _ = happyReduce_16

action_209 _ = happyReduce_15

action_210 _ = happyReduce_81

action_211 (65) = happyShift action_48
action_211 (66) = happyShift action_49
action_211 (68) = happyShift action_50
action_211 (70) = happyShift action_51
action_211 (72) = happyShift action_52
action_211 (74) = happyShift action_53
action_211 (77) = happyShift action_54
action_211 (78) = happyShift action_55
action_211 (81) = happyShift action_56
action_211 (84) = happyShift action_57
action_211 (85) = happyShift action_58
action_211 (17) = happyGoto action_216
action_211 (18) = happyGoto action_36
action_211 (19) = happyGoto action_37
action_211 (20) = happyGoto action_38
action_211 (22) = happyGoto action_39
action_211 (23) = happyGoto action_40
action_211 (24) = happyGoto action_41
action_211 (25) = happyGoto action_42
action_211 (26) = happyGoto action_43
action_211 (27) = happyGoto action_44
action_211 (28) = happyGoto action_45
action_211 (30) = happyGoto action_46
action_211 (31) = happyGoto action_47
action_211 _ = happyFail (happyExpListPerState 211)

action_212 (49) = happyShift action_68
action_212 (50) = happyShift action_69
action_212 (95) = happyShift action_70
action_212 (96) = happyShift action_71
action_212 (102) = happyShift action_72
action_212 (108) = happyShift action_73
action_212 (109) = happyShift action_74
action_212 (16) = happyGoto action_61
action_212 (21) = happyGoto action_62
action_212 (44) = happyGoto action_215
action_212 (45) = happyGoto action_64
action_212 (46) = happyGoto action_65
action_212 (47) = happyGoto action_66
action_212 (48) = happyGoto action_67
action_212 _ = happyFail (happyExpListPerState 212)

action_213 (78) = happyShift action_214
action_213 _ = happyFail (happyExpListPerState 213)

action_214 _ = happyReduce_50

action_215 _ = happyReduce_55

action_216 (54) = happyShift action_221
action_216 (65) = happyShift action_48
action_216 (66) = happyShift action_49
action_216 (68) = happyShift action_50
action_216 (70) = happyShift action_51
action_216 (72) = happyShift action_52
action_216 (74) = happyShift action_53
action_216 (77) = happyShift action_54
action_216 (78) = happyShift action_55
action_216 (81) = happyShift action_56
action_216 (84) = happyShift action_57
action_216 (85) = happyShift action_58
action_216 (18) = happyGoto action_103
action_216 (19) = happyGoto action_37
action_216 (20) = happyGoto action_38
action_216 (22) = happyGoto action_39
action_216 (23) = happyGoto action_40
action_216 (24) = happyGoto action_41
action_216 (25) = happyGoto action_42
action_216 (26) = happyGoto action_43
action_216 (27) = happyGoto action_44
action_216 (28) = happyGoto action_45
action_216 (30) = happyGoto action_46
action_216 (31) = happyGoto action_47
action_216 _ = happyFail (happyExpListPerState 216)

action_217 (99) = happyShift action_220
action_217 _ = happyFail (happyExpListPerState 217)

action_218 (49) = happyShift action_68
action_218 (50) = happyShift action_69
action_218 (95) = happyShift action_70
action_218 (96) = happyShift action_71
action_218 (102) = happyShift action_72
action_218 (108) = happyShift action_73
action_218 (109) = happyShift action_74
action_218 (16) = happyGoto action_61
action_218 (21) = happyGoto action_62
action_218 (44) = happyGoto action_219
action_218 (45) = happyGoto action_64
action_218 (46) = happyGoto action_65
action_218 (47) = happyGoto action_66
action_218 (48) = happyGoto action_67
action_218 _ = happyFail (happyExpListPerState 218)

action_219 _ = happyReduce_17

action_220 _ = happyReduce_14

action_221 (96) = happyShift action_222
action_221 _ = happyFail (happyExpListPerState 221)

action_222 (81) = happyShift action_223
action_222 _ = happyFail (happyExpListPerState 222)

action_223 _ = happyReduce_53

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TypedProgram happy_var_1 happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (NoneTypeProgram happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 8 5 happyReduction_3
happyReduction_3 ((HappyTerminal (IdentifierToken happy_var_8)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (IdentificationDivision happy_var_8
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (DataDivision happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 7 happyReduction_5
happyReduction_5 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ProcedureDivision happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 8 happyReduction_6
happyReduction_6 ((HappyTerminal (IdentifierToken happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (HasEnd happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_0  8 happyReduction_7
happyReduction_7  =  HappyAbsSyn8
		 (NoEnd
	)

happyReduce_8 = happyReduce 6 9 happyReduction_8
happyReduction_8 ((HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DataSection happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_1  10 happyReduction_9
happyReduction_9 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (SingleParagraph happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  10 happyReduction_10
happyReduction_10 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (MultiParagraph happy_var_1 happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  11 happyReduction_11
happyReduction_11 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Declarations happy_var_1 happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_0  11 happyReduction_12
happyReduction_12  =  HappyAbsSyn11
		 (NoDeclaration
	)

happyReduce_13 = happySpecReduce_3  12 happyReduction_13
happyReduction_13 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (IdentifierToken happy_var_1))
	 =  HappyAbsSyn12
		 (Paragraph happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 6 13 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentifierToken happy_var_2)) `HappyStk`
	(HappyTerminal (IntegerToken happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (VarDeclaration happy_var_1 happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  14 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn14
		 (AlphanumericString
	)

happyReduce_16 = happySpecReduce_1  14 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn14
		 (SignedNumber
	)

happyReduce_17 = happySpecReduce_2  15 happyReduction_17
happyReduction_17 (HappyAbsSyn44  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (HasDefault happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_0  15 happyReduction_18
happyReduction_18  =  HappyAbsSyn15
		 (NoDefault
	)

happyReduce_19 = happySpecReduce_1  16 happyReduction_19
happyReduction_19 (HappyTerminal (StringToken happy_var_1))
	 =  HappyAbsSyn16
		 (StringValue happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  16 happyReduction_20
happyReduction_20 (HappyTerminal (NumberToken happy_var_1))
	 =  HappyAbsSyn16
		 (NumberValue happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  16 happyReduction_21
happyReduction_21 (HappyTerminal (IntegerToken happy_var_1))
	 =  HappyAbsSyn16
		 (NumberValue (fromIntegral happy_var_1)
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  17 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (MultiStatement happy_var_1 happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  17 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (SingleStatement happy_var_1
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  18 happyReduction_24
happyReduction_24 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (MoveStatement happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  18 happyReduction_25
happyReduction_25 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn18
		 (ArithmeticStatement happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  18 happyReduction_26
happyReduction_26 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn18
		 (CompStatement happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  18 happyReduction_27
happyReduction_27 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn18
		 (IfStatement happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  18 happyReduction_28
happyReduction_28 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (PerformStatement happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  18 happyReduction_29
happyReduction_29 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn18
		 (DeclareFunction happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  18 happyReduction_30
happyReduction_30 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn18
		 (ShowStatement happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  18 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn18
		 (ExitStatement
	)

happyReduce_32 = happyReduce 4 19 happyReduction_32
happyReduction_32 ((HappyAbsSyn32  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (Move happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_1  20 happyReduction_33
happyReduction_33 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn20
		 (AddStatement happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  20 happyReduction_34
happyReduction_34 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn20
		 (SubtractStatement happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  20 happyReduction_35
happyReduction_35 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn20
		 (MultiplyStatement happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  20 happyReduction_36
happyReduction_36 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn20
		 (DivisionStatement happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  21 happyReduction_37
happyReduction_37 (HappyTerminal (IdentifierToken happy_var_1))
	 =  HappyAbsSyn21
		 (NormalVariable happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happyReduce 4 21 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn44  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentifierToken happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (ListVariable happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 4 22 happyReduction_39
happyReduction_39 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (SingleAdd happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 4 22 happyReduction_40
happyReduction_40 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (MultiAdd happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 4 23 happyReduction_41
happyReduction_41 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (MultiSubtract happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 6 23 happyReduction_42
happyReduction_42 ((HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (SingleSubtract happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 4 24 happyReduction_43
happyReduction_43 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (MultiplyTo happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 4 24 happyReduction_44
happyReduction_44 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (MultiplyGiving happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 4 25 happyReduction_45
happyReduction_45 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 (DivideInto happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 6 25 happyReduction_46
happyReduction_46 ((HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 (DivideGiving happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 6 25 happyReduction_47
happyReduction_47 ((HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 (DivideRemainder happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 4 26 happyReduction_48
happyReduction_48 ((HappyAbsSyn44  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (ComputeStatement happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 4 27 happyReduction_49
happyReduction_49 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (IfOnlyStatement happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 9 27 happyReduction_50
happyReduction_50 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (IfElseStatement happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 4 28 happyReduction_51
happyReduction_51 ((HappyAbsSyn34  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (ConditionalPerform happy_var_4 happy_var_2
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 7 28 happyReduction_52
happyReduction_52 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	(HappyAbsSyn34  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (ConditionalPerform happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 12 28 happyReduction_53
happyReduction_53 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_9) `HappyStk`
	(HappyAbsSyn29  happy_var_8) `HappyStk`
	(HappyAbsSyn44  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentifierToken happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (RangePerform happy_var_3 happy_var_5 happy_var_7 happy_var_8 happy_var_9
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_2  28 happyReduction_54
happyReduction_54 (HappyTerminal (IdentifierToken happy_var_2))
	_
	 =  HappyAbsSyn28
		 (ParagraphPerform happy_var_2
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_2  29 happyReduction_55
happyReduction_55 (HappyAbsSyn44  happy_var_2)
	_
	 =  HappyAbsSyn29
		 (HasStep happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_0  29 happyReduction_56
happyReduction_56  =  HappyAbsSyn29
		 (HasNoStep
	)

happyReduce_57 = happyReduce 6 30 happyReduction_57
happyReduction_57 ((HappyAbsSyn44  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentifierToken happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (FunctionStatement happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_58 = happySpecReduce_2  31 happyReduction_58
happyReduction_58 (HappyAbsSyn44  happy_var_2)
	_
	 =  HappyAbsSyn31
		 (DisplayStatement happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  32 happyReduction_59
happyReduction_59 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (MultiVariables happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  32 happyReduction_60
happyReduction_60 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn32
		 (SingleVariable happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  33 happyReduction_61
happyReduction_61 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn33
		 (MultiExpressions happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  33 happyReduction_62
happyReduction_62 (HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn33
		 (SingleExpression happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  34 happyReduction_63
happyReduction_63 (HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn34
		 (HasNoOr happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  34 happyReduction_64
happyReduction_64 (HappyAbsSyn35  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (HasOr happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  35 happyReduction_65
happyReduction_65 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn35
		 (HasNoAnd happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  35 happyReduction_66
happyReduction_66 (HappyAbsSyn36  happy_var_3)
	_
	(HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn35
		 (HasAnd happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_2  36 happyReduction_67
happyReduction_67 (HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn36
		 (HasInversion happy_var_2
	)
happyReduction_67 _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  36 happyReduction_68
happyReduction_68 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 (HasNoInversion happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  37 happyReduction_69
happyReduction_69 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn37
		 (EqualComparison happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  37 happyReduction_70
happyReduction_70 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn37
		 (NotEqualComparison happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  37 happyReduction_71
happyReduction_71 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn37
		 (LessThanComparison happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  37 happyReduction_72
happyReduction_72 (HappyAbsSyn41  happy_var_1)
	 =  HappyAbsSyn37
		 (LessThanOrEqualComparison happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  37 happyReduction_73
happyReduction_73 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn37
		 (GreaterThanComparison happy_var_1
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  37 happyReduction_74
happyReduction_74 (HappyAbsSyn43  happy_var_1)
	 =  HappyAbsSyn37
		 (GreaterThanOrEqualComparison happy_var_1
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  38 happyReduction_75
happyReduction_75 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn38
		 (IsEq happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happyReduce 4 39 happyReduction_76
happyReduction_76 ((HappyAbsSyn44  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (IsNotEq happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_77 = happySpecReduce_3  40 happyReduction_77
happyReduction_77 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn40
		 (IsLessThan happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  41 happyReduction_78
happyReduction_78 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn41
		 (IsLessThanOrEqual happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  42 happyReduction_79
happyReduction_79 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn42
		 (IsGreaterThan happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  43 happyReduction_80
happyReduction_80 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn43
		 (IsGreaterThanOrEqual happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happyReduce 7 44 happyReduction_81
happyReduction_81 ((HappyAbsSyn44  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn44  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn44
		 (ConditionalExpression happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_82 = happySpecReduce_1  44 happyReduction_82
happyReduction_82 (HappyAbsSyn45  happy_var_1)
	 =  HappyAbsSyn44
		 (EmptySum happy_var_1
	)
happyReduction_82 _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  45 happyReduction_83
happyReduction_83 (HappyAbsSyn46  happy_var_3)
	_
	(HappyAbsSyn45  happy_var_1)
	 =  HappyAbsSyn45
		 (AddSum happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  45 happyReduction_84
happyReduction_84 (HappyAbsSyn46  happy_var_3)
	_
	(HappyAbsSyn45  happy_var_1)
	 =  HappyAbsSyn45
		 (SubtractSum happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_1  45 happyReduction_85
happyReduction_85 (HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn45
		 (EmptyTerm happy_var_1
	)
happyReduction_85 _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  46 happyReduction_86
happyReduction_86 (HappyAbsSyn47  happy_var_3)
	_
	(HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn46
		 (MultiplyTerm happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  46 happyReduction_87
happyReduction_87 (HappyAbsSyn47  happy_var_3)
	_
	(HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn46
		 (DivideTerm happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_1  46 happyReduction_88
happyReduction_88 (HappyAbsSyn47  happy_var_1)
	 =  HappyAbsSyn46
		 (EmptyFactor happy_var_1
	)
happyReduction_88 _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_2  47 happyReduction_89
happyReduction_89 (HappyAbsSyn47  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (PositiveFactor happy_var_2
	)
happyReduction_89 _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_2  47 happyReduction_90
happyReduction_90 (HappyAbsSyn47  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (NegativeFactor happy_var_2
	)
happyReduction_90 _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  47 happyReduction_91
happyReduction_91 _
	(HappyAbsSyn44  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (ParenthesesExpression happy_var_2
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_1  47 happyReduction_92
happyReduction_92 (HappyAbsSyn48  happy_var_1)
	 =  HappyAbsSyn47
		 (EmptyElement happy_var_1
	)
happyReduction_92 _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_1  48 happyReduction_93
happyReduction_93 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn48
		 (VarElement happy_var_1
	)
happyReduction_93 _  = notHappyAtAll 

happyReduce_94 = happyReduce 4 48 happyReduction_94
happyReduction_94 (_ `HappyStk`
	(HappyAbsSyn33  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentifierToken happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn48
		 (FunctionElement happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_95 = happySpecReduce_1  48 happyReduction_95
happyReduction_95 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn48
		 (ValueElement happy_var_1
	)
happyReduction_95 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 110 110 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	NumberToken happy_dollar_dollar -> cont 49;
	IntegerToken happy_dollar_dollar -> cont 50;
	IdentificationToken -> cont 51;
	DataToken -> cont 52;
	ProcedureToken -> cont 53;
	EndToken -> cont 54;
	DivisionToken -> cont 55;
	IdToken -> cont 56;
	ProgramToken -> cont 57;
	WorkingToken -> cont 58;
	StorageToken -> cont 59;
	SectionToken -> cont 60;
	PicToken -> cont 61;
	NumericToken -> cont 62;
	AlphaNumericToken -> cont 63;
	ValueToken -> cont 64;
	ExitToken -> cont 65;
	MoveToken -> cont 66;
	ToToken -> cont 67;
	AddToken -> cont 68;
	GivingToken -> cont 69;
	SubtractToken -> cont 70;
	FromToken -> cont 71;
	MultiplyToken -> cont 72;
	ByToken -> cont 73;
	DivideToken -> cont 74;
	IntoToken -> cont 75;
	RemainderToken -> cont 76;
	ComputeToken -> cont 77;
	IfToken -> cont 78;
	ThenToken -> cont 79;
	ElseToken -> cont 80;
	PerformToken -> cont 81;
	UntilToken -> cont 82;
	VaryingToken -> cont 83;
	FunctionToken -> cont 84;
	DisplayToken -> cont 85;
	OrToken -> cont 86;
	AndToken -> cont 87;
	NotToken -> cont 88;
	EqualsToken -> cont 89;
	ArrowToken -> cont 90;
	LessOrEqualToken -> cont 91;
	LessToken -> cont 92;
	GreaterEqualToken -> cont 93;
	GreaterToken -> cont 94;
	PlusToken -> cont 95;
	MinusToken -> cont 96;
	TimesToken -> cont 97;
	DividesToken -> cont 98;
	DotToken -> cont 99;
	CommaToken -> cont 100;
	AssignToken -> cont 101;
	LeftPToken -> cont 102;
	RightPToken -> cont 103;
	LeftBToken -> cont 104;
	RightBToken -> cont 105;
	QuestionToken -> cont 106;
	CollonToken -> cont 107;
	StringToken happy_dollar_dollar -> cont 108;
	IdentifierToken happy_dollar_dollar -> cont 109;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 110 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
