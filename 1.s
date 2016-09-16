# Project Euler Problem 1
# Multiples of 3 and 5
# Written by Patrick Cland

#t9 stores sum
#t0 is current number in the iteration
#t8 stores the remainder
#t3 is 3
#t5 is 5
#t1 is constant 1000
	.text
main:
	li	$t0, 0
	li	$t1, 1000
	li	$t3, 3
	li	$t5, 5
	li	$t9, 0
	
iterate:
	addiu	$t0, $t0, 1		#iterate the loop
	bge	$t0, $t1, print		#on 1000, we are done
	rem	$t8, $t0, $t3		#do i % 3
	beqz	$t8, multiple		#if i % 3 = 0, add to sum
	rem	$t8, $t0, $t5
	beqz	$t8, multiple
	j	iterate
	
multiple:
	addu	$t9, $t9, $t0		#add i to total sum
	j	iterate
	
print:
	move	$a0, $t9
	li	$v0, 1
	syscall
exit:
	li	$v0, 10
	syscall
	
	
