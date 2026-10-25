.text
.align 2
.set noreorder
.globl gameplay_selection_update
.ent gameplay_selection_update
gameplay_selection_update:
    addiu       $sp, $sp, -0x30
    sw          $s4, 0x20($sp)
    addu        $s4, $a0, $zero
    sw          $s5, 0x24($sp)
    addu        $s5, $a1, $zero
    sw          $s1, 0x14($sp)
    andi        $s1, $s4, 0xFFFF
    addu        $a0, $s1, $zero
    sw          $s0, 0x10($sp)
    andi        $s0, $s5, 0xFFFF
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0x6
    sw          $ra, 0x28($sp)
    sw          $s3, 0x1C($sp)
    jal         func_80023C60
    sw          $s2, 0x18($sp)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $s3, $v1, $v0
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0xB
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    addu        $s3, $s3, $v1
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0xF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s3, $s3, $v1
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0x14
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s3, $s3, $v1
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0x16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s3, $s3, $v1
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0x11
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s3, $s3, $v1
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0x10
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $s3, $s3, $v0
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0x5
    lui         $s2, 0x51EB
    ori         $s2, $s2, 0x851F
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    .word       0x00720018  # mult        $v1, $s2
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0xA
    sra         $v0, $v0, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v1, $a3, 4
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    jal         func_80023C60
    addu        $s3, $s3, $v1
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    .word       0x00720018  # mult        $v1, $s2
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0xE
    sra         $v0, $v0, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v1, $a3, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    jal         func_80023C60
    addu        $s3, $s3, $v1
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    .word       0x00720018  # mult        $v1, $s2
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0x5
    sra         $v0, $v0, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v1, $a3, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    jal         func_80023C60
    addu        $s3, $s3, $v1
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    slti        $v0, $v1, 0x1F5
    bnez        $v0, .L8002A558
    slti        $v0, $v1, 0x191
    j .L8002A580
    addiu       $s3, $s3, 0xA
.L8002A558:
    bnez        $v0, .L8002A568
    slti        $v0, $v1, 0x12D
    j .L8002A580
    addiu       $s3, $s3, 0x5
.L8002A568:
    bnez        $v0, .L8002A578
    slti        $v0, $v1, 0xC9
    j .L8002A580
    addiu       $s3, $s3, 0x2
.L8002A578:
    xori        $v0, $v0, 0x1
    addu        $s3, $s3, $v0
.L8002A580:
    andi        $a0, $s4, 0xFFFF
    andi        $a1, $s5, 0xFFFF
    jal         func_80023C60
    addiu       $a2, $zero, 0xE
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    slti        $v0, $v1, 0x12D
    bnez        $v0, .L8002A5AC
    slti        $v0, $v1, 0xC9
    j .L8002A5C4
    addiu       $s3, $s3, 0x5
.L8002A5AC:
    bnez        $v0, .L8002A5BC
    slti        $v0, $v1, 0x65
    j .L8002A5C4
    addiu       $s3, $s3, 0x3
.L8002A5BC:
    xori        $v0, $v0, 0x1
    addu        $s3, $s3, $v0
.L8002A5C4:
    andi        $a0, $s4, 0xFFFF
    andi        $a1, $s5, 0xFFFF
    jal         func_80023C60
    addiu       $a2, $zero, 0xA
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    slti        $v0, $v1, 0x12D
    bnez        $v0, .L8002A5F0
    slti        $v0, $v1, 0xC9
    j .L8002A608
    addiu       $s3, $s3, 0x5
.L8002A5F0:
    bnez        $v0, .L8002A600
    slti        $v0, $v1, 0x65
    j .L8002A608
    addiu       $s3, $s3, 0x3
.L8002A600:
    xori        $v0, $v0, 0x1
    addu        $s3, $s3, $v0
.L8002A608:
    sll         $v1, $s4, 5
    addu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    xori        $a0, $s4, 0x1
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v1, 0x2D94($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D94($at)
    sltu        $v0, $v0, $v1
    bnel        $v0, $zero, .L8002A678
    addiu       $s3, $s3, 0x5
.L8002A678:
    nor         $v0, $zero, $s3
    sra         $v0, $v0, 31
    and         $v0, $s3, $v0
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
.end gameplay_selection_update
