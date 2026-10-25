.text
.align 2
.set noreorder
.globl func_800A94A0
.ent func_800A94A0
func_800A94A0:
    sh          $v1, 0x76($s0)
    sh          $v1, 0x78($s0)
    sh          $v0, 0x7C($s0)
    sh          $v0, 0x7E($s0)
    sh          $v0, 0x80($s0)
    sh          $zero, 0x22($sp)
    lhu         $v0, 0x6($s0)
    sh          $v0, 0x24($sp)
    lh          $v1, 0xA($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x5820($at)
    lh          $v1, 0xA($s0)
    sw          $v0, 0x18($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x581C($at)
    sw          $v0, 0x18($sp)
    lh          $v1, 0xA($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $v0, -0x5818($at)
    sh          $v0, 0x20($sp)
    lh          $v1, 0xA($s0)
    sltiu       $v0, $v1, 0xD
    beqz        $v0, .L800A95E8
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xD90($at)
    jr          $v0
    nop
    j           func_800A4E64
    lui         $v0, 0x140
    lui         $v0, 0x180
    sw          $v0, 0x18($s0)
    lui         $v0, 0xBE
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x56E
    j           func_800A4EC4
    sh          $v0, 0x20($sp)
    lui         $v0, 0x1C0
    sw          $v0, 0x18($s0)
    lui         $v0, 0xBE
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x550
    j           func_800A4EC4
    sh          $v0, 0x20($sp)
    lui         $v0, 0xE0
    sw          $v0, 0x18($s0)
    lui         $v0, 0xBE
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x596
    j           func_800A4EC4
    sh          $v0, 0x20($sp)
    jal         func_800A6C48
    addu        $a0, $s0, $zero
    lh          $v0, 0xA($s0)
    lui         $v1, 0xE0
    sw          $v1, 0x18($s0)
    addiu       $v1, $zero, 0x6
    bne         $v0, $v1, .L800A95E4
    lui         $v0, 0xBE
    lw          $v1, 0x98($s0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800A95DC
    lui         $v0, 0x1E0
    bnez        $v1, .L800A95E4
    lui         $v0, 0xBE
    lui         $v0, 0x20
.L800A95DC:
    sw          $v0, 0x18($s0)
    lui         $v0, 0xBE
.L800A95E4:
    sw          $v0, 0x18($sp)
.L800A95E8:
    lh          $a0, 0x24($sp)
    lw          $a2, 0x18($s0)
    jal         func_800B9274
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x14($s0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A967C
    nop
    lw          $v0, 0xC($s0)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x1C($v0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x20($v0)
    lw          $v0, 0x14($sp)
    lw          $a0, 0x18($s0)
    bgez        $a0, .L800A963C
    addu        $v1, $v1, $v0
    addiu       $a0, $a0, 0x7
.L800A963C:
    sra         $v0, $a0, 3
    addu        $a0, $v1, $v0
    sw          $a0, 0x14($sp)
    lh          $v1, 0xA($s0)
    addiu       $v0, $zero, 0x6
    bnel        $v1, $v0, .L800A96F4
    addu        $a0, $s0, $zero
    lw          $v1, 0x98($s0)
    bnez        $v1, .L800A966C
    addiu       $v0, $zero, 0x1
    j           func_800A4FC4
    lui         $v0, 0x80
.L800A966C:
    bnel        $v1, $v0, .L800A96F4
    addu        $a0, $s0, $zero
    j           func_800A4FC4
    lui         $v0, 0xFFA0
.L800A967C:
    lw          $v0, 0xC($s0)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x1C($v0)
    subu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x20($v0)
    lw          $v0, 0x14($sp)
    lw          $a0, 0x18($s0)
    bgez        $a0, .L800A96AC
    subu        $v1, $v1, $v0
    addiu       $a0, $a0, 0x7
.L800A96AC:
    sra         $v0, $a0, 3
    addu        $a0, $v1, $v0
    sw          $a0, 0x14($sp)
    lh          $v1, 0xA($s0)
    addiu       $v0, $zero, 0x6
    bnel        $v1, $v0, .L800A96F4
    addu        $a0, $s0, $zero
    lw          $v1, 0x98($s0)
    bnez        $v1, .L800A96DC
    addiu       $v0, $zero, 0x1
    j           func_800A4FC4
    lui         $v0, 0xFF80
.L800A96DC:
    bnel        $v1, $v0, .L800A96F4
    addu        $a0, $s0, $zero
    lui         $v0, 0x60
    addu        $v0, $a0, $v0
    sw          $v0, 0x14($sp)
    addu        $a0, $s0, $zero
.L800A96F4:
    jal         func_800A2E58
    addiu       $a1, $sp, 0x10
    addu        $a0, $s0, $zero
    jal         func_800A2EB4
    addiu       $a1, $sp, 0x20
    lw          $ra, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A94A0
