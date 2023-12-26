# COBOL interpreter
In this repository, I wrote an interpreter for a language similar to COBOL using Haskell. Just write your COBOL-like code in a file named `code.txt` and put it beside the other files and run the `interpreter.hs` file. Remember that whitespaces including indenting **will be ignored** and it only has written in this document for more readability.

Each program, has 3 Divisions:
1. IDENTIFICATION DIVISION
2. DATA DIVISION
3. PROCEDURE DIVISION

In the end of the program you can either use an end program statement to indicate the end of the program in the following syntax:
```
END PROGRAM . [PROGRAM_NAME]
```
## IDENTIFICATION DIVISION
In this division we demonstrate the name of the program:
```
IDENTIFICATION DIVISION .
    PROGRAM-ID . [PROGRAM_NAME]
```
If you wish to use the end program statement, you should provide the `name` you used in the IDENTIFICATION DIVISION or it will cause an exception.

## DATA DIVISION
In this division, you should declare all the variables you want to use in the program:
```
DATA DIVISION.
    WORKING-STORAGE SECTION.
        [VARIABLE_DECLARATIONS]
```
You can ignore the variable declaration part -don't declare any variable- but if you want to do, you should follow the following syntax:
```
[SIZE] [VARIABLE_NAME] PIC [DATATYPE] [DEFAULT_VALUE] .
```
`SIZE` is an integer that indicates the number of the declared data. If `SIZE > 1` then the variable will be interpreted as a list with length `SIZE`.

`DATATYPE` is can either be `A` or `S9`. `A` is used for String values and `S9` is used for Number values.

`DEFAULT_VALUE`  is an optional part of the data declaration and is used like `VALUE [EXPRESSION]` in which `EXPRESSION` is the default value. If default value is used for a list, all of the elements of the list will contain the default value. i.e:
```
1 x PIC A. -> x = ''
1 y PIC A VALUE 'Hello, World!'. -> y = 'Hello, World!'
5 z PIC S9 VALUE 12. -> z = [12, 12, 12, 12, 12]
```
We can access an element of the array using its name and an `index` in brackets:
```
y[0] -> first element of y -> 12
y[4] -> last element of y -> 12
y[6] -> Error: Index '6' is out of bound
```

## PROCEDURE DIVISION
In this division, we'll write the heart of the code. We declare the division as below:
```
PROCEDURE DIVISION.
    [PARAGRAPHS]
```
This division consists of some paragraphs. Each paragraph has the below structure:
```
[PARAGRAPH_NAME] .
    [PARAGRAPH_BODY]
```
Paragraph body contains of some statements. each statement will be separated by `.` at the very end. We have different types of statements which we clarify soon.

The program only runs the paragraph with name `main` . If there is no such paragraph, nothing happens and the program does nothing. Also each paragraph only sees the paragraphs that are defined above.

### STATEMENTS
* FUNCTION STATEMENT
* MOVE STATEMENT
* ARITHMETIC STATEMENT
* COMPUTE STATEMENT
* IF-ELSE STATEMENT
* PERFORM STATEMENT
* DISPLAY STATEMENT
* EXIT STATEMENT

Now i'll go through each statement and its syntax:

#### FUNCTION
The syntax is as below:
```
FUNCTION [FUNCTION_NAME] = [ARGUMENTS] => [OUTPUT]
```
It declares a function with some arguments and an output expression. i.e:
```
FUNCTION double = x => 2*x
FUNCTION add = x, y => x+y
```
Each function can be called with its name and its arguments in a parenthesis:
```
>> double(5)
10
>> add (3, 23.4)
26.4
>> add ('Hello', 'World!')
Hello World!
```

#### MOVE
The syntax is as below:
```
MOVE [EXPRESSION] TO [VARIABLES]
```
`EXPRESSION` indicates a value which will be moved to all the variables mentioned in the `VARIABLES` . i.e:
```
MOVE -x + (y * 3) TO x, y -> assigns value of -x + (y * 3) to x and y.
MOVE a[3] TO a[0],a[1],a[2] -> copy the value of a[3] to a[0], a[1] and a[2]
```

#### ARITHMETIC
This language has 4 different arithmetic statements:
* ADD
* SUBTRACT
* MULTIPLY
* DIVIDE

##### ADD
`ADD` has two different styles to use:
```
ADD [EXPRESSION] TO [VARIABLE]
ADD [EXPRESSIONS] GIVING [VARIABLE]
```
Here are some use-cases:
```
ADD 5 TO x -> x = x + 5
ADD y TO z[3] -> z[3] = z[3] + y
ADD a, b, c GIVING d -> d = a + b + c
```

##### SUBTRACT

`SUBTRACT` has two different styles to use as well:
```
SUBTRACT [EXPRESSIONS] FROM [VARIABLE]
SUBTRACT [EXPRESSIONS] FROM [EXPRESSION] GIVING [VARIABLE]
```
Here are some use-cases:
```
SUBTRACT 5, x[1] FROM y -> y = y - x[1] - 5
SUBTRACT 5, x[1] FROM x[2] GIVING z -> z = x[2] - x[1] - 5
```

