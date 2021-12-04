/* lexical-analysis.l */
%option main
alphabetic				[A-Za-z_$]
digit					[0-9]
alphanumeric				({alphabetic}|{digit})
sign					[+-]
start_comment				\#\-
end_comment				\-\#
between_quotes				\"(\n|[^\"])*\"
%%	
begin					return BEGIN_STMT ;
end					return END_STMT ;
endif					return END_IF ;
endwhile				return END_WHILE ;
endfor					return END_FOR ;
endfunc					return END_FUNC ;
True					return TRUE ;
False					return FALSE ;
void					return TYPE_VOID ;
int					return TYPE_INT ;
str					return TYPE_STR ;
char					return TYPE_CHAR ;
bool					return TYPE_BOOL ;
AND					return AND ;
OR					return OR ;
NOT					return NOT ;
return					return RETURN ;
{between_quotes}			return STRING_LITERAL ;
print					return PRINT_FUNC ;
scan					return SCAN_FUNC ;
\'.?\'					return CHAR_LITERAL ;
\(					return L_PAREN ;
\)					return R_PAREN ;
\=					return ASSIGN_OP ;
\=\=					return EQUAL_OP ;
\!\=					return INEQUAL_OP ;
\<					return LESS_THAN_OP ;
\>					return GREATER_THAN_OP ;
\<\=					return LESS_OR_EQ_OP ;
\>\=					return GREATER_OR_EQ_OP ;
\"					return QUOTE ;
\'					return SINGLE_QUOTE ;
\+					return PLUS_OP ;
\-					return MINUS_OP ;
\*					return MULT_OP ;
\+\=					return PLUS_AND_ASSIGN_OP ;
\-\=					return MINUS_AND_ASSIGN_OP ;
\*\=					return MULT_AND_ASSIGN_OP ;
\/\=					return DIVIDE_AND_ASSIGN_OP ;
\%\=					return MODULUS_AND_ASSIGN_OP ;
\%					return MODULUS_OP ;
\&					return AMPERSAND ;
\/					return DIVIDE_OP ;
\\					return BACK_SLASH ;
\,					return COMMA ;
\?					return CONDITION_OP ;
\;					return SEMICOLON ;
\:					return COLON ;
\.					return DOT ;
[ ]					return SPACE;
\t					return TAB;
\n					return NEWLINE;
{start_comment}				return START_COMMENT ;
{end_comment}				return END_COMMENT ;
if					return IF ;
elif					return ELIF ;
else					return ELSE ;
for					return FOR ;
while					return WHILE ;
get_inclination				return INCLINATION_FUNCTION_CALL ;
get_altitude				return ALTITUDE_FUNCTION_CALL ;
get_temperature				return TEMPERATURE_FUNCTION_CALL ;
get_acceleration			return ACCELERATION_FUNCTION_CALL ;
turn_on					return TURN_ON_FUNCTION_CALL ;
turn_off				return TURN_OFF_FUNCTION_CALL ;
take_picture				return TAKE_PICTURE_FUNCTION_CALL ;
get_timestamp				return GET_TIMESTAMP_FUNCTION_CALL ;
connect_base				return CONNECTION_FUNCTION_CALL ;
is_camera_active			return IS_CAMERA_ACTIVE ;
{alphabetic}{alphanumeric}*		return IDENTIFIER ;
{digit}+				return INT_LITERAL ;
{start_comment}(\n|[^#])*{end_comment} 	return COMMENT_BLOCK ;
\#.*\n					return COMMENT_LINE;
.					return UNIDENTIFIED ;
