.text
.align 2
.set noreorder
.globl object_scene_reset
.ent object_scene_reset
object_scene_reset:
    lui         $v0, 0x8006
    lw          $v0, 0x4BA8($v0)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    beqz        $v0, .L8000D4E8
    sw          $s0, 0x10($sp)
.L8000D4C8:
    lui         $a0, 0x8006
    lw          $a0, 0x4BA8($a0)
    jal         func_8000D684
    nop
    lui         $v0, 0x8006
    lw          $v0, 0x4BA8($v0)
    bnez        $v0, .L8000D4C8
    nop
.L8000D4E8:
    lui         $a0, 0x8008
    lw          $a0, -0x7D10($a0)
    beqz        $a0, .L8000D508
    nop
    jal         func_80033258
    nop
    lui         $at, 0x8008
    sw          $zero, -0x7D10($at)
.L8000D508:
    lui         $a0, 0x8008
    lw          $a0, -0x7D0C($a0)
    beqz        $a0, .L8000D528
    nop
    jal         func_80033258
    nop
    lui         $at, 0x8008
    sw          $zero, -0x7D0C($at)
.L8000D528:
    lui         $v0, 0x8008
    lw          $v0, -0x7D08($v0)
    beqz        $v0, .L8000D59C
    nop
    addu        $s0, $zero, $zero
.L8000D53C:
    lui         $v1, 0x8008
    lw          $v1, -0x7D08($v1)
    andi        $v0, $s0, 0xFFFF
    sll         $s1, $v0, 2
    addu        $v1, $s1, $v1
    lw          $a0, 0x0($v1)
    beqz        $a0, .L8000D574
    addiu       $s0, $s0, 0x1
    jal         func_80033258
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x7D08($v0)
    addu        $v0, $s1, $v0
    sw          $zero, 0x0($v0)
.L8000D574:
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x11
    bnez        $v0, .L8000D53C
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x7D08($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $zero, -0x7D08($at)
.L8000D59C:
    lui         $at, 0x8008
    sw          $zero, 0x7940($at)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_scene_reset
