	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3,r4,r5,r6,lr}
	
	mov r6,0
	cmp r0,0
	ble .L3
	mov r6,1
	cmp r0,1
	beq .L3
  
	
	mov r3,#1
	mov r4,#0
	mov r5,#1
	mov r6,#0
	
	
lop:
	add r6,r4,r5
	add r3,r3,#1
	mov r4,r5
	mov r5,r6
	cmp r3,r0
	beq .L3
	b lop
	

.L3:
	mov r0,r6
	pop {r3, r4, r5, r6, pc}	
	
	.size fibonacci, .-fibonacci
	.end
