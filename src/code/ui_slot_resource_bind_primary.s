.text
.align 2
.set noreorder
.globl ui_slot_resource_bind_primary
.ent ui_slot_resource_bind_primary
ui_slot_resource_bind_primary:
    lui         $v0, 0x8007
    lw          $v0, -0x6D68($v0)
    addiu       $sp, $sp, -0x28
    sw          $s4, 0x20($sp)
    addu        $s4, $a2, $zero
    sw          $s3, 0x1C($sp)
    sll         $s3, $s4, 2
    sw          $ra, 0x24($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    addu        $v0, $s3, $v0
    lw          $v0, 0x0($v0)
    lw          $s1, 0x8($a0)
    beqz        $v0, .L8001ED7C
    addu        $s2, $a1, $zero
    lw          $v0, 0x28($s1)
    addu        $v0, $s3, $v0
    lw          $s0, 0x0($v0)
    lw          $a0, 0x18($s1)
    jal         func_8000D874
    addu        $a1, $s0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    jal         func_8000D834
    addu        $a1, $s0, $zero
.L8001ED7C:
    lw          $v0, 0x28($s1)
    sll         $a0, $s2, 2
    addu        $v0, $a0, $v0
    lw          $a1, 0x0($v0)
    beqz        $a1, .L8001EDD0
    nop
    sw          $zero, 0x0($v0)
    lw          $v1, 0x24($s1)
    addu        $v0, $v1, $s2
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $s4
    ori         $v0, $v0, 0x40
    sb          $v0, 0x0($v1)
    lw          $v1, 0x24($s1)
    addu        $v1, $v1, $s2
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0x7F
    sb          $v0, 0x0($v1)
    lw          $v0, 0x28($s1)
    addu        $v0, $s3, $v0
    sw          $a1, 0x0($v0)
.L8001EDD0:
    lui         $v0, 0x8007
    lw          $v0, -0x6D68($v0)
    addu        $v1, $a0, $v0
    lw          $v1, 0x0($v1)
    addu        $v0, $s3, $v0
    sw          $v1, 0x0($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x6D68($v0)
    addu        $v0, $a0, $v0
    sw          $zero, 0x0($v0)
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end ui_slot_resource_bind_primary
