.text
.align 2
.set noreorder
.globl func_80004C98
.ent func_80004C98
func_80004C98:
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    beqz        $v0, .L80004D2C
    nop
    addu        $a1, $v0, $zero
    addiu       $t0, $zero, 0xF
.L80004CB0:
    lw          $v1, 0x4($a1)
.L80004CB4:
    lw          $v0, 0x4($a1)
    beq         $v0, $v1, .L80004CB4
    addiu       $a2, $zero, 0x7
.L80004CC0:
    lw          $v0, 0x14($a1)
    addu        $a3, $a2, $zero
    sll         $a0, $a3, 5
    addu        $v0, $a0, $v0
    lw          $v0, 0x0($v0)
    beqz        $v0, .L80004CF0
    nop
    lw          $v1, 0x14($a1)
    addu        $v1, $a0, $v1
    lw          $v0, 0x0($v1)
    addiu       $v0, $v0, -0x1
    sw          $v0, 0x0($v1)
.L80004CF0:
    lw          $v0, 0x14($a1)
    addu        $v0, $a0, $v0
    lw          $v0, 0x4($v0)
    beqz        $v0, .L80004D18
    nop
    lw          $v1, 0x14($a1)
    addu        $v1, $a0, $v1
    lw          $v0, 0x4($v1)
    addiu       $v0, $v0, -0x1
    sw          $v0, 0x4($v1)
.L80004D18:
    bnez        $a3, .L80004CC0
    addiu       $a2, $a2, -0x1
    addu        $v0, $t0, $zero
    bnez        $v0, .L80004CB0
    addiu       $t0, $t0, -0x1
.L80004D2C:
    jr          $ra
    nop
.end func_80004C98
