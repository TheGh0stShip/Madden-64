.text
.align 2
.set noreorder
.globl resource_node_process
.ent resource_node_process
resource_node_process:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $s3, 0x24($sp)
    addu        $s3, $a1, $zero
    sw          $s0, 0x18($sp)
    addu        $s0, $a2, $zero
    addiu       $a0, $zero, 0x1C
    sw          $ra, 0x28($sp)
    jal         func_80019844
    sw          $s1, 0x1C($sp)
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x1C
    jal         func_8002E58C
    sw          $a0, 0xC($s0)
    jal         func_80019844
    addiu       $a0, $zero, 0xC
    lw          $v1, 0xC($s0)
    sw          $v0, 0x0($v1)
    lw          $v0, 0xC($s0)
    lw          $a0, 0x0($v0)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0xC
    lw          $v0, 0xC($s0)
    sb          $zero, 0x0($s0)
    lw          $s1, 0x0($v0)
    addiu       $a1, $zero, 0x4
    addiu       $a2, $zero, 0x1
    addu        $a0, $s1, $zero
    sw          $s2, 0x0($s1)
    sw          $s3, 0x4($s1)
    jal         func_80019944
    sh          $zero, 0x12($s0)
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    addiu       $a2, $zero, 0x2
    jal         func_80019868
    addu        $a3, $zero, $zero
    addu        $a0, $s1, $zero
    addiu       $a1, $s0, 0x10
    addiu       $a2, $zero, 0x2
    jal         func_80019868
    addu        $a3, $zero, $zero
    addu        $a0, $s1, $zero
    lw          $a1, 0xC($s0)
    addiu       $a2, $zero, 0x2
    addu        $a3, $zero, $zero
    jal         func_80019868
    addiu       $a1, $a1, 0xC
    addu        $a0, $s1, $zero
    lw          $a1, 0xC($s0)
    addiu       $a2, $zero, 0x2
    addu        $a3, $zero, $zero
    jal         func_80019868
    addiu       $a1, $a1, 0xE
    addu        $a0, $s1, $zero
    addiu       $a1, $zero, 0x50
    jal         func_80019944
    addiu       $a2, $zero, 0x1
    addu        $a0, $s1, $zero
    lw          $a1, 0xC($s0)
    addiu       $a2, $zero, 0x4
    addiu       $a3, $zero, 0x1
    jal         func_80019868
    addiu       $a1, $a1, 0x10
    addu        $a0, $s1, $zero
    lw          $a1, 0xC($s0)
    addiu       $a2, $zero, 0x4
    addiu       $a3, $zero, 0x1
    jal         func_80019868
    addiu       $a1, $a1, 0x14
    lw          $v0, 0xC($s0)
    lhu         $v1, 0xC($v0)
    lhu         $a0, 0xE($v0)
    .word       0x00640018  # mult        $v1, $a0
    .word       0x00002012  # mflo        $a0
    jal         func_80019844
    nop
    addiu       $a0, $zero, 0x300
    jal         func_80019844
    sw          $v0, 0x4($s0)
    lw          $v1, 0xC($s0)
    sw          $v0, 0x8($s0)
    lw          $v0, 0x10($v1)
    addu        $a0, $s0, $zero
    jal         func_8001A224
    sw          $v0, 0x8($v1)
    lw          $ra, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end resource_node_process