##### MULTIPLY
`MULTIPLY` also has two different syntaxes:
```
MULTIPLY [EXPRESSION] BY [VARIABLE]
MULTIPLY [EXPRESSIONS] GIVING [VARIABLE]
```
Here are some use-cases:
```
MULTIPLY 3*x BY x -> x = x * (3*x)
MULTIPLY -1, -1, 5 GIVING y -> y = y * -1 * -1 * 5 = y * 5
```

##### DIVIDE
`DIVIDE` has three different syntaxes:
```
DIVIDE [EXPRESSION] INTO [VARIABLE]
DIVIDE [EXPRESSION], [EXPRESSION] GIVING [VARIABLE]
DIVIDE [EXPRESSION] INTO [EXPRESSION] REMAINDER [VARIABLE]
```
Here are some use-cases:
```
DIVIDE 5 INTO x -> x = x / 5
DIVIDE 5, 3 GIVING y -> y = 0.6
DIVIDE 2.1 INTO 7.7 REMAINDER z -> z = 1.4
```

#### COMPUTE
The statement has the syntax below:
```
COMPUTE [VARIABLE] = [EXPRESSION]
```
This statement assigns a value to a variable. i.e:
```
COMPUTE x = 2*y - function(2, 3) + z[3]
```

#### IF-ELSE
Before we start the definition of IF-ELSE Statements, lets talk about the conditions in this language. conditions are used to choose between two or more pathways in the program. Each condition has at least one comparison. A comparison has the operations `EQUALS`, `<`, `>`, `<=` and `>=` .

Each of these operations come between two expressions to check a comparison. i.e:
```
x EQUALS y -> checks if x equals to y
x < y -> checks if x is less than y
x >= y -> checks if x is greater than or equal to y
```

We can combine multiple conditions into one using operations `OR`, `AND` and `NOT`. i.e:
```
x EQUALS y OR x < y -> it is exactly equal to x <= y
x NOT EQUALS y = NOT x EQUALS y -> checks if x is not equal to y
x < y AND y < z -> x < y < z
```
Now lets get back into IF-ELSE Statements. this statement checks a condition and decides what to do next:
```
IF [CONDITION] THEN [STATEMENTS]
IF [CONDITION] THEN [STATEMENTS] ELSE [STATEMENTS] END-IF
```
In the first example, statements will execute only if condition is held. In the second example, the condition will be checked and if it's true, the first statements are executed. Otherwise the second statements will be executed. i.e:
```
IF x EQUALS 5 THEN
    DIVIDE 5 INTO x.
ELSE
    MOVE 10 TO x.
END-IF.
```

##### Ternary Operation
Ternary Operation is another way to write if elses but in just one line without using the complicated form of the IF-ELSE statement. The difference here is that ternary operation is used for an expression and not a set of statements. The syntax looks like this:
```
( [CONDITION] ) ? [EXPRESSION] : [EXPRESSION]
```
It checks the condition. If the condition is true, the whole expression evaluates as the first expression and if not, it evaluates as the second one. i.e:
```
FUNCTION absolute = x => (x < 0)? -x: x.
>> absolute (5)
5
>> absolute (-3)
3
```

#### PERFORM
The syntax:
```
PERFORM [STATEMENTS] UNTIL [CONDITION]
PERFORM UNTIL [CONDITION] [STATEMENTS] END-PERFORM
PERFORM VARYING [VARIABLE] FROM [EXPRESSION] TO [EXPRESSION] [STEP] [STATEMENTS] END-PERFORM
PERFORM [VARIABLE]
```
In the first and second styles, it performs some action until a certain condition is true. In the third style, it performs the actions not under some condition, but for a variable when its between the values provided. The `STEP` is optional and when using, should follow the syntax `BY [EXPRESSION]` . The last style is to execute a paragraph. i.e:
```
PERFORM
    ADD 1 TO x
UNTIL x NOT EQUALS 10
-- the above code increments the x variable until it'll be equal to 10.
PERFORM VARYING i FROM 0 TO 10 BY j
    DIVIDE j INTO i.
    SUBTRACT 1 FROM j.
END-PERFORM
-- the above code, declares a variable i and at start, i is set to 0 and until it is less than 10,
-- it will divide i by j and subtract 1 from j. Note that change in i and j will be ignored in the next iteration.
-- for example, if j is 2 in the begining and it decrements each time, the PERFORM increments i by 2
-- every time no matter what -even if the value of the j changes in body of the perform- .
PERFORM paragraph1 -> executes the paragraph1 paragraph.
```

#### DISPLAY
This statement takes an expression and prints it in the output:
```
DISPLAY [EXPRESSION]
```

#### EXIT
This statement exits from a paragraph or a perform loop:
```
EXIT
```
We can use it to exit performs and paragraphs like this:
```
PERFORM VARYING i FROM 0 TO 10
    DISPLAY i.
    IF i <= 5 THEN
        DISPLAY i*i.
    ELSE EXIT.
    END-IF.
END-PERFORM.
-- OUTPUT: 0 0 1 1 2 4 3 9 4 16 5 25 6
```
The above code, use a variable `i` to go through `0` to `10` (excluded) **one by one** -it has no steps- and prints its value. Then, if the value is less than or equal to `5`, prints its square too and if not, it exits the perform statement and executes the next statement.
