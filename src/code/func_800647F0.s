.text
.align 2
.set noreorder
.globl func_800647F0
.ent func_800647F0
func_800647F0:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s0, 0x10($sp)
    jal         func_800649EC
    sw          $zero, 0x4($s1)
    addu        $a0, $s1, $zero
    addu        $s2, $v0, $zero
    jal         func_80064930
    addiu       $a1, $zero, 0x50
    addu        $s0, $v0, $zero
    bnez        $s0, .L8006485C
    addiu       $a0, $zero, 0x1
    jal         func_800649F4
    addu        $a0, $s1, $zero
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x35
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sw          $zero, 0x18($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    addiu       $a0, $zero, 0x1
.L8006485C:
    addiu       $v1, $s0, 0x4
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x35DC
    sw          $v0, 0x0($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x37A4
    sw          $v0, 0x4($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x389C
    sw          $v0, 0x8($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x39CC
    sw          $v0, 0xC($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x3B0C
    sw          $v0, 0x10($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x3BD8
    sw          $v0, 0x14($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x3CA4
    sw          $v0, 0x18($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x41C4
    sw          $v0, 0x1C($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x43E8
    sw          $v0, 0x20($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x460C
    sw          $v0, 0x24($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x4790
    sw          $v0, 0x28($s0)
    sw          $s2, 0x2C($s0)
.L800648E8:
    sw          $zero, 0x30($v1)
    sw          $zero, 0x38($v1)
    addiu       $a0, $a0, -0x1
    bgez        $a0, .L800648E8
    addiu       $v1, $v1, -0x4
    addiu       $v0, $zero, 0x50
    sw          $zero, 0x40($s0)
    sw          $zero, 0x44($s0)
    sw          $v0, 0x48($s0)
    sw          $s0, 0x4($s1)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800647F0
