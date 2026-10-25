.text
.align 2
.set noreorder
.globl func_800BAC0C
.ent func_800BAC0C
func_800BAC0C:
    addu        $a1, $a1, $v0
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
    lbu         $a0, 0xD77($at)
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    lui         $a0, 0x8007
    lw          $a0, 0x18F4($a0)
    j           func_800B65F0
    addiu       $a1, $sp, 0x10
.end func_800BAC0C
