# Project Euler Problem 9
# Special Pythagorean triplet
# Written by Patrick Cland


# t0 stores a
# t1 stores b
# t2 stores c
# t3 stores 500 (loop bound)
# t5 stores 1000 (pythagorean triplet sum)
	.text
main:
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 500
	li $t5, 1000
loopA:
	addiu $t0, $t0, 1
	li    $t1, 1
	li    $t2, 1
	bge   $t0, $t3, done
loopB:
	addiu $t1, $t1, 1
	li    $t2, 1
	bge   $t1, $t3, loopA
loopC:
	addiu $t2, $t2, 1
	bge   $t2, $t3, loopB
	
	#s0 stores a^2, s1 b^2 s2 c^2
testIf1000:
	addu $t4, $t0, $t1			#see if the sum of a b c is 1000
	addu $t4, $t4, $t2
	beq  $t4, $t5, isPTriplet	#if so, calculate if it is a pythagorean triplet
	j loopC
	
isPTriplet:
	mul  $s0, $t0, $t0
	mul  $s1, $t1, $t1
	mul  $s2, $t2, $t2
	addu $s3, $s0, $s1		#calculate the squares and see if it is a pythagorean triplet
	beq  $s2, $s3, getAnswer
	j    loopC
	
getAnswer:
	mul $a0, $t0, $t1		#calculate abc 
	mul $a0, $a0, $t2
print:
	li $v0, 1
	syscall
done:
	li $v0, 10
	syscall
