# Project Euler Problem 4
# Largest palindrome product
# Written by Patrick Cland


# t0 is constant 999
# t1 is number 1
# t2 is number 2
# a1 is address of variable
	.text
main:
	li $t0, 999
	li $t1, 99		#starts at 3 digit numbers
	la $a1, num
	
loop1:
	addiu $t1, $t1, 1	#increment loop for number 1
	bge   $t1, $t0, done 	#999 is the bound of the loop
	li    $t2, 99		#reset 2nd loop counter
loop2:
	addiu $t2, $t2, 1	#increment loop for number 2
	bge   $t2, $t0, loop1
	mul   $v0, $t1, $t2
	jal   isPalindrome	#v1 is return value
	beqz  $v1, loop2	#if not a palindrome, get the next number
	lw    $v1, ($a1)	#make sure we only overwrite the number if it is greater than the current one
	blt   $v0, $v1, loop2
	sw    $v0, ($a1)	#if a palindrome, save it and overwrite the last
	j     loop2
	
done:
	lw $a0, ($a1)		#print
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
	
	#takes argument in $v0
	#returns 0 or 1 in $v1
isPalindrome:
	move $t9, $v0		#save a copy, as we will need it later
	li   $v1, 0		#stores the reversed numer for now
	li   $t8, 10
isPalindromeLoop:
	rem   $t7, $v0, $t8	#modulus 10 to get the least significant digit
	mul   $v1, $v1, $t8	#multiply by 10 to move the digits up a place 
	addu  $v1, $v1, $t7	#and add the least significant digit
	div   $v0, $v0, $t8	#divide by 10 to get the next digit above
	blez  $v0, isPalindromeDone
	j isPalindromeLoop
isPalindromeDone:
	move $v0, $t9		#callee restores v0
	beq  $v1, $t9, yes	#if the reversed = original, is a palindrome
	li   $v1, 0
	jr   $ra
yes:
	li   $v1, 1
	jr   $ra
	
	.data
num:
.space 4
	
