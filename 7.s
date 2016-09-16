# Project Euler Problem 9
# 10001th prime
# Written by Patrick Cland

# a0 stores the number we are testing
# t1 is the counter of primes
# t2 is 10001

	.text
main:
	li $a0, 2
	li $t1, 1
	li $t2, 10001
	
loop:
	addiu $a0, $a0, 1
testPrime:
	sra   $t3, $a0, 1		#to test prime, divide by 2 (shift right 1) and add 1 so we don't test extra cases
	addiu $t3, $t3, 1
	li    $t4, 2
primeLoop:
	rem   $t5, $a0, $t4		#calculate remainder, if none, not prime, and try next number
	beqz  $t5, loop
	beq   $t4, $t3, primeFound
	addiu $t4, $t4, 1
	j     primeLoop
primeFound:
	addiu $t1, $t1, 1		#if prime, increment prime counter
	beq   $t1, $t2, done	#if 10001th prime, we are done
	j     loop
done:
	li $v0, 1	#print
	syscall
	li $v0, 10
	syscall
	
	