.text
.align 2
.set noreorder
.globl func_8005CAD0
.ent func_8005CAD0
func_8005CAD0:
    sw          $s0, 0x18($sp)
    lw          $s0, 0x1AC($a0)
    addiu       $v0, $zero, 0x2
    beq         $a1, $v0, .L8005CB98
    sltiu       $v0, $a1, 0x3
    beql        $v0, $zero, .L8005CAFC
    addiu       $v0, $zero, 0x3
    beqz        $a1, .L8005CB0C
    nop
    j .L8005CBCC
    nop
.L8005CAFC:
    beq         $a1, $v0, .L8005CB64
    nop
    j .L8005CBCC
    nop
.L8005CB0C:
    lw          $v0, 0x54($a0)
    beqz        $v0, .L8005CB54
    nop
    lw          $v1, 0xC($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x33FC
    bnez        $v1, .L8005CBE8
    sw          $v0, 0x4($s0)
    lw          $v0, 0x4($a0)
    addiu       $v1, $zero, 0x1
    sw          $v1, 0x10($sp)
    lw          $a1, 0x8($s0)
    lw          $a3, 0x10($s0)
    lw          $v0, 0x1C($v0)
    jalr        $v0
    addu        $a2, $zero, $zero
    j .L8005CBE8
    sw          $v0, 0xC($s0)
.L8005CB54:
    lw          $v0, 0x1C0($a0)
    lw          $v0, 0x4($v0)
    j .L8005CBE8
    sw          $v0, 0x4($s0)
.L8005CB64:
    lw          $v0, 0x8($s0)
    bnez        $v0, .L8005CB88
    addiu       $v0, $zero, 0x4
    lw          $v1, 0x0($a0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($a0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L8005CB88:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x3334
    j .L8005CBE8
    sw          $v0, 0x4($s0)
.L8005CB98:
    lw          $v0, 0x8($s0)
    bnez        $v0, .L8005CBBC
    addiu       $v0, $zero, 0x4
    lw          $v1, 0x0($a0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($a0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L8005CBBC:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x3200
    j .L8005CBE8
    sw          $v0, 0x4($s0)
.L8005CBCC:
    lw          $v1, 0x0($a0)
    addiu       $v0, $zero, 0x4
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($a0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L8005CBE8:
    sw          $zero, 0x18($s0)
    sw          $zero, 0x14($s0)
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8005CAD0
