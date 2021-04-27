#You are going to write two functions here:
# function_one
# function_two

.global function_one
function_one:
    PUSH {LR}
    PUSH {R4-R12}        @This preserves R4 through R12 
	
	MOV R7, #0
	MUL R4, R2, R3
	MOV R5, #3
	MUL R4, R5, R4

top:
	CMP R7, R4
	BGE quit
	LDRB R6, [R0, R7]
	LSR R6, #1
	STRB R6, [R1, R7]
	ADD R7, #1
	B top

quit:
	MOV R1,R5			 @Return value of 0
    POP {R4-R12}         @Restore R4 through R12 for the calling function
	POP {PC}             @Return from a function

.global function_two
function_two:
    PUSH {LR}
    PUSH {R4-R12}        @This preserves R4 through R12 

quit2:
	MOV R0,#0			 @Return value of 0
    POP {R4-R12}         @Restore R4 through R12 for the calling function
	POP {PC}             @Return from a function
