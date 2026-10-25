.text
.align 2
.set noreorder
.globl menu_player_finalize
.ent menu_player_finalize
menu_player_finalize:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $s1, 0x1C($sp)
    addu        $s1, $a1, $zero
    addu        $a1, $zero, $zero
    andi        $a2, $a2, 0xFF
    sll         $v0, $a2, 5
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a2
    sll         $v0, $v0, 2
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xD6A
    addu        $a0, $v0, $v1
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    beqz        $s0, .L8001F8CC
    sw          $ra, 0x24($sp)
.L8001F8A4:
    lbu         $v0, 0xE($s0)
    beqz        $v0, .L8001F8CC
    addiu       $a1, $a1, 0x1
    andi        $v1, $a1, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $s0, $a0, $v0
    bnez        $s0, .L8001F8A4
    nop
.L8001F8CC:
    andi        $a0, $s2, 0xFF
    lui         $a2, 0x8007
    addiu       $a2, $a2, 0x1728
    jal         func_8001F488
    addu        $a1, $s0, $zero
    lui         $v0, 0x8007
    lh          $v0, -0x6D4E($v0)
    beqz        $v0, .L8001F9EC
    andi        $v1, $s1, 0xFFFF
    lui         $a0, 0x8007
    lb          $a0, -0x6A10($a0)
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8001F914
    slt         $v0, $a0, $v1
    lui         $v0, 0x8007
    lhu         $v0, -0x6D50($v0)
    j .L8001F928
    addiu       $v0, $v0, -0x1
.L8001F914:
    beqz        $v0, .L8001F930
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x6D50($v0)
    addiu       $v0, $v0, 0x1
.L8001F928:
    lui         $at, 0x8007
    sh          $v0, -0x6D50($at)
.L8001F930:
    lui         $v0, 0x8007
    lh          $v0, -0x6D50($v0)
    lui         $at, 0x8007
    sb          $s1, -0x6A10($at)
    bgez        $v0, .L8001F958
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    sh          $zero, -0x6D50($at)
    j .L8001F984
    andi        $a0, $s2, 0xFF
.L8001F958:
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v1, -0x6CF8($at)
    addiu       $v0, $zero, -0x1
    bnel        $v1, $v0, .L8001F984
    andi        $a0, $s2, 0xFF
    addiu       $v0, $a0, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x6D50($at)
    andi        $a0, $s2, 0xFF
.L8001F984:
    sll         $v0, $a0, 5
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a0
    sll         $a1, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lw          $v1, -0x7B0C($at)
    beqz        $v1, .L8001F9E4
    nop
    lui         $v0, 0x8007
    lh          $v0, -0x6D50($v0)
    lw          $v1, 0x0($v1)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x6CF8($at)
    sw          $v0, 0x0($v1)
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lw          $v0, -0x7B0C($at)
    lw          $v1, 0x4($v0)
    addiu       $v0, $zero, 0x2000
    sw          $v0, 0x0($v1)
.L8001F9E4:
    jal         func_8001F0C4
    nop
.L8001F9EC:
    addu        $v0, $s0, $zero
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end menu_player_finalize
