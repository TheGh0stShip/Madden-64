.text
.align 2
.set noreorder
.globl func_800B76D8
.ent func_800B76D8
func_800B76D8:
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
    jal         func_800BF1C8
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x800A
    addiu       $a1, $a1, 0x3164
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x59D4
    lui         $a3, 0x8009
    lw          $a3, -0x59F4($a3)
    lui         $t0, 0x8009
    lw          $t0, -0x59F0($t0)
    lui         $t1, 0x8009
    lw          $t1, -0x59EC($t1)
    addiu       $s0, $v0, -0x4C
    addiu       $v1, $zero, 0x3
    sh          $v1, 0x0($v0)
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8009
    sh          $v1, -0x59D2($at)
    lui         $at, 0x8009
    sh          $v1, -0x59C8($at)
    lui         $at, 0x8009
    sh          $v1, -0x59A4($at)
    lui         $at, 0x8009
    sh          $v1, -0x59A2($at)
    lui         $at, 0x8009
    sh          $v1, -0x59A0($at)
    addiu       $v1, $zero, 0x400
    lui         $at, 0x8009
    sh          $v0, -0x59AC($at)
    lui         $at, 0x8009
    sh          $v0, -0x59AA($at)
    lui         $at, 0x8009
    sh          $v0, -0x59A8($at)
    addiu       $v0, $zero, 0x500
    lui         $at, 0x8009
    sh          $v0, -0x59BC($at)
    lui         $v0, 0x80
    lui         $at, 0x8009
    sh          $v1, -0x599C($at)
    lui         $at, 0x8009
    sh          $v1, -0x59C4($at)
    lui         $at, 0x8009
    sh          $zero, -0x59C2($at)
    lui         $at, 0x8009
    sh          $zero, -0x59BA($at)
    lui         $at, 0x8009
    sh          $zero, -0x59B8($at)
    lui         $at, 0x8009
    sw          $v0, -0x5988($at)
    lui         $at, 0x8009
    sw          $zero, -0x5984($at)
    lui         $at, 0x8008
    sw          $a3, -0x5DD4($at)
    lui         $at, 0x8008
    sw          $t0, -0x5DD0($at)
    lui         $at, 0x8008
    sw          $t1, -0x5DCC($at)
    jal         func_8000CB78
    addu        $a2, $s0, $zero
    addu        $a0, $s0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x7F70($v0)
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x7
    lui         $at, 0x8009
    sw          $v0, -0x5A0C($at)
    jal         func_800A2F10
    addu        $a3, $zero, $zero
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B76D8
