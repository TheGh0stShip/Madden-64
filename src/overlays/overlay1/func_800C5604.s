.text
.align 2
.set noreorder
.globl func_800C5604
.ent func_800C5604
func_800C5604:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x1C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x20($sp)
    sw          $s0, 0x18($sp)
    lh          $v1, 0x4E($s1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800C5884
    addu        $v0, $zero, $zero
    lw          $a0, 0x24($s1)
    sh          $zero, 0x4E($s1)
    lw          $v0, 0x2C($a0)
    lw          $v1, 0x30($a0)
    or          $v0, $v0, $v1
    beqz        $v0, .L800C5658
    nop
    jal         func_800B9208
    addiu       $a0, $a0, 0x2C
    sll         $v0, $v0, 16
    j           func_800C0F4C
    sra         $a0, $v0, 16
.L800C5658:
    jal         func_800C157C
    addu        $a0, $s1, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v0, $v0, 0x7FF
    andi        $a0, $v0, 0xFFF
    sll         $a0, $a0, 16
    lw          $a1, 0x24($s1)
    sra         $a0, $a0, 16
    addiu       $a2, $zero, 0x1800
    jal         func_800B9274
    addiu       $a1, $a1, 0x2C
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1A
    jal         func_800E1BCC
    sb          $v0, 0x10($sp)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L800C56B8
    nop
    jal         func_8003EE10
    addu        $a0, $s1, $zero
.L800C56B8:
    lhu         $v0, 0x28($s1)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800C5884
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x38($s1)
    lbu         $v0, 0x1F($v1)
    beqz        $v0, .L800C5884
    addiu       $v0, $zero, 0x1
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beq         $v1, $v0, .L800C5884
    addiu       $v0, $zero, 0x1
    lui         $a1, 0x8008
    lw          $a1, 0xC10($a1)
    andi        $v0, $a1, 0x9
    bnez        $v0, .L800C5884
    addiu       $v0, $zero, 0x1
    lbu         $a0, 0x64($v1)
    xori        $v1, $a0, 0x10
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0x1B
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    bnez        $v1, .L800C572C
    andi        $v0, $a1, 0x100
    addiu       $v0, $zero, 0x11
    bne         $a0, $v0, .L800C5884
    addiu       $v0, $zero, 0x1
    andi        $v0, $a1, 0x100
.L800C572C:
    beqz        $v0, .L800C5800
    nop
    jal         func_800C157C
    addu        $a0, $s1, $zero
    lw          $a0, 0x38($s1)
    jal         func_800C157C
    addu        $s0, $v0, $zero
    sll         $s0, $s0, 16
    sra         $s0, $s0, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $s0, $s0, $v0
    andi        $a0, $s0, 0xFFF
    slti        $v0, $a0, 0x801
    bnez        $v0, .L800C5778
    slti        $v0, $a0, 0x4E3
    addiu       $v0, $zero, 0xFFF
    subu        $a0, $v0, $a0
    slti        $v0, $a0, 0x4E3
.L800C5778:
    beqz        $v0, .L800C5800
    nop
    lw          $v0, 0x38($s1)
    lbu         $v0, 0x13($v0)
    addiu       $a0, $zero, 0x40
    srl         $v0, $v0, 2
    subu        $a0, $a0, $v0
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    addiu       $a0, $zero, 0x8
    jal         func_8001FA38
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0xE
    subu        $v1, $v1, $v0
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 2
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFC
    andi        $s0, $s0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sltu        $v0, $v0, $s0
    beqz        $v0, .L800C5800
    nop
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a1, 0x38($s1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
    jal         func_8001FA68
    addiu       $a0, $zero, 0x8
.L800C5800:
    lw          $v0, 0x38($s1)
    lbu         $v0, 0x13($v0)
    addiu       $a0, $zero, 0x40
    srl         $v0, $v0, 2
    subu        $a0, $a0, $v0
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    addiu       $a0, $zero, 0x6
    jal         func_8001FA38
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x10
    subu        $v1, $v1, $v0
    sll         $a0, $v1, 2
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 2
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFC
    andi        $s0, $s0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sltu        $v0, $v0, $s0
    beql        $v0, $zero, .L800C5884
    addiu       $v0, $zero, 0x1
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a1, 0x38($s1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
    jal         func_8001FA68
    addiu       $a0, $zero, 0x6
    addiu       $v0, $zero, 0x1
.L800C5884:
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C5604
