/* cloud_parser.y */
%union{
	int	integer;	/* integer value */
	char 	character;	/* character value*/
	char	string[30];	/* string value*/
	bool	boolean;	/* boolean value*/
}

%token <integer>	INT_LITERAL
%token <character>	CHAR_LITERAL    L_PAREN    R_PAREN    ASSIGN_OP    SINGLE_QUOTE
%token <character>	PLUS_OP    MINUS_OP    QUOTE    MULT_OP    MODULUS_OP    AMPERSAND
%token <character>	DIVIDE_OP    BACK_SLASH    COMMA    CONDITION_OP    COLON    DOT
%token <character>	SEMICOLON
%token <string>		BEGIN_STMT    END_STMT    END_IF    END_WHILE	END_FOR    END_FUNC 
%token <string>  	TYPE_VOID    TYPE_INT    TYPE_STR    TYPE_CHAR    TYPE_BOOL    AND
%token <string> 	OR    NOT    RETURN    STRING_LITERAL    PRINT_FUNC    SCAN_FUNC
%token <string>		IF    ELIF    ELSE    FOR    WHILE    INCLINATION_FUNCTION_CALL
%token <string>		ALTITUDE_FUNCTION_CALL    TEMPERATURE_FUNCTION_CALL
%token <string>		ACCELERATION_FUNCTION_CALL    TURN_ON_FUNCTION_CALL
%token <string>		TURN_OFF_FUNCTION_CALL    TAKE_PICTURE_FUNCTION_CALL
%token <string>		GET_TIMESTAMP_FUNCTION_CALL    CONNECTION_FUNCTION_CALL
%token <string>		IS_CAMERA_ACTIVE    IDENTIFIER
%token <boolean>	TRUE    FALSE


%token EQUAL_OP    INEQUAL_OP    LESS_THAN_OP    GREATER_THAN_OP
%token LESS_OR_EQ_OP    GREATER_OR_EQ_OP     PLUS_AND_ASSIGN_OP    MINUS_AND_ASSIGN_OP 
%token MULT_AND_ASSIGN_OP    DIVIDE_AND_ASSIGN_OP    MODULUS_AND_ASSIGN_OP     
%token SPACE    TAB    NEWLINE    START_COMMENT    END_COMMENT       
%token COMMENT_BLOCK    COMMENT_LINE    UNIDENTIFIED

%%


program 		: 	BEGIN_STMT stmts END_STMT  {printf("Input program is valid\n"); return 0;} |
				function_def program	   {printf("Input program is valid\n"); return 0;}
			;

stmts			: 	stmt | 
				stmt stmts
			;

stmt			: 	function_call SEMICOLON 	| 
				expr SEMICOLON    		|	
				while_stmt 			|
				if_stmt				|
				for_stmt			|
				comment				|
				variable_decleration SEMICOLON 	| 
				return_stmt SEMICOLON	 	
			;

variable_declaration	: 	variable_type ident_init 	|
				variable_declaration COMMA ident_init
			;

variable_type		:	TYPE_INT	| 
				TYPE_CHAR	| 
				TYPE_STR	|
				TYPE_BOOL
			;
		
ident_init 		: 	expr | IDENTIFIER
			;	

expr			: 	assignment_expr
			;

assignment_expr 	:	IDENTIFIER assignment_op assignment_expr |
			 	logical_or
			;

assignment_op 		:	ASSIGN_OP 		|
				PLUS_AND_ASSIGN_OP 	|
				MINUS_AND_ASSIGN_OP	|
				MULT_AND_ASSIGN_OP	|
				DIVIDE_AND_ASSIGN_OP	| 
				MODULUS_AND_ASSIGN_OP
			;

logical_or		: 	logical_or OR logical_and | 
				logical_and
			;

logical_and 		: 	logical_and AND equality_expr |
				equality_expr
			;

equality_expr		: 	equality_expr equality_op relat_expr> |
				relat_expr
			;

equality_op 		:	EQUAL_OP |
				INEQUAL_OP
			;

relat_expr		: 	relat_expr relat_op additive_expr |
				additive_expr
			;

relat_op		: 	LESS_THAN_OP	|
				LESS_OR_EQ_OP	|
				GREATER_THAN_OP	|
				LESS_OR_EQ_OP
			;

additive_expr 		:	additive_expr additive_op multiplicative_exp> |
				multiplicative_exp
			;

additive_op		:  	PLUS_OP |
				MINUS_OP
			;

multiplicative_exp	: 	multiplicative_exp multiplicative_op unary_exp |
				unary_exp
			;

multiplicative_op	: 	MULT_OP 	| 
				DIVIDE_OP 	| 
				MODULUS_OP
			;
			
unary_exp		: 	unary_op unary_exp	|
				unary_op paranth	|
				paranth
			;

unary_op		: 	PLUS_OP	 |
				MINUS_OP |
				NOT
			;

parenth			: 	L_PAREN assignment_expr R_PAREN | 
				function_call 			| 
				const				|
				IDENTIFIER
			;

const			: 	INT_LITERAL	|
				STRING_LITERAL	| 
				CHAR_LITERAL	|
				bool_literal
			;

bool_literal		: 	TRUE | 
				FALSE
			;

while_stmt		:	WHILE L_PAREN expr R_PAREN stmts END_WHILE
			;


for_stmt		: 	FOR L_PAREN for_init SEMICOLON expr SEMICOLON expr R_PAREN stmts END_FOR
			;


for_init		: 	var_declaration |
				expr
			;


if_stmt			: 	IF L_PAREN expr R_PAREN stmts END_IF 		|
				IF L_PAREN expr R_PAREN stmts ELSE stmts END_IF |
				IF L_PAREN expr R_PAREN stmts elif_stmts END_IF
			;

elif_stmts		: 	ELIF L_PAREN expr R_PAREN stmts			|
				ELIF L_PAREN expr R_PAREN stmts ELSE stmts	|
				ELIF L_PAREN expr R_PAREN stmts elif_stmts
			;

function_def		: 	func_return_type IDENTIFIER L_PAREN parameters R_PAREN stmts END_FUNC
			;

func_return_type	: 	TYPE_VOID |
				variable_type
			;

parameters 		: 	parameter | 
				parameter COMMA parameters
			;


parameter		: 	variable_type IDENTIFIER
			;

return_stmt		:  	RETURN ident_or_const |
				RETURN
			;

function_call 		:	func_name L_PAREN arguments R_PAREN
		
			;

arguments		:  	ident_or_const_list
			;

func_name		:  	IDENTIFIER 		| 
				primitive_function_name |
				input_output_fcn		
			;

ident_or_const_list 	: 	ident_or_const |
				ident_or_const COMMA ident_or_const_list
			;

ident_or_const		: 	IDENTIFIER | 
				const		
			;

input_output_fcn	: 	PRINT_FUNC | 
				SCAN_FUNC
			;

primitive_function_name :	INCLINATION_FUNCTION_CALL 	|
				ALTITUDE_FUNCTION_CALL		|
				TEMPERATURE_FUNCTION_CALL 	| 
				ACCELERATION_FUNCTION_CALL	|
				TURN_ON_FUNCTION_CALL 		|
				TURN_OFF_FUNCTION_CALL		|
				TAKE_PICTURE_FUNCTION_CALL 	|
				GET_TIMESTAMP_FUNCTION_CALL	|
				CONNECTION_FUNCTION_CALL	| 
				IS_CAMERA_ACTIVE
			;


%%

#include "lex.yy.c"
yyerror(char *s) { printf("%s", s); }
main() {
	return yyparse();
}
