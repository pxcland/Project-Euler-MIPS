# Project Euler Problem 5
# Smallest multiple
# Written by Patrick Cland

# t0 stores the dividend
# t1 the divisor counter, 1-20
# t2 stores 20, the boundary of the loop

	.text
main:
	li $t0, 0
	li $t2, 10
	
increment:
	addiu $t0, $t0, 10	#increment the dividend by 20, anything less is redundant
	li    $t1, 1		#reset the divisor
	
testDivisible:
	rem  $t9, $t0, $t1
	beqz $t9, evenDiv	#if this was an even division, try the next
	j    increment
	
evenDiv:
	addiu $t1, $t1, 1	#increment the divisor
	bgt   $t1, $t2, done	#if the divisor is greater than 20, test if the number is prime
	j     testDivisible	#and test it
	
done:
	move $a0, $t0	#print and exit
	li   $v0, 1
	syscall
	li   $v0, 10
	syscall
	
