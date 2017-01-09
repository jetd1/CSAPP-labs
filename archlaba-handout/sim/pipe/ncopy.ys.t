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
LOOP:
	mrmovl	(%ebx),%esi
	iaddl	$4,%ebx
	rmmovl	%esi,(%ecx)
	iaddl	$4,%ecx
	andl	%esi,%esi
	jle		NADD
	iaddl	$1,%eax
NADD:
	iaddl	$-1,%edx
	jne		LOOP
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
