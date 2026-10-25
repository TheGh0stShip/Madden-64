.text
.align 2
.set noreorder
.globl func_800C2EA8
.ent func_800C2EA8
func_800C2EA8:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L800C3094
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8008
    lb          $v0, 0x7AF2($v0)
    bnez        $v0, .L800C3078
    nop
    lui         $v1, 0x8008
    lh          $v1, 0xC20($v1)
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L800C306C
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x29B0($at)
    jr          $v0
    nop
    lui         $a0, 0x800C
    addiu       $a0, $a0, -0x19BC
    jal         func_8002FFEC
    nop
    lui         $at, 0x8008
    sh          $zero, 0xC20($at)
    j           func_800BE94C
    addiu       $v0, $zero, -0x1
    jal         func_80036540
    addu        $a0, $zero, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    lui         $a0, 0x800C
    addiu       $a0, $a0, -0x19BC
    andi        $v0, $v0, 0xFFFD
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
    jal         func_8002FFEC
    nop
    jal         func_80016FD4
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x4CC4($v1)
    sll         $v1, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lh          $a1, 0x2730($at)
    jal         func_80035F88
    andi        $a0, $v0, 0xFFFF
    lui         $at, 0x8008
    sh          $zero, 0xC20($at)
    j           func_800BE94C
    addiu       $v0, $zero, -0x1
    jal         func_80016FD4
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x4CC4($v1)
    sll         $v1, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lh          $a1, 0x2730($at)
    jal         func_80035F88
    andi        $a0, $v0, 0xFFFF
    lui         $at, 0x8008
    sh          $zero, 0xC20($at)
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x506C($a1)
    jal         func_8000D874
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x506C($a1)
    jal         func_8000D834
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8007
    lw          $a1, 0x2754($a1)
    jal         func_8000D834
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8007
    lw          $a1, 0x2758($a1)
    jal         func_8000D834
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x76F8($a0)
    jal         func_8001AEA8
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x5960($a0)
    jal         func_800AADA8
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x595E($a0)
    jal         func_800AADA8
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x5940($a0)
    jal         func_800AADA8
    nop
    j           func_800BE94C
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sh          $zero, 0xC20($at)
    lui         $a0, 0x800C
    addiu       $a0, $a0, -0x19BC
    jal         func_8002FFEC
    nop
.L800C306C:
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x4CC4($at)
.L800C3078:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0xFFFE
    ori         $v1, $v1, 0xDFFF
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800C3094:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C2EA8
