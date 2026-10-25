.text
.align 2
.set noreorder
.globl func_800C62A8
.ent func_800C62A8
func_800C62A8:
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x1860
    sll         $v1, $v1, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    lh          $a1, 0x0($v1)
    lui         $at, 0x8007
    addu        $at, $at, $a2
    lbu         $a2, 0x480C($at)
    jal         func_800C2190
    addu        $a0, $a3, $zero
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C62A8
