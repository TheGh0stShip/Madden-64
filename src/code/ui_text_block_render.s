.text
.align 2
.set noreorder
.globl ui_text_block_render
.ent ui_text_block_render
ui_text_block_render:
    lui         $v1, 0x8008
    lw          $v1, -0x6B88($v1)
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lbu         $s2, 0x0($v1)
    andi        $v0, $s2, 0x60
    srl         $s4, $v0, 5
    andi        $v0, $s2, 0x3
    andi        $s0, $v0, 0xFF
    andi        $v0, $s2, 0x10
    beqz        $v0, .L8001CAF8
    addu        $s1, $a0, $zero
    addiu       $v0, $v1, 0x1
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    lbu         $s5, 0x1($v1)
    addiu       $v0, $v1, 0x2
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    j .L8001CB08
    nop
.L8001CAF8:
    addiu       $v0, $v1, 0x1
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    addu        $s5, $zero, $zero
.L8001CB08:
    jal         func_8001C670
    nop
    lui         $at, 0x8008
    sh          $v0, -0x6AEC($at)
    jal         func_8001CA44
    nop
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6D42
    andi        $v1, $s2, 0xC
    lui         $at, 0x8008
    sh          $v0, -0x6AE8($at)
    addiu       $v0, $zero, 0x4
    sh          $zero, 0x0($a2)
    lui         $at, 0x8007
    sh          $zero, -0x6D40($at)
    beq         $v1, $v0, .L8001CCA8
    slti        $v0, $v1, 0x5
    beql        $v0, $zero, .L8001CB64
    addiu       $v0, $zero, 0x8
    beqz        $v1, .L8001CB74
    sll         $v0, $s0, 1
    j .L8001D060
    nop
.L8001CB64:
    beq         $v1, $v0, .L8001CDE8
    nop
    j .L8001D060
    nop
.L8001CB74:
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $v0, -0x6D60($at)
    lui         $v1, 0x8008
    lw          $v1, -0x6B88($v1)
    lui         $at, 0x8007
    sh          $v0, -0x6D28($at)
    addiu       $v0, $v1, 0x1
    lui         $at, 0x8007
    sw          $v0, -0x6D2C($at)
    lhu         $v0, 0x1C($s1)
    addiu       $v0, $v0, -0x2
    lui         $at, 0x8007
    sh          $v0, -0x6D44($at)
    lbu         $v0, 0x0($v1)
    lhu         $a0, 0xA($s1)
    addiu       $v0, $v0, 0x1
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, -0x6B88($at)
    bnez        $a0, .L8001D060
    addu        $a1, $zero, $zero
    lbu         $s2, 0x0($v1)
    sb          $zero, 0x0($v1)
    lw          $a0, 0x18($s1)
    jal         func_8000D740
    addiu       $a2, $a2, -0x6
    addu        $s0, $v0, $zero
    lw          $a1, 0x8($s0)
    andi        $v1, $s4, 0xFFFF
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8001CC08
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8001CC3C
    nop
    j .L8001CC54
    nop
.L8001CC08:
    lhu         $v0, 0x1A($a1)
    lui         $a0, 0x8008
    lhu         $a0, -0x6AEC($a0)
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    subu        $a0, $a0, $v1
    lui         $at, 0x8008
    sh          $a0, -0x6AEC($at)
    j .L8001CC54
    nop
