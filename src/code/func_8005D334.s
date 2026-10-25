.text
.align 2
.set noreorder
.globl func_8005D334
.ent func_8005D334
func_8005D334:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    lw          $v0, 0x4($s0)
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x54
    addu        $v1, $v0, $zero
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x2FE8
    sw          $v1, 0x1BC($s0)
    sw          $v0, 0x0($v1)
    lw          $v0, 0x20($s0)
    lw          $s3, 0xD8($s0)
    blez        $v0, .L8005D3DC
    addu        $s1, $zero, $zero
    addiu       $s4, $zero, -0x1
    addu        $s2, $v1, $zero
.L8005D394:
    lw          $v0, 0x4($s0)
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x0($v0)
    addiu       $a2, $zero, 0x100
    jalr        $v0
    addiu       $s1, $s1, 0x1
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x100
    jal         func_8002E58C
    sw          $a0, 0x50($s3)
    sw          $s4, 0x2C($s2)
    lw          $v0, 0x20($s0)
    addiu       $s2, $s2, 0x4
    slt         $v0, $s1, $v0
    bnez        $v0, .L8005D394
    addiu       $s3, $s3, 0x54
.L8005D3DC:
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8005D334
