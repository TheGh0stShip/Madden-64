.text
.align 2
.set noreorder
.globl team_record_pointer_find
.ent team_record_pointer_find
team_record_pointer_find:
    addiu $sp,$sp,-0x20
    move $a2,$zero
    sw $s1,0x14($sp)
    addiu $s1,$zero,2
    andi $a1,$a1,0xffff
    slti $v0,$a1,0x27
    sw $ra,0x18($sp)
    beqz $v0,.Lbase
     sw $s0,0x10($sp)
    slti $v0,$a1,0x24
    bnez $v0,.Lbase
     nop
    addiu $a2,$zero,0xf0
    addiu $s1,$zero,1
.Lbase:
    lui $v1,0x8007
    lw $v1,-0x4624($v1)
    addiu $v0,$a2,0x5a9c
    andi $a0,$a0,0xffff
    jal func_80028A58
     addu $s0,$v1,$v0
    andi $v0,$v0,0xffff
    mult $v0,$s1
    mflo $v0
    move $a0,$zero
    sll $v0,$v0,2
    beqz $s1,.Lfound
     addu $s0,$s0,$v0
    lui $a3,0x1fc
    lui $a2,3
    ori $a2,$a2,0xffe0
    lui $a1,0xfe00
.Lloop:
    lw $v1,0($s0)
    and $v0,$v1,$a3
    beqz $v0,.Lfound
     and $v0,$v1,$a2
    beqz $v0,.Lfound
     and $v0,$v1,$a1
    beq $v0,$a1,.Lfound
     addiu $v0,$a0,1
    move $a0,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slt $v0,$v0,$s1
    bnez $v0,.Lloop
     addiu $s0,$s0,4
.Lfound:
    sll $v0,$a0,16
    sra $v0,$v0,16
    xor $v0,$v0,$s1
    sltu $v0,$zero,$v0
    negu $v0,$v0
    and $v0,$s0,$v0
.Lfinish:
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end team_record_pointer_find
