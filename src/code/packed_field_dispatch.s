.text
.align 2
.set noreorder
.globl packed_field_dispatch
.ent packed_field_dispatch
packed_field_dispatch:
    addiu $sp,$sp,-0x18
    sw $ra,0x10($sp)
    lw $v0,0($a0)
    srl $v1,$v0,30
    addiu $v0,$zero,1
    beql $v1,$v0,.Lprimary
     sll $a1,$a1,16
    slti $v0,$v1,2
    beql $v0,$zero,.Lhigher
     addiu $v0,$zero,2
    beqz $v1,.Lbase
     sll $a1,$a1,16
    j .Lzero
     move $v0,$zero
.Lhigher:
    beq $v1,$v0,.Lsecondary
     sll $a1,$a1,16
    addiu $v0,$zero,3
    beq $v1,$v0,.Ltertiary
     nop
    j .Lzero
     move $v0,$zero
.Lbase:
    jal func_8002BE5C
     sra $a1,$a1,16
    j .Lextend
     sll $v0,$v0,16
.Lprimary:
    jal packed_field_primary_get
     sra $a1,$a1,16
    j .Lextend
     sll $v0,$v0,16
.Lsecondary:
    jal packed_field_secondary_get
     sra $a1,$a1,16
    j .Lextend
     sll $v0,$v0,16
.Ltertiary:
    jal func_8002C03C
     sra $a1,$a1,16
    sll $v0,$v0,16
.Lextend:
    sra $v0,$v0,16
.Lzero:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end packed_field_dispatch
