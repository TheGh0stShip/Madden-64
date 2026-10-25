.text
.align 2
.set noreorder
.globl resource_stream_update
.ent resource_stream_update
resource_stream_update:
    addiu       $sp, $sp, -0x20
    addu        $v1, $a0, $zero
    addu        $a0, $v1, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sll         $v0, $v1, 16
    sw          $ra, 0x1C($sp)
    sw          $s1, 0x14($sp)
    bgez        $v0, .L80016834
    sw          $s0, 0x10($sp)
    addiu       $v0, $zero, 0x2D
    sb          $v0, 0x0($s2)
    addiu       $s2, $s2, 0x1
    negu        $a0, $v1
.L80016834:
    sll         $v1, $a0, 16
    sra         $s1, $v1, 16
    slti        $v0, $s1, 0x2710
    bnez        $v0, .L8001689C
    slti        $v0, $s1, 0x3E8
    lui         $v0, 0x68DB
    ori         $v0, $v0, 0x8BAD
    .word       0x02220018  # mult        $s1, $v0
    sra         $v0, $v1, 31
    .word       0x00003010  # mfhi        $a2
    sra         $s0, $a2, 12
    subu        $s0, $s0, $v0
    sll         $a0, $s0, 16
    jal         func_80016C18
    sra         $a0, $a0, 16
    sb          $v0, 0x0($s2)
    addiu       $s2, $s2, 0x1
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 4
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 4
    j .L800168A4
    subu        $a0, $s1, $v0
.L8001689C:
    bnez        $v0, .L800168F8
    slti        $v0, $s1, 0x64
.L800168A4:
    lui         $v1, 0x1062
    ori         $v1, $v1, 0x4DD3
    sll         $v0, $a0, 16
    sra         $s1, $v0, 16
    .word       0x02230018  # mult        $s1, $v1
    sra         $v0, $v0, 31
    .word       0x00003010  # mfhi        $a2
    sra         $s0, $a2, 6
    subu        $s0, $s0, $v0
    sll         $a0, $s0, 16
    jal         func_80016C18
    sra         $a0, $a0, 16
    sb          $v0, 0x0($s2)
    addiu       $s2, $s2, 0x1
    sll         $v0, $s0, 5
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    j .L80016900
    subu        $a0, $s1, $v0
.L800168F8:
    bnez        $v0, .L80016954
    slti        $v0, $s1, 0xA
.L80016900:
    lui         $v1, 0x51EB
    ori         $v1, $v1, 0x851F
    sll         $v0, $a0, 16
    sra         $s1, $v0, 16
    .word       0x02230018  # mult        $s1, $v1
    sra         $v0, $v0, 31
    .word       0x00003010  # mfhi        $a2
    sra         $s0, $a2, 5
    subu        $s0, $s0, $v0
    sll         $a0, $s0, 16
    jal         func_80016C18
    sra         $a0, $a0, 16
    sb          $v0, 0x0($s2)
    addiu       $s2, $s2, 0x1
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    j .L8001695C
    subu        $a0, $s1, $v0
.L80016954:
    bnel        $v0, $zero, .L800169A8
    sll         $a0, $a0, 16
.L8001695C:
    lui         $v1, 0x6666
    ori         $v1, $v1, 0x6667
    sll         $v0, $a0, 16
    sra         $s1, $v0, 16
    .word       0x02230018  # mult        $s1, $v1
    sra         $v0, $v0, 31
    .word       0x00003010  # mfhi        $a2
    sra         $s0, $a2, 2
    subu        $s0, $s0, $v0
    sll         $a0, $s0, 16
    jal         func_80016C18
    sra         $a0, $a0, 16
    sb          $v0, 0x0($s2)
    addiu       $s2, $s2, 0x1
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 1
    subu        $a0, $s1, $v0
    sll         $a0, $a0, 16
.L800169A8:
    jal         func_80016C18
    sra         $a0, $a0, 16
    sb          $v0, 0x0($s2)
    sb          $zero, 0x1($s2)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end resource_stream_update
