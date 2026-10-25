.text
.align 2
.set noreorder
.globl menu_buffer_prepare_once
.ent menu_buffer_prepare_once
menu_buffer_prepare_once:
    lui $v0,0x8007
    lw $v0,-0x4624($v0)
    addiu $sp,$sp,-0x18
    sw $ra,0x10($sp)
    lw $v1,0x5c04($v0)
    lui $v0,0xcaac
    ori $v0,$v0,0xcaac
    beq $v1,$v0,.Ldone
     addiu $v0,$zero,1
    lui $v1,0x8007
    lhu $v1,-0x4628($v1)
    bne $v1,$v0,.Lmode_two
     addiu $v0,$zero,2
    lui $a0,0x8007
    lhu $a0,-0x4620($a0)
    lui $a1,0x8007
    addiu $a1,$a1,-0x461c
    j .Ldispatch
     nop
.Lmode_two:
    bne $v1,$v0,.Lmark
     nop
    lui $a0,0x800c
    lbu $a0,0x4eeb($a0)
    lui $a1,0x8008
    addiu $a1,$a1,0x6190
    sll $a0,$a0,24
    sra $a0,$a0,24
    andi $a0,$a0,0xffff
.Ldispatch:
    jal func_80028744
     nop
.Lmark:
    lui $v1,0x8007
    lw $v1,-0x4624($v1)
    lui $v0,0xcaac
    ori $v0,$v0,0xcaac
    sw $v0,0x5c04($v1)
    addiu $v0,$zero,1
    lui $at,0x8008
    sh $v0,0x55d4($at)
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end menu_buffer_prepare_once
