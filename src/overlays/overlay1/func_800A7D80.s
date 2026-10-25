.text
.align 2
.set noreorder
.globl func_800A7D80
.ent func_800A7D80
func_800A7D80:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $s3, 0x1C($sp)
    lui         $s3, 0x8007
    addiu       $s3, $s3, -0x5900
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x58DC
    sw          $ra, 0x20($sp)
.L800A7DB0:
    lw          $v0, 0x0($s0)
    beqz        $v0, .L800A7E00
    addiu       $s1, $s1, 0x1
    sh          $s2, 0xA($v0)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x10($v1)
    sw          $v0, 0xC($v1)
    lw          $v1, 0x0($s0)
    lhu         $v0, 0x4($v1)
    sh          $v0, 0x2($v1)
    lw          $v1, 0x0($s0)
    lhu         $v0, 0x8($v1)
    sh          $v0, 0x6($v1)
    lw          $a0, 0x0($s0)
    lh          $v0, 0x2($a0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L800A7E00:
    beqz        $s1, .L800A7DB0
    addiu       $s0, $s0, 0x4
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A7D80
