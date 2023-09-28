.define HEX_ADDRESS 0x20
.define SW_ADDRESS 0x30
// This program shows a decimal counter on the HEX displays

MAIN: 		mv  	r0, #0
			mvt		r5, #HEX_ADDRESS // hex
			mv  	r6, pc
			mv  	pc, #BLANK
			mvt	 	r3, #SW_ADDRESS  // switches	

// delay loop for controlling HEX display updates

OUT_LOOP:	mvt	 	r3, #SW_ADDRESS  // switches
			ld		r2, [r3] // read from switches
			add		r2, #1 
IN_LOOP:	b		DO_DELAY  // inner delay loop
RETURN:		sub		r2, #1
			bne		IN_LOOP  // end inner loop
			mv		r3, #DISP
			ld		r3, [r3]
			sub		r3, r0
			beq		RESET
RET2:		add		r0, #1
			mv		r3, r0
			b		DISPLAY  // display on HEX
RET:		mv		r0, r3
			b		OUT_LOOP
			
RESET:		mv		r0, #0
			b		RET2
			
DO_DELAY: 	mv	 	r4, #MAX 
			ld		r4, [r4]
SUB_LOOP: 	sub 	r4, #1
			beq		RETURN
			b	 	SUB_LOOP

// subroutine DIV10 returns quotient in r1 and remainder in r0
DIV10:   	mv		r1, #0  // init Q
DLOOP:	 	mv		r4, #9  // check if r0 is < 10
		 	sub		r4, r0  
			bpl		RETDIV  // if yes, return
		 
INC:     	add		r1, #1  // if no, increment Q
		 	sub		r0, #10  // r0 -= 10
		 	b		DLOOP  // loop
RETDIV:	
		 	add		r6, #1  // adjust return address
         	mv		pc, r6  // return results
		 
		 
// subroutine BLANK

BLANK:	 	st		r0, [r5] // HEX0
		 	add		r5, #1
		 	st		r0, [r5] // HEX1
		 	add		r5, #1
		 	st		r0, [r5] // HEX2
		 	add		r5, #1
		 	st		r0, [r5] // HEX3
		 	add		r5, #1
		 	st		r0, [r5] // HEX4
		 	add		r5, #1
		 	st		r0, [r5] // HEX5
			mvt		r5, #HEX_ADDRESS
		 	add 	r6, #1
			mv 		pc, r6

// subroutine DISPLAY, assuming number is in r0

DISPLAY:   	mv  	r6, pc
			mv		pc, #DIV10  // get 1s digit in r0
		   	mv		r4, #DATA
		   	add		r4, r0
		   	ld		r4, [r4]
		   	st		r4, [r5] // store in HEX0
		   	add		r5, #1 // point to HEX1
			mv		r0, r1
		   
		    mv  	r6, pc
		   	mv		pc, #DIV10  // get 10s digit in r0
		   	mv		r4, #DATA
		   	add		r4, r0
		   	ld		r4, [r4]
		   	st		r4, [r5] // store in HEX1
		   	add		r5, #1 // point to HEX2
			mv		r0, r1
		   
		    mv  	r6, pc
		   	mv		pc, #DIV10  // get 100s digit in r0
		   	mv		r4, #DATA
		   	add		r4, r0
		   	ld		r4, [r4]
		   	st		r4, [r5] // store in HEX2
		   	add		r5, #1 // point to HEX3
			mv		r0, r1
		   
		    mv  	r6, pc
		   	mv		pc, #DIV10  // get 1000s digit in r0, last digit in r1
		   	mv		r4, #DATA
		   	add		r4, r0
		   	ld		r4, [r4]
		   	st		r4, [r5] // store in HEX3
		   	add		r5, #1 // point to HEX4
		   	mv		r4, #DATA
		   	add		r4, r1
		   	ld		r4, [r4]
		   	st		r4, [r5] // store in HEX4
			
			mvt		r5, #HEX_ADDRESS
			
			b		RET


DATA: .word  0b00111111 // '0'
	  .word	 0b00000110 // '1'
	  .word	 0b01011011 // '2'
	  .word  0b01001111 // '3'
	  .word  0b01100110 // '4'
	  .word  0b01101101 // '5'
	  .word  0b01111101 // '6'
	  .word  0b00000111 // '7'
	  .word  0b01111111 // '8'
	  .word  0b01100111 // '9'
	  
MAX:  .word 50

DISP: .word 65535

