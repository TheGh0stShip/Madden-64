.text
.align 2
.set noreorder
.globl func_800B95D8
.ent func_800B95D8
func_800B95D8:
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x4C70($a1)
    jal         func_80034388
    addu        $s2, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    jal         func_80033B20
    addiu       $a1, $zero, 0x1
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    lw          $v0, 0x3F0($v1)
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x3F4($v1)
    sw          $v0, 0x20($a0)
    lw          $v0, 0x3F8($v1)
    addu        $a2, $v1, $zero
    sw          $v0, 0x24($a0)
.L800B962C:
    sll         $a0, $s2, 16
    sra         $a0, $a0, 16
    addiu       $v1, $a0, 0x4
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a1, 0x715C($at)
    sll         $a0, $a0, 4
    addu        $a0, $a2, $a0
    lw          $v1, 0x400($a0)
    sw          $v1, 0x1C($a1)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a1, 0x715C($at)
    lw          $v1, 0x404($a0)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, .L800B962C
    sw          $v1, 0x20($a1)
    jal         func_8009BA3C
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    lui         $a0, 0x8009
    lw          $a0, -0x7B80($a0)
    lw          $v0, 0x440($v1)
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x444($v1)
    sw          $v0, 0x20($a0)
    lh          $v0, 0x3EC($v1)
.end func_800B95D8
