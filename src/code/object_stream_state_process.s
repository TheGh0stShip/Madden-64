.text
.align 2
.set noreorder
.globl object_stream_state_process
.ent object_stream_state_process
object_stream_state_process:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $s2, 0x1C8($s0)
    lw          $v0, 0x58($s0)
    lw          $s3, 0x18($s2)
    beqz        $v0, .L8006265C
    addiu       $v0, $zero, 0x2
    sw          $v0, 0x58($s0)
.L8006265C:
    beqz        $a1, .L80062688
    addiu       $v0, $zero, 0x2
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x1028
    sw          $v0, 0x4($s2)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x25E0
    sw          $v0, 0x8($s2)
    addiu       $v0, $zero, 0x1
    j .L8006278C
    sw          $v0, 0x1C($s2)
.L80062688:
    lw          $v1, 0x58($s0)
    bne         $v1, $v0, .L800626A4
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x2170
    j .L800626B0
    sw          $v0, 0x4($s2)
.L800626A4:
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x2054
    sw          $v0, 0x4($s2)
.L800626B0:
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x2620
    sw          $v0, 0x8($s2)
    lw          $s1, 0x84($s0)
    bgtz        $s1, .L800626F4
    slti        $v0, $s1, 0x101
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x37
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    slti        $v0, $s1, 0x101
.L800626F4:
    bnez        $v0, .L80062720
    addiu       $v0, $zero, 0x38
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x100
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80062720:
    lw          $v1, 0x58($s0)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L8006278C
    nop
    lw          $v0, 0x70($s0)
    lw          $a0, 0x20($s2)
    addiu       $v0, $v0, 0x2
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    bnez        $a0, .L8006276C
    sll         $s1, $v1, 1
    lw          $v0, 0x4($s0)
    addu        $a0, $s0, $zero
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a2, $s1, $zero
    sw          $v0, 0x20($s2)
    lw          $a0, 0x20($s2)
.L8006276C:
    jal         func_800632F4
    addu        $a1, $s1, $zero
    lw          $v0, 0x28($s2)
    bnel        $v0, $zero, .L8006278C
    sw          $zero, 0x24($s2)
    jal         func_800624F8
    addu        $a0, $s0, $zero
    sw          $zero, 0x24($s2)
.L8006278C:
    lw          $v0, 0x1C($s2)
    beqz        $v0, .L800627C0
    addu        $s1, $zero, $zero
    addu        $s0, $s3, $zero
.L8006279C:
    lw          $a0, 0x0($s0)
    addiu       $a1, $zero, 0x1000
    addiu       $s0, $s0, 0x4
    jal         func_800632F4
    addiu       $s1, $s1, 0x1
    slti        $v0, $s1, 0x20
    bnez        $v0, .L8006279C
    nop
    sw          $zero, 0x1C($s2)
.L800627C0:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end object_stream_state_process
