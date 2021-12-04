#- @name: Cloud
   Driver program for drone.
   Contains a command line menu for user to control the drone. S
-#

void print_status()
		# Reads and prints inclination
		float inclination;
		inclination = get_inclination();
		print( "Current inclination is: ", inclination );

		# Reads and prints altitude
		float altitude;
		altitude = get_altitude();
		print( "Current altitude is: ", altitude );
	
		# Reads and prints temperature
		float tempetarute;
		temperature = get_temperature();
		print( "Current temperature is: ", temperature );
	
		# Reads and prints acceleration
		float acceleration;
		acceleration = get_acceleration();
		print( "Current acceleration is: ", acceleration );

		# Reads and prints timestamp
		string timestamp;
		timestamp = get_timestamp();
		print( "Current timestamp is: ", timestamp );
	return ;	
endfunc

begin
	# First, the drone is connected to the base computer through wifi
	if ( connect_base() )
		print( "Successfully connected to computer.\n" );
	else 
		print( "Connection to computer failed!\n" );
	endif

	#- This function enables drone to read and print various status 
	   together, which are inclanation, altitude, temperature, acceleration
           and timestamp
	-# 

	# User menu

	# Print welcome message
	print( "Welcome. I'm your friendly drone Cloud. How can I serve you?" );	
	# Get an instruction from user and perform it.  
	char in = 'a';
	while ( in != 'q' AND in != 'Q' ) # Loop continues until user quits.
		# Print the options 
		print( "Please select one of the options below: " );
		print( "d: Display current status of the place." );
		print( "o: Open camera." );
		print( "c: Close camera." );
		print( "p: Take picture." );
		print( "q: Quit." );

		# Read the user's selection
		print( "Please enter your selection (by entering the corresponding character): " );
		in = scan( "char" );
		
		# Process the user's selection
		if ( in == 'd' OR in == 'D' )
			print_status();
		elif (  in == 'o' OR in == 'O' )
			if ( is_camera_active() )
				print( "Sir, please forgive me but are you not seeing my video streaming?" );
			else
				turn_on_camera();
				print( "Oh my God! I can see, I can see!!!" );
			endif
		elif ( in == 'c' OR in == 'C' )
			if ( is_camera_active() )
				print( "Time to close my eyes..." ); 
				turn_off_camera();
			else
				print( "My sir, you have already taken my vision. What else do you want me to sacrifice? My soul?" );
			endif
		elif ( in == 'p' OR in == 'P' )
			if ( is_camera_active() )
				print( "Alright, here is your amazing best quality super huper photo." 
				take_picture();	
			else
				print( "The only thing that I can see is the darkness." );
			endif
		elif ( in == 'q' OR in == 'Q' )
			print( "So, our great journey ends here? Okey then, see you again master. I look forward to our next meeting. Goodbye..." );
		else 
			print( "Ah, please forgive my mindlessness. I couldn't understand your order. Or maybe your cat misclicked the keyboard." );
		endif
	endwhile	
end
~
@

