.text
.align 2
.set noreorder
.globl resource_buffers_update
.ent resource_buffers_update
resource_buffers_update:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    lw          $s1, 0x8($s2)
    lhu         $v0, 0x0($s0)
    sh          $v0, 0x8($s1)
    lw          $v0, 0x4($s0)
    sw          $v0, 0x0($s1)
    lw          $v0, 0x8($s0)
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    sw          $v0, 0x4($s1)
    lhu         $v0, 0x0($s0)
    lui         $v1, 0x8007
    lw          $v1, -0x6D6C($v1)
    lui         $t0, 0x8007
    lw          $t0, -0x6D6C($t0)
    andi        $v0, $v0, 0xFFFC
    addu        $v0, $v0, $v1
    lui         $v1, 0x8007
    lw          $v1, -0x6D54($v1)
    lw          $a3, 0x0($v0)
    addu        $a2, $zero, $zero
    addiu       $v0, $v1, 0x1
    addu        $a3, $a3, $t0
    sw          $v1, 0x14($s1)
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    sw          $v0, -0x6D54($at)
    addiu       $v0, $zero, 0x1
    sw          $a3, 0x10($s1)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $s2, -0x6B84($at)
    sw          $v0, 0x14($s2)
    jal         func_8000D5BC
    sh          $zero, 0xA($s1)
    sw          $v0, 0x18($s1)
    lhu         $v0, 0x10($s0)
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    addiu       $v0, $v0, 0x2
    jal         func_8001B098
    sh          $v0, 0x1C($s1)
    lui         $v0, 0x8007
    lw          $v0, -0x6D68($v0)
    beqz        $v0, .L8001B268
    addu        $a0, $zero, $zero
    lw          $s3, 0x0($v0)
    addiu       $s0, $s3, 0x1
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0x24($s1)
    sll         $s0, $s0, 2
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0x28($s1)
    lw          $v0, 0x28($s1)
    j .L8001B270
    sw          $s3, 0x0($v0)
.L8001B268:
    sw          $zero, 0x24($s1)
    sw          $zero, 0x28($s1)
.L8001B270:
    lw          $v0, 0x0($s1)
    beqz        $v0, .L8001B2D8
    addu        $a0, $zero, $zero
    lw          $s3, 0x0($v0)
    addiu       $s0, $s3, 0x1
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0x20($s1)
    sll         $s0, $s0, 2
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0x2C($s1)
    lw          $v0, 0x2C($s1)
    j .L8001B2E0
    sw          $s3, 0x0($v0)
.L8001B2D8:
    sw          $zero, 0x20($s1)
    sw          $zero, 0x2C($s1)
.L8001B2E0:
    sw          $zero, 0x24($s2)
    sw          $zero, 0x20($s2)
    sw          $zero, 0x1C($s2)
    sh          $zero, 0xE($s1)
    sh          $zero, 0xC($s1)
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end resource_buffers_update
