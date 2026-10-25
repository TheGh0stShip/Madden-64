.text
.align 2
.set noreorder
.globl func_80095FA4
.ent func_80095FA4
func_80095FA4:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80095FCC
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    j           func_800918B4
    andi        $v0, $v0, 0x1FFF
.L80095FCC:
    lui         $v0, 0x8007
    lhu         $v0, -0x4854($v0)
    andi        $v0, $v0, 0x1FFF
    addu        $v1, $v0, $zero
    slti        $v0, $v1, 0x56
    beqz        $v0, .L80096010
    slti        $v0, $v1, 0x51
    beqz        $v0, .L80096040
    slti        $v0, $v1, 0x12
    bnez        $v0, .L80096068
    slti        $v0, $v1, 0x15
    bnez        $v0, .L80096040
    slti        $v0, $v1, 0x18
    beqz        $v0, .L80096068
    nop
    j           func_80091930
    nop
.L80096010:
    addiu       $v0, $zero, 0xB7
    beq         $v1, $v0, .L80096054
    slti        $v0, $v1, 0xB8
    beqz        $v0, .L80096034
    addiu       $v0, $zero, 0x79
    beq         $v1, $v0, .L80096054
    nop
    j           func_80091944
    nop
.L80096034:
    addiu       $v0, $zero, 0xB8
    bne         $v1, $v0, .L80096068
    nop
.L80096040:
    jal         func_80041658
    nop
    lui         $a0, 0x2
    j           func_80091970
    ori         $a0, $a0, 0x300
.L80096054:
    jal         func_80041658
    nop
    lui         $a0, 0x1
    j           func_80091970
    ori         $a0, $a0, 0x400
.L80096068:
    jal         func_80093F0C
    nop
    beqz        $v0, .L800960A0
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0xA
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 2
    lui         $at, 0x8006
    addu        $at, $at, $v0
    lw          $a0, 0x4A74($at)
    addiu       $a1, $zero, 0x2
    jal         func_80034D30
    addu        $a2, $zero, $zero
.L800960A0:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80095FA4
