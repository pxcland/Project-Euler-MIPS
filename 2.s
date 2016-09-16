# Project Euler Problem 2
# Sum of even Fibonacci numbers
# Written by Patrick Cland


	.text
main:
	li	$a0, 2		#total sum; first even number is 2
	li	$t0, 1		#first fibonacci number
	li	$t1, 2		#second fibonacci number
	li	$t2, 2		#constant 2
	li	$t9, 4000000	#constant 4m
	
getFibonacci:
	addu	$t3, $t0, $t1	#sum of last 2 numbers = new number
	move	$t0, $t1		#move the last fibonacci number down
	move	$t1, $t3		#replace with new fibonacci number
	
under4m:
	bge	$t1, $t9, print	#if greater than 4m, we are done
	
isEven:
	rem	$t8, $t1, $t2	#calculate fib % 2 to see if even
	beqz	$t8, sum
	j	getFibonacci
	
sum:
	addu	$a0, $a0, $t1
	j	getFibonacci

print:
	li 	$v0, 1
	syscall
exit:
	li 	$v0, 10
	syscall
