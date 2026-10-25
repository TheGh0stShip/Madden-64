.text
.align 2
.set noreorder
.globl menu_player_process
.ent menu_player_process
menu_player_process:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    sw          $ra, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lbu         $v0, 0xE($s3)
    addu        $a2, $a0, $zero
    andi        $a0, $v0, 0x3F
    bnez        $a0, .L8001F350
    andi        $v1, $a2, 0xFF
    lbu         $v0, 0x20($s3)
    bnez        $v0, .L8001F320
    andi        $v0, $a2, 0xFF
    sll         $v1, $v0, 5
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1730
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, -0x7B0C($at)
    j .L8001F380
    nop
.L8001F320:
    sll         $v1, $v0, 5
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1738
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, -0x7B0C($at)
    j .L8001F380
    nop
.L8001F350:
    sll         $v0, $v1, 5
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    sll         $v1, $a0, 3
    lui         $a0, 0x8007
    addiu       $a0, $a0, 0x1738
    addu        $v1, $v1, $a0
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, -0x7B0C($at)
.L8001F380:
    lui         $v0, 0x8007
    lh          $v0, -0x6D4E($v0)
    bnez        $v0, .L8001F3C0
    andi        $v1, $a2, 0xFF
    andi        $v0, $a2, 0xFF
    sll         $v1, $v0, 5
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, -0x7B08($at)
    j .L8001F3E4
    andi        $s1, $a2, 0xFF
.L8001F3C0:
    sll         $v0, $v1, 5
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, -0x7B08($at)
    andi        $s1, $a2, 0xFF
.L8001F3E4:
    sll         $v0, $s1, 5
    subu        $v0, $v0, $s1
    sll         $v0, $v0, 3
    lbu         $v1, 0x21($s3)
    addu        $v0, $v0, $s1
    sll         $s2, $v0, 3
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sw          $zero, -0x7A54($at)
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sb          $v1, -0x7A5C($at)
    bne         $s1, $v0, .L8001F430
    nop
    jal         func_8001F0C4
    addiu       $a0, $zero, 0x1
    jal         func_8001F0C4
    addiu       $a0, $zero, 0x1
.L8001F430:
    jal         func_8001F0C4
    addu        $a0, $s1, $zero
    lbu         $a1, 0x10($s3)
    lbu         $a2, 0xF($s3)
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x7AAC
    addu        $s0, $s2, $s0
    jal         func_80044F48
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
    lbu         $a2, 0xD($s3)
    addu        $a1, $s1, $zero
    jal         func_80044F6C
    addu        $a3, $s3, $zero
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end menu_player_process
