.text
.align 2
.set noreorder
.globl gameplay_selection_finalize
.ent gameplay_selection_finalize
gameplay_selection_finalize:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    andi        $s2, $a0, 0xFFFF
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0x6
    sw          $ra, 0x1C($sp)
    sw          $s1, 0x14($sp)
    jal         func_80023F94
    sw          $s0, 0x10($sp)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $s1, $v1, $v0
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0xB
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    addu        $s1, $s1, $v1
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0xF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s1, $s1, $v1
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0x14
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s1, $s1, $v1
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0x16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s1, $s1, $v1
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0x11
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s1, $s1, $v1
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0x10
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $s1, $s1, $v0
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0x18
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $s1, $s1, $v1
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0x1F
    sll         $v0, $v0, 16
    sra         $v0, $v0, 15
    addu        $s1, $s1, $v0
    addu        $a0, $s2, $zero
    jal         func_80023F94
    addiu       $a1, $zero, 0x5
    lui         $s0, 0x51EB
    ori         $s0, $s0, 0x851F
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    .word       0x00700018  # mult        $v1, $s0
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0xA
    sra         $v0, $v0, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v1, $a3, 4
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    jal         func_80023F94
    addu        $s1, $s1, $v1
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    .word       0x00700018  # mult        $v1, $s0
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0xE
    sra         $v0, $v0, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v1, $a3, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    jal         func_80023F94
    addu        $s1, $s1, $v1
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    .word       0x00700018  # mult        $v1, $s0
    addu        $a0, $s2, $zero
    sra         $v0, $v0, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v1, $a3, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    jal         func_80024B90
    addu        $s1, $s1, $v1
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0xFF
    beq         $v0, $v1, .L8002A8F4
    nor         $v0, $zero, $s1
    jal         func_80024B90
    addu        $a0, $s2, $zero
    jal         func_80028A58
    andi        $a0, $v0, 0xFF
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    lui         $at, 0x800C
    addu        $at, $at, $v1
    lb          $v0, 0x5896($at)
    addu        $a0, $s2, $zero
    sll         $v0, $v0, 2
    jal         func_80024B90
    addu        $s1, $s1, $v0
    jal         func_80028A58
    andi        $a0, $v0, 0xFF
    andi        $a0, $v0, 0xFFFF
    addiu       $a1, $zero, 0x11
    jal         func_8008F7A4
    addiu       $a2, $zero, 0x13
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    addu        $s1, $s1, $v1
    nor         $v0, $zero, $s1
.L8002A8F4:
    sra         $v0, $v0, 31
    and         $v0, $s1, $v0
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end gameplay_selection_finalize
