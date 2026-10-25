.text
.align 2
.set noreorder
.globl func_800A91F4
.ent func_800A91F4
func_800A91F4:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x28($sp)
    addu        $s0, $a0, $zero
    addiu       $v1, $zero, 0x4
    addiu       $v0, $zero, 0x8
    sw          $ra, 0x2C($sp)
    sh          $v0, 0x54($s0)
    sh          $v0, 0x56($s0)
    sh          $v0, 0x58($s0)
    addiu       $v0, $zero, 0x5
    sh          $v1, 0x4C($s0)
    sh          $v1, 0x4E($s0)
    sh          $v1, 0x50($s0)
    sh          $v1, 0x74($s0)
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
    beqz        $v0, . + 4 + (0x3E << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xD58($at)
    jr          $v0
    nop
.end func_800A91F4
