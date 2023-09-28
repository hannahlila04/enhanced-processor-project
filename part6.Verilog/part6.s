
			mvt	 	r0, #0x30	
			mvt		r1, #0x10	
			mv		r3, #0
			
OUT_LOOP:	ld		r2, [r0]
			add		r2, #1
IN_LOOP:	b		DO_DELAY
RETURN:		sub		r2, #1
			bne		IN_LOOP
			add		r3, #1
			st		r3, [r1]
			b		OUT_LOOP
			

DO_DELAY: 	mv 		r4, #DELAY
SUB_LOOP: 	sub 	r4, #1
			beq		RETURN
			b	 	SUB_LOOP
			
DELAY:		.word	5000