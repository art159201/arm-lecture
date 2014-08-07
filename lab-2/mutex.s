	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
	

	push {r1,r2}
	mov r1,#locked

.L1:
	ldrex r2,[r0]
	cmp r2,#locked
	beq .L1
	strex r2,r1,[r0]
	cmp r2,#0
	bne .L1	
	pop {r1,r2}
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	push {r1}
	mov r1, #unlocked
	str r1,[r0]
	pop {r1}
	
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
