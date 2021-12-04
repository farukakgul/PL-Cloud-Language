#- This program is intended to display some functionalities of our language.
   Some of properties will be displayed in later test programs.
   Our story of language starts with a keyword, "start"...	
-#
begin

	#- First of all, variables. We have five different types of variable  
	   They are similar to other languages.
	-#
	int i;
	char c;
	string s;
	bool b;

	#  Our variable names might get interesting
	int I_will_never_use_this_variable_again;
	bool $$_never_use_this_too_because_it_is_too_long_to_write_each_time;

	#- As you saw several times,
	   we have multi line comments,
	-#
	
	# and single line comments. Our comments might include any character like "($'")%)(=?_=^')#²½#¹1{¾[]}

	# We can give value to our variables by assigning literals or other variables to them
	int j = 7, a = 2;		# 7 is my lucky number btw. Hope it brings luck in this project too.
	i = j;				# As you remember, we declared i before.
	b = True OR False;	# Obviously True || False is True. But now you see both of our boolean literals, and the OR operator.
	# Assignment between different types is not possible. eg: c = i; 
	c = 'x';
	s = "strings are amazing";

	# We have some arithmetic operators here. 
	int k;
	k = i + j;			
	k = i - j;
	k = i * j;
	k = i / j;
	k = i % j; 		# i modulus j.
	k = 3 + (-5);
	
	# These operators can be combined easily.
	k = i + j * k - i % k * j / i + ( 5 - i ) * 7;		# Our precedence rules are same with the mathematical rules. 

	# Some arithmetic operations might have smaller forms.
	k += i;				# k = k + i
	k -= i;				# k = k - i
	k *= i;				# k = k * i
	k /= i; 			# k = k / i
	k %= 2*i; 			# k = k % 2*i

	# We also have some relational operators.
	bool a;
	a = i == j;
	a = i != j;
	a = i < j; 
	a = i > j;
	a = i <= j;
	a = i >= j;

	# and some boolean operators...
	b = a AND b;
	b = a OR b;
	b = NOT a;

	#- Note that all of operators above are used in many other languages and do the same work in here too.
       Now, it is time to mix those operators... 
	   Note that our precedence rules follow the most known conventions.
	-#
	bool my_bool = ( a OR (k <= ( i + j ) * 4 ) AND NOT ( c != 'a' ) ) OR ( i * j / ( k + 2 ) - 3 > 1234 AND s != "strings are not amazing" );
	# The statement above might be a little bit confusing for us humans. But it is easy peasy for our language to handle it.

	# Let's print what is written in my_bool variable.
	print( "Our great language have evaluated my_bool as: %b\n", my_bool );

	#- This is the end of our first tutorial and test program. Our second test program will 
	cover many other concepts;
	such as loops and conditional statements, function definitions and calls, input-output 		statements and primitive functions with non-tutorial and realistic piece of codes.
	-#
end
