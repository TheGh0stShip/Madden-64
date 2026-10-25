.text
.align 2
.set noreorder
.globl object_texture_descriptor_get
.ent object_texture_descriptor_get
object_texture_descriptor_get:
    lui $v1,0x8008
    lw $v1,-0x7b60($v1)
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    move $s0,$a0
    addiu $v0,$zero,-1
    beq $v1,$v0,.Lzero
     sw $ra,0x14($sp)
    jal func_800A6580
     nop
    andi $v1,$v0,0xff
    addiu $v0,$zero,3
    beq $v1,$v0,.Lmode_one
     addiu $v0,$zero,7
    beq $v1,$v0,.Lmode_ready
     addiu $a0,$zero,2
    j .Lmode_ready
     move $a0,$zero
.Lmode_one:
    addiu $a0,$zero,1
.Lmode_ready:
    lhu $v1,0x54($s0)
    addiu $v0,$zero,8
    beq $v1,$v0,.Ltype_eight
     nop
    addiu $v0,$zero,0xc
    beq $v1,$v0,.Ltype_twelve
     sll $a0,$a0,4
    j .Lreturn
     move $v0,$zero
.Ltype_eight:
    lui $v0,0x8008
    lw $v0,-0x7b60($v0)
    lui $v1,0x8006
    addiu $v1,$v1,0x54a0
    j .Lindex
     sll $a0,$a0,4
.Ltype_twelve:
    lui $v0,0x8008
    lw $v0,-0x7b60($v0)
    lui $v1,0x8006
    addiu $v1,$v1,0x54d0
.Lindex:
    sll $v0,$v0,2
    addu $v0,$v0,$v1
    j .Lreturn
     addu $v0,$a0,$v0
.Lzero:
    move $v0,$zero
.Lreturn:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_texture_descriptor_get
