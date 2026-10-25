.text
.align 2
.set noreorder
.globl func_800BAC90
.ent func_800BAC90
func_800BAC90:
    lui         $v0, 0x8008
    lhu         $v0, 0x7988($v0)
    lui         $a0, 0x8008
    lhu         $a0, 0x6BE0($a0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x1860
    sll         $a0, $a0, 1
    addu        $v0, $v1, $v0
    addu        $a0, $a0, $v0
    lh          $a0, 0x0($a0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xD78($at)
    lui         $a0, 0x8007
    lw          $a0, 0x18F4($a0)
    andi        $v0, $v0, 0x3F
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $a1, -0x2AA0($at)
    addu        $a2, $zero, $zero
    jal         func_80097D28
    nop
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BAC90