.L8001CC3C:
    lui         $v0, 0x8008
    lhu         $v0, -0x6AEC($v0)
    lhu         $v1, 0x1A($a1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, -0x6AEC($at)
.L8001CC54:
    lui         $v0, 0x8008
    lhu         $v0, -0x6AE8($v0)
    lhu         $v1, 0x1C($a1)
    addu        $a0, $s0, $zero
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, -0x6AE8($at)
    jal         func_80017CA4
    addu        $a1, $s5, $zero
    lui         $a1, 0x8008
    lh          $a1, -0x6AEC($a1)
    lui         $a2, 0x8008
    lh          $a2, -0x6AE8($a2)
    jal         func_80017000
    addu        $a0, $s0, $zero
    jal         func_80016FE4
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    j .L8001D060
    sb          $s2, 0x0($v0)
.L8001CCA8:
    lui         $a3, 0x8007
    addiu       $a3, $a3, -0x6D68
    lw          $v0, 0x0($a3)
    beqz        $v0, .L8001D04C
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    lbu         $v0, 0x0($v0)
    lui         $v1, 0x8007
    lw          $v1, -0x6D68($v1)
    addiu       $v0, $v0, 0x1
    andi        $s2, $v0, 0xFF
    sll         $s3, $s2, 2
    addu        $a1, $s3, $v1
    lw          $v0, 0x0($a1)
    beqz        $v0, .L8001D04C
    nop
    lw          $v0, 0x24($s1)
    addu        $a0, $v0, $s2
    lbu         $v1, 0x0($a0)
    andi        $v0, $v1, 0x80
    bnez        $v0, .L8001CD9C
    andi        $v0, $v1, 0x40
    andi        $v0, $v1, 0x20
    beqz        $v0, .L8001CD14
    andi        $v0, $v1, 0xF
    andi        $s5, $v0, 0xFF
.L8001CD14:
    sll         $v0, $s0, 1
    addu        $v0, $a3, $v0
    lhu         $v0, 0x8($v0)
    lui         $at, 0x8007
    sh          $v0, -0x6D28($at)
    lw          $v0, 0x0($a1)
    lui         $at, 0x8007
    sw          $v0, -0x6D2C($at)
    lhu         $v0, 0x1C($s1)
    addiu       $v0, $v0, -0x2
    lui         $at, 0x8007
    sh          $v0, -0x6D44($at)
    lw          $a0, 0x18($s1)
    addiu       $a2, $a2, -0x6
    jal         func_8000D740
    addu        $a1, $zero, $zero
    lw          $v1, 0x28($s1)
    addu        $s0, $v0, $zero
    addu        $v1, $s3, $v1
    sw          $s0, 0x0($v1)
    lw          $v1, 0x24($s1)
    addu        $v1, $v1, $s2
    lbu         $v0, 0x0($v1)
    ori         $v0, $v0, 0x80
    sb          $v0, 0x0($v1)
    lw          $a1, 0x8($s0)
    andi        $v1, $s4, 0xFFFF
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8001CEE0
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8001CF14
    nop
    j .L8001CF2C
    nop
.L8001CD9C:
    beqz        $v0, .L8001D04C
    andi        $v0, $v1, 0x20
    beqz        $v0, .L8001CDB0
    andi        $v0, $v1, 0xF
    andi        $s5, $v0, 0xFF
.L8001CDB0:
    andi        $v0, $v1, 0xBF
    sb          $v0, 0x0($a0)
    lw          $v0, 0x28($s1)
    addu        $v0, $s3, $v0
    lw          $s0, 0x0($v0)
    andi        $v1, $s4, 0xFFFF
    addiu       $v0, $zero, 0x1
    lw          $a1, 0x8($s0)
    beq         $v1, $v0, .L8001CFC4
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8001CFF8
    nop
    j .L8001D010
    nop
.L8001CDE8:
    lw          $v1, 0x0($s1)
    beqz        $v1, .L8001D04C
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x6B88($a1)
    lbu         $v0, 0x0($a1)
    addiu       $v0, $v0, 0x1
    andi        $s2, $v0, 0xFF
    sll         $s3, $s2, 2
    addu        $v0, $s3, $v1
    lw          $v0, 0x0($v0)
    beqz        $v0, .L8001D04C
    nop
    lw          $v0, 0x20($s1)
    addu        $a0, $v0, $s2
    lbu         $v1, 0x0($a0)
    andi        $v0, $v1, 0x80
    bnez        $v0, .L8001CF78
    andi        $v0, $v1, 0x40
    andi        $v0, $v1, 0x20
    beqz        $v0, .L8001CE44
    andi        $v0, $v1, 0xF
    andi        $s5, $v0, 0xFF
.L8001CE44:
    sll         $v0, $s0, 1
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $v0, -0x6D60($at)
    lui         $at, 0x8007
    sh          $v0, -0x6D28($at)
    lbu         $v0, 0x0($a1)
    lw          $v1, 0x0($s1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $v0, 0x4($v0)
    lui         $at, 0x8007
    sw          $v0, -0x6D2C($at)
    lhu         $v0, 0x1C($s1)
    addiu       $v0, $v0, -0x2
    lui         $at, 0x8007
    sh          $v0, -0x6D44($at)
    lw          $a0, 0x18($s1)
    addiu       $a2, $a2, -0x6
    jal         func_8000D740
    addu        $a1, $zero, $zero
    lw          $v1, 0x2C($s1)
    addu        $s0, $v0, $zero
    addu        $v1, $s3, $v1
    sw          $s0, 0x0($v1)
    lw          $v1, 0x20($s1)
    addu        $v1, $v1, $s2
    lbu         $v0, 0x0($v1)
    ori         $v0, $v0, 0x80
    sb          $v0, 0x0($v1)
    lw          $a1, 0x8($s0)
    andi        $v1, $s4, 0xFFFF
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8001CEE0
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8001CF14
    nop
    j .L8001CF2C
    nop
.L8001CEE0:
    lhu         $v0, 0x1A($a1)
    lui         $a0, 0x8008
    lhu         $a0, -0x6AEC($a0)
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    subu        $a0, $a0, $v1
    lui         $at, 0x8008
    sh          $a0, -0x6AEC($at)
    j .L8001CF2C
    nop
.L8001CF14:
    lui         $v0, 0x8008
    lhu         $v0, -0x6AEC($v0)
    lhu         $v1, 0x1A($a1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, -0x6AEC($at)
.L8001CF2C:
    lui         $v0, 0x8008
    lhu         $v0, -0x6AE8($v0)
    lhu         $v1, 0x1C($a1)
    addu        $a0, $s0, $zero
    lui         $a1, 0x8008
    lh          $a1, -0x6AEC($a1)
    subu        $v0, $v0, $v1
    sll         $a2, $v0, 16
    lui         $at, 0x8008
    sh          $v0, -0x6AE8($at)
    jal         func_80017000
    sra         $a2, $a2, 16
    addu        $a0, $s0, $zero
    jal         func_80017CA4
    addu        $a1, $s5, $zero
    jal         func_80016FE4
    addu        $a0, $s0, $zero
    j .L8001D04C
    nop
.L8001CF78:
    beqz        $v0, .L8001D04C
    andi        $v0, $v1, 0x20
    beqz        $v0, .L8001CF8C
    andi        $v0, $v1, 0xF
    andi        $s5, $v0, 0xFF
.L8001CF8C:
    andi        $v0, $v1, 0xBF
    sb          $v0, 0x0($a0)
    lw          $v0, 0x2C($s1)
    addu        $v0, $s3, $v0
    lw          $s0, 0x0($v0)
    andi        $v1, $s4, 0xFFFF
    addiu       $v0, $zero, 0x1
    lw          $a1, 0x8($s0)
    beq         $v1, $v0, .L8001CFC4
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8001CFF8
    nop
    j .L8001D010
    nop
.L8001CFC4:
    lhu         $v0, 0x1A($a1)
    lui         $a0, 0x8008
    lhu         $a0, -0x6AEC($a0)
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    subu        $a0, $a0, $v1
    lui         $at, 0x8008
    sh          $a0, -0x6AEC($at)
    j .L8001D010
    nop
.L8001CFF8:
    lui         $v0, 0x8008
    lhu         $v0, -0x6AEC($v0)
    lhu         $v1, 0x1A($a1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, -0x6AEC($at)
.L8001D010:
    lui         $v0, 0x8008
    lhu         $v0, -0x6AE8($v0)
    lhu         $v1, 0x1C($a1)
    addu        $a0, $s0, $zero
    lui         $a1, 0x8008
    lh          $a1, -0x6AEC($a1)
    subu        $v0, $v0, $v1
    sll         $a2, $v0, 16
    lui         $at, 0x8008
    sh          $v0, -0x6AE8($at)
    jal         func_80017000
    sra         $a2, $a2, 16
    addu        $a0, $s0, $zero
    jal         func_80017CA4
    addu        $a1, $s5, $zero
.L8001D04C:
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
.L8001D060:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end ui_text_block_render
