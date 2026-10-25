.text
.align 2
.set noreorder
.globl func_800C1CD4
.ent func_800C1CD4
func_800C1CD4:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lw          $a0, 0x0($s0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lw          $a0, 0x10($a0)
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v0, $v1, $s5
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v0
    lh          $a0, 0x0($a0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xD78($at)
    andi        $v0, $v0, 0x3F
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $a1, -0x2AA0($at)
    jal         func_80097D28
    addu        $a0, $s1, $zero
    j           func_800BD644
    sh          $s2, 0x3C($s1)
.end func_800C1CD4
