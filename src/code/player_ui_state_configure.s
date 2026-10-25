.text
.align 2
.set noreorder
.globl player_ui_state_configure
.ent player_ui_state_configure
player_ui_state_configure:
    addiu       $sp, $sp, -0x28
    addu        $a3, $a0, $zero
    andi        $v0, $a3, 0xFF
    sll         $v1, $v0, 5
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $a0, 0x8007
    lh          $a0, -0x6D4E($a0)
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    sw          $s3, 0x1C($sp)
    sw          $ra, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a2, -0x7B0C($at)
    bnez        $a0, .L8001F4F0
    addu        $s3, $a1, $zero
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, -0x7B08($at)
    j .L8001F500
    andi        $s1, $a3, 0xFF
.L8001F4F0:
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, -0x7B08($at)
    andi        $s1, $a3, 0xFF
.L8001F500:
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
    bne         $s1, $v0, .L8001F54C
    nop
    jal         func_8001F0C4
    addiu       $a0, $zero, 0x1
    jal         func_8001F0C4
    addiu       $a0, $zero, 0x1
.L8001F54C:
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
.end player_ui_state_configure
