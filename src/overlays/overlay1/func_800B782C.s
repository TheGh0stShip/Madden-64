.text
.align 2
.set noreorder
.globl func_800B782C
.ent func_800B782C
func_800B782C:
    lui         $v0, 0x8007
    lw          $v0, 0x18E8($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lhu         $v0, 0x8($v0)
    lui         $at, 0x8008
    sh          $v0, 0x7AC4($at)
    jal         func_800B5028
    addu        $a0, $v0, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    jal         func_800B6378
    nop
    jal         func_800BF1C8
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lui         $a0, 0x8007
    lw          $a0, 0x18E8($a0)
    lw          $v1, 0x1C($v0)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x5998
    lui         $v0, 0x4A0
    lui         $at, 0x8009
    sw          $v0, -0x5994($at)
    sw          $v1, 0x0($s0)
    lhu         $v1, 0x6($a0)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x4CC0($at)
    beqz        $v1, .L800B78B8
    lui         $v0, 0xFB60
    lui         $at, 0x8009
    sw          $v0, -0x5994($at)
.L800B78B8:
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x800A
    addiu       $a1, $a1, 0x3164
    addiu       $s0, $s0, -0x88
    lui         $v0, 0x80
    lui         $at, 0x8009
    sw          $v0, -0x5990($at)
    lui         $v0, 0x12C
    lui         $at, 0x8009
    sw          $v0, -0x5988($at)
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8009
    sw          $v0, -0x5984($at)
    addiu       $v0, $zero, 0x10
    lui         $at, 0x8009
    sw          $v0, -0x5980($at)
    addiu       $v0, $zero, 0x40
    lui         $at, 0x8009
    sh          $v0, -0x599C($at)
    jal         func_8000CB78
    addu        $a2, $s0, $zero
    addu        $a0, $s0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x7F70($v0)
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x8
    lui         $at, 0x8009
    sw          $v0, -0x5A0C($at)
    jal         func_800A2F10
    addu        $a3, $zero, $zero
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B782C
