.text
.align 2
.set noreorder
.globl func_800BD408
.ent func_800BD408
func_800BD408:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x24($sp)
    lw          $v0, 0x1C($s0)
    sw          $v0, 0x10($sp)
    lw          $v0, 0x20($s0)
    sw          $v0, 0x14($sp)
    lw          $v1, 0x2C($s0)
    andi        $a1, $a1, 0xFFFF
    .word       0x00650018  # mult        $v1, $a1
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x1C($s0)
    addu        $v0, $v0, $v1
    sra         $v1, $v0, 16
    sw          $v0, 0x1C($s0)
    slti        $v0, $v1, -0x210
    beqz        $v0, .L800BD458
    lui         $v0, 0xFDF0
    sw          $v0, 0x1C($s0)
.L800BD458:
    slti        $v0, $v1, 0x211
    bnez        $v0, .L800BD468
    lui         $v0, 0x210
    sw          $v0, 0x1C($s0)
.L800BD468:
    lw          $v1, 0x30($s0)
    .word       0x00650018  # mult        $v1, $a1
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x20($s0)
    addu        $v0, $v0, $v1
    sra         $v1, $v0, 16
    sw          $v0, 0x20($s0)
    slti        $v0, $v1, -0x400
    beqz        $v0, .L800BD494
    lui         $v0, 0xFC00
    sw          $v0, 0x20($s0)
.L800BD494:
    slti        $v0, $v1, 0x401
    bnez        $v0, .L800BD4A4
    lui         $v0, 0x400
    sw          $v0, 0x20($s0)
.L800BD4A4:
    lw          $v1, 0x34($s0)
    .word       0x00650018  # mult        $v1, $a1
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x24($s0)
    addu        $v0, $v0, $v1
    bgez        $v0, .L800BD4C8
    sw          $v0, 0x24($s0)
    jal         func_800B9554
    addu        $a0, $s0, $zero
.L800BD4C8:
    lw          $v0, 0x2C($s0)
    bnez        $v0, .L800BD4E0
    addu        $v1, $zero, $zero
    lw          $v0, 0x30($s0)
    beqz        $v0, .L800BD4E8
    addu        $v0, $v1, $zero
.L800BD4E0:
    addiu       $v1, $zero, 0x1
    addu        $v0, $v1, $zero
.L800BD4E8:
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800BD408
