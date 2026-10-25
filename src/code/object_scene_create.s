.text
.align 2
.set noreorder
.globl object_scene_create
.ent object_scene_create
object_scene_create:
    lui         $v0, 0x8006
    lw          $v0, 0x4BA8($v0)
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x1C($sp)
    sw          $s1, 0x14($sp)
    beqz        $v0, .L8000D304
    sw          $s0, 0x10($sp)
.L8000D2E4:
    lui         $a0, 0x8006
    lw          $a0, 0x4BA8($a0)
    jal         func_8000D684
    nop
    lui         $v0, 0x8006
    lw          $v0, 0x4BA8($v0)
    bnez        $v0, .L8000D2E4
    nop
.L8000D304:
    lui         $a0, 0x8008
    lw          $a0, -0x7D10($a0)
    beqz        $a0, .L8000D324
    nop
    jal         func_80033258
    nop
    lui         $at, 0x8008
    sw          $zero, -0x7D10($at)
.L8000D324:
    lui         $a0, 0x8008
    lw          $a0, -0x7D0C($a0)
    beqz        $a0, .L8000D344
    nop
    jal         func_80033258
    nop
    lui         $at, 0x8008
    sw          $zero, -0x7D0C($at)
.L8000D344:
    lui         $v0, 0x8008
    lw          $v0, -0x7D08($v0)
    beqz        $v0, .L8000D3B4
    addu        $s1, $zero, $zero
.L8000D354:
    lui         $v1, 0x8008
    lw          $v1, -0x7D08($v1)
    andi        $v0, $s1, 0xFFFF
    sll         $s0, $v0, 2
    addu        $v1, $s0, $v1
    lw          $a0, 0x0($v1)
    beqz        $a0, .L8000D38C
    addiu       $s1, $s1, 0x1
    jal         func_80033258
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x7D08($v0)
    addu        $v0, $s0, $v0
    sw          $zero, 0x0($v0)
.L8000D38C:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x11
    bnez        $v0, .L8000D354
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x7D08($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $zero, -0x7D08($at)
.L8000D3B4:
    addu        $a0, $zero, $zero
    lhu         $a1, 0x6($s2)
    addiu       $a2, $zero, 0x10
    jal         func_80033174
    addu        $s1, $zero, $zero
    lhu         $a1, 0x2($s2)
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, -0x7D10($at)
    jal         func_80033174
    addiu       $a2, $zero, 0x58
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, -0x7D0C($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x44
    lui         $at, 0x8008
    sw          $v0, -0x7D08($at)
    andi        $s0, $s1, 0xFFFF
.L8000D400:
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $s2, $v0
    lw          $a1, 0x8($v0)
    beqz        $a1, .L8000D440
    addu        $a0, $zero, $zero
    lw          $a2, 0xC($v0)
    jal         func_80033174
    andi        $a1, $a1, 0xFFFF
    lui         $a0, 0x8008
    lw          $a0, -0x7D08($a0)
    sll         $v1, $s0, 2
    addu        $v1, $v1, $a0
    j .L8000D454
    sw          $v0, 0x0($v1)
.L8000D440:
    lui         $v1, 0x8008
    lw          $v1, -0x7D08($v1)
    sll         $v0, $s0, 2
    addu        $v0, $v0, $v1
    sw          $zero, 0x0($v0)
.L8000D454:
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x11
    bnez        $v0, .L8000D400
    andi        $s0, $s1, 0xFFFF
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    sw          $s2, -0x7D04($at)
    jal         func_8000D5BC
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x6CE4($at)
    lui         $at, 0x8008
    sw          $zero, 0x7940($at)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_scene_create
