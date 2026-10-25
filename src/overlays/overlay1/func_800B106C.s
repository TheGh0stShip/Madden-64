.text
.align 2
.set noreorder
.globl func_800B106C
.ent func_800B106C
func_800B106C:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $s4, 0x28($sp)
    addiu       $s4, $zero, 0xB4
    sw          $ra, 0x2C($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    jal         func_800AD460
    sw          $s1, 0x1C($sp)
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L800B10BC
    addiu       $s2, $zero, 0x60
    addiu       $a0, $zero, 0xC
    jal         func_80041BDC
    addiu       $a1, $zero, 0xA
    j           func_800AC9A0
    sll         $v0, $v0, 16
.L800B10BC:
    addu        $v0, $zero, $zero
    sll         $v0, $v0, 16
    bnez        $v0, .L800B10E0
    addiu       $a0, $zero, 0x1
    sw          $zero, 0x10($sp)
    lw          $a2, 0x4($s0)
    addiu       $a1, $zero, 0x16
    jal         func_800B7DD8
    addu        $a3, $zero, $zero
.L800B10E0:
    lui         $v0, 0x8008
    lh          $v0, 0x7702($v0)
    bnez        $v0, .L800B1168
    addiu       $v0, $zero, 0x6
    lw          $v1, 0x4($s0)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xC90($at)
    addiu       $v1, $v0, -0x76
    sltiu       $v0, $v1, 0x10
    beqz        $v0, .L800B1158
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xF78($at)
    jr          $v0
    nop
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x1E18
    j           func_800ACA4C
    addiu       $v0, $zero, 0x6
.L800B1158:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x1DF4
    j           func_800ACA4C
    addiu       $v0, $zero, 0x6
.L800B1168:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x1DD0
    lui         $at, 0x8007
    sw          $v0, -0x4674($at)
    lw          $v1, 0x4($s0)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xC91
    addu        $v0, $v0, $v1
    lui         $at, 0x8007
    sw          $v0, -0x4670($at)
    lw          $v1, 0x4($s0)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D96($at)
    beqz        $v0, .L800B1244
    nop
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5A58
    lui         $at, 0x8007
    sw          $a1, -0x466C($at)
    lw          $v1, 0x4($s0)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $a0, 0x2D96($at)
    jal         func_800167FC
    nop
    j           func_800ACB30
    nop
.L800B1244:
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x41B4
    lui         $at, 0x8007
    sw          $v0, -0x466C($at)
    lw          $s3, 0x4($s0)
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x4674
    addiu       $v0, $zero, 0x2
    sw          $v0, 0x0($s0)
    addiu       $v0, $zero, 0x68
    beql        $s2, $v0, .L800B1274
    addiu       $s4, $zero, 0x96
.L800B1274:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    jal         func_800363F4
    addiu       $a1, $v0, 0x2
    jal         func_800AE680
    nop
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x46B8
    lui         $v1, 0x8009
    lh          $v1, -0x6A2E($v1)
    addu        $a2, $s1, $zero
    addu        $a3, $s4, $zero
    addu        $s0, $v0, $zero
    jal         func_8003DDF8
    sw          $v1, 0x10($sp)
    addu        $a0, $s2, $zero
    sll         $a1, $s3, 16
    sra         $a1, $a1, 16
    addu        $a2, $s1, $zero
    jal         func_800AEFF8
    addu        $a3, $s0, $zero
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B106C
