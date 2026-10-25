.text
.align 2
.set noreorder
.globl func_800920B8
.ent func_800920B8
func_800920B8:
    lhu         $v0, 0x5BFE($v0)
    addiu       $a0, $v0, -0x1
    sll         $v0, $a0, 16
    sra         $a1, $v0, 16
    lui         $at, 0x8008
    sh          $a0, 0x5BFE($at)
    bgez        $a1, .L80092110
    addiu       $v0, $zero, -0x1
    jal         func_80031A1C
    addiu       $a0, $zero, 0x28
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    addiu       $v0, $v0, 0x3C
    lui         $at, 0x8008
    sh          $v0, 0x5BFE($at)
    andi        $v1, $v1, 0x100
    bnez        $v1, .L8009214C
    nop
    jal         func_80093110
    nop
    j           func_8008DA28
    nop
.L80092110:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, .L8009214C
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x2
    bnez        $v0, .L8009214C
    nop
    beqz        $a1, .L8009214C
    andi        $v0, $a0, 0x1F
    bnez        $v0, .L8009214C
    nop
    jal         func_800416A4
    addiu       $a0, $zero, 0xA
.L8009214C:
    lw          $ra, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800920B8
