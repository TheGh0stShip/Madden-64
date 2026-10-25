.text
.align 2
.set noreorder
.globl func_80004B54
.ent func_80004B54
func_80004B54:
    lui         $a1, 0x8006
    lw          $a1, 0x4A00($a1)
    addiu       $sp, $sp, -0x18
    addiu       $a2, $zero, 0xF
    sw          $ra, 0x10($sp)
.L80004B68:
    lw          $v1, 0x4($a1)
.L80004B6C:
    lw          $v0, 0x4($a1)
    beq         $v0, $v1, .L80004B6C
    addiu       $a3, $zero, 0x7
.L80004B78:
    lw          $v0, 0x14($a1)
    addu        $t0, $a3, $zero
    sll         $a0, $t0, 5
    addu        $v0, $a0, $v0
    lw          $v0, 0x0($v0)
    beqz        $v0, .L80004BA8
    nop
    lw          $v1, 0x14($a1)
    addu        $v1, $a0, $v1
    lw          $v0, 0x0($v1)
    addiu       $v0, $v0, -0x1
    sw          $v0, 0x0($v1)
.L80004BA8:
    lw          $v0, 0x14($a1)
    addu        $v0, $a0, $v0
    lw          $v0, 0x4($v0)
    beqz        $v0, .L80004BD0
    nop
    lw          $v1, 0x14($a1)
    addu        $v1, $a0, $v1
    lw          $v0, 0x4($v1)
    addiu       $v0, $v0, -0x1
    sw          $v0, 0x4($v1)
.L80004BD0:
    bnez        $t0, .L80004B78
    addiu       $a3, $a3, -0x1
    addu        $v0, $a2, $zero
    bnez        $v0, .L80004B68
    addiu       $a2, $a2, -0x1
    addiu       $a2, $zero, 0x1
.L80004BE8:
    lw          $v1, 0x4($a1)
.L80004BEC:
    lw          $v0, 0x4($a1)
    beq         $v0, $v1, .L80004BEC
    addu        $v0, $a2, $zero
    bnez        $v0, .L80004BE8
    addiu       $a2, $a2, -0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6A30
    jal         func_80045CE8
    nop
    addiu       $a2, $zero, 0x1
    lui         $v1, 0xA450
    ori         $v1, $v1, 0x4
.L80004C1C:
    lw          $v0, 0x0($v1)
    srl         $v0, $v0, 2
    bnez        $v0, .L80004C1C
    addu        $v0, $a2, $zero
    bnez        $v0, .L80004C1C
    addiu       $a2, $a2, -0x1
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    lw          $a1, 0x14($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    lw          $a1, 0xC($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    lw          $a1, 0x10($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x4A00($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8006
    sw          $zero, 0x4A00($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80004B54
