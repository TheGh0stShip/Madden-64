.text
.align 2
.set noreorder
.globl integer_vectors_submit
.ent integer_vectors_submit
integer_vectors_submit:
    lui $at,%hi(D_80002E88)
    lwc1 $f2,%lo(D_80002E88)($at)
    addiu $sp,$sp,-0x28
    sw $ra,0x20($sp)
    lwc1 $f0,0($a2)
    cvt.s.w $f0,$f0
    mul.s $f0,$f0,$f2
    lwc1 $f4,0($a1)
    cvt.s.w $f4,$f4
    mul.s $f4,$f4,$f2
    lwc1 $f6,4($a1)
    cvt.s.w $f6,$f6
    mul.s $f6,$f6,$f2
    lwc1 $f8,8($a1)
    cvt.s.w $f8,$f8
    swc1 $f0,0x10($sp)
    lwc1 $f0,4($a2)
    cvt.s.w $f0,$f0
    mul.s $f0,$f0,$f2
    nop
    mul.s $f8,$f8,$f2
    swc1 $f0,0x14($sp)
    lwc1 $f0,8($a2)
    cvt.s.w $f0,$f0
    mul.s $f0,$f0,$f2
    mfc1 $a1,$f4
    mfc1 $a3,$f8
    mfc1 $a2,$f6
    jal func_8000F344
     swc1 $f0,0x18($sp)
    lw $ra,0x20($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end integer_vectors_submit
