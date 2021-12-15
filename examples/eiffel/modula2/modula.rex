GLOBAL {
Errors	: Errors

ErrorAttribute (Token: INTEGER): ScanAttribute is
   do
      Result := yyScanAttribute
   end
}

DEFAULT	{
Errors.MessageI ("illegal character", Errors.Error, yyScanAttribute.Position, Errors.IsString, GetWord)
}

EOF     {
if yyStartState = Comment then 
   Errors.Message ("unclosed comment", Errors.Error, yyScanAttribute.Position)
end
}

BEGIN {
!! Errors.make
}

DEFINE
   digit	= {0-9}		.
   letter	= {a-z A-Z}	.
   CmtCh	= - {*(\t\n}	.

START	Comment

RULE

#STD, Comment# "(*" 	:- {yyPush (Comment)}
#Comment#  "*)"		:- {yyPop}
#Comment#  "(" | "*" | CmtCh + :- {}

#STD# digit +		,
#STD# digit + / ".."   	: {Result := 1;}
#STD# {0-7} + B        	: {Result := 2;}
#STD# {0-7} + C        	: {Result := 3;}
#STD# digit {0-9 A-F} * H : {Result := 4;}
#STD# digit + "." digit * (E {+\-} ? digit +) ?	: {Result := 5;}

#STD# ' - {\n'} * '	|
      \" - {\n"} * \" 	: {Result := 6;}

#STD# "#"              	: {Result := 7;}
#STD# "("              	: {Result := 9;}
#STD# ")"              	: {Result := 10;}
#STD# "*"              	: {Result := 11;}
#STD# "+"              	: {Result := 12;}
#STD# ","              	: {Result := 13;}
#STD# "-"              	: {Result := 14;}
#STD# "."              	: {Result := 15;}
#STD# ".."             	: {Result := 16;}
#STD# "/"              	: {Result := 17;}
#STD# ":"              	: {Result := 18;}
#STD# ":="             	: {Result := 19;}
#STD# ";"              	: {Result := 20;}
#STD# "<"              	: {Result := 21;}
#STD# "<="             	: {Result := 22;}
#STD# "="              	: {Result := 24;}
#STD# ">"              	: {Result := 25;}
#STD# ">="             	: {Result := 26;}
#STD# "["              	: {Result := 27;}
#STD# "]"              	: {Result := 28;}
#STD# "^"              	: {Result := 29;}
#STD# "{"              	: {Result := 30;}
#STD# "|"              	: {Result := 31;}
#STD# "}"              	: {Result := 32;}

#STD# "&"		: {Result := 34;}
#STD# "<>"		: {Result :=  7;}
#STD# "~"		: {Result := 57;}

#STD# AND              	: {Result := 34;}
#STD# ARRAY            	: {Result := 35;}
#STD# BEGIN           	: {Result := 36;}
#STD# BY               	: {Result := 37;}
#STD# CASE             	: {Result := 38;}
#STD# CONST            	: {Result := 39;}
#STD# DEFINITION       	: {Result := 40;}
#STD# DIV              	: {Result := 41;}
#STD# DO               	: {Result := 42;}
#STD# ELSE             	: {Result := 43;}
#STD# ELSIF            	: {Result := 44;}
#STD# END              	: {Result := 45;}
#STD# EXIT             	: {Result := 46;}
#STD# EXPORT          	: {Result := 47;}
#STD# FOR              	: {Result := 48;}
#STD# FROM             	: {Result := 49;}
#STD# IF               	: {Result := 50;}
#STD# IMPLEMENTATION   	: {Result := 51;}
#STD# IMPORT           	: {Result := 52;}
#STD# IN               	: {Result := 53;}
#STD# LOOP             	: {Result := 54;}
#STD# MOD              	: {Result := 55;}
#STD# MODULE           	: {Result := 56;}
#STD# \NOT              : {Result := 57;}
#STD# OF               	: {Result := 58;}
#STD# OR               	: {Result := 59;}
#STD# POINTER          	: {Result := 60;}
#STD# PROCEDURE        	: {Result := 61;}
#STD# QUALIFIED        	: {Result := 62;}
#STD# RECORD           	: {Result := 63;}
#STD# REPEAT           	: {Result := 64;}
#STD# RETURN          	: {Result := 65;}
#STD# SET              	: {Result := 66;}
#STD# THEN             	: {Result := 67;}
#STD# TO               	: {Result := 68;}
#STD# TYPE             	: {Result := 69;}
#STD# UNTIL            	: {Result := 70;}
#STD# VAR              	: {Result := 71;}
#STD# WHILE            	: {Result := 72;}
#STD# WITH             	: {Result := 73;}

#STD# letter (letter | digit) *	: {Result := 74;}
