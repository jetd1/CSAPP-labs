#/* $begin ncopy-ys */
##################################################################
# ncopy.ys - Copy a src block of len ints to dst.
# Return the number of positive ints (>0) contained in src.
#
# Include your name and ID here.
#
# Describe how and why you modified the baseline code.
#
##################################################################
# Do not modify this portion
# Function prologue.
ncopy:	pushl %ebp		# Save old frame pointer
	rrmovl %esp,%ebp	# Set up new frame pointer
	pushl %esi		# Save callee-save regs
	pushl %ebx
	pushl %edi
	mrmovl 8(%ebp),%ebx	# src
	mrmovl 16(%ebp),%edx	# len
	mrmovl 12(%ebp),%ecx	# dst

##################################################################
	xorl	%eax,%eax
	andl	%edx,%edx
	jle		Done
	iaddl	$-4,%edx
	jl		MAKE_UP
LOOP1:
	mrmovl	(%ebx),%esi
	mrmovl	4(%ebx), %edi
	rmmovl	%esi,(%ecx)
	andl	%esi,%esi
	jle		LOOP2
	iaddl	$1,%eax
LOOP2:
	rmmovl	%edi,4(%ecx)
	andl	%edi,%edi
	jle		LOOP3
	iaddl	$1,%eax
LOOP3:
	mrmovl	8(%ebx),%esi
	mrmovl	12(%ebx), %edi
	rmmovl	%esi,8(%ecx)
	andl	%esi,%esi
	jle		LOOP4
	iaddl	$1,%eax
LOOP4:
	rmmovl	%edi,12(%ecx)
	andl	%edi,%edi
	jle		NEXT
	iaddl	$1,%eax
NEXT:
	iaddl	$16,%ebx
	iaddl	$16,%ecx
	iaddl	$-4,%edx
	jge		LOOP1
MAKE_UP:
	iaddl	$4,%edx
MAKE_UP_1:
	iaddl	$-1,%edx
	jl		Done
	mrmovl	(%ebx),%esi
	mrmovl	4(%ebx),%edi
	rmmovl	%esi,(%ecx)
	andl	%esi,%esi
	jle		MAKE_UP_2
	iaddl	$1,%eax
MAKE_UP_2:
	iaddl	$-1,%edx
	jl		Done
	rmmovl	%edi,4(%ecx)
	andl	%edi,%edi
	jle		MAKE_UP_3
	iaddl	$1,%eax
MAKE_UP_3:
	iaddl	$-1,%edx
	jl		Done
	mrmovl	8(%ebx),%esi
	rmmovl	%esi,8(%ecx)
	andl	%esi,%esi
	jle		Done
	iaddl	$1,%eax
##################################################################
# Do not modify the following section of code
# Function epilogue.
Done:
	popl %edi               # Restore callee-save registers
	popl %ebx
	popl %esi
	rrmovl %ebp, %esp
	popl %ebp
	ret
##################################################################
# Keep the following label at the end of your function
End:
#/* $end ncopy-ys */
