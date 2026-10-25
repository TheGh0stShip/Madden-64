.text
.align 2
.set noreorder
.globl func_80094FC0
.ent func_80094FC0
func_80094FC0:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x2F58
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a0, 0x2DB8($at)
    addiu       $a0, $a0, -0x18C
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a1, 0x2DB4($at)
    addiu       $a1, $a1, -0x78
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
.end func_80094FC0
