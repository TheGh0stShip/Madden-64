.text
.align 2
.set noreorder
.globl func_800BABB8
.ent func_800BABB8
func_800BABB8:
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0xD6A
    sll         $a1, $v0, 5
    addu        $a1, $a1, $v0
    sll         $a1, $a1, 2
    addu        $a1, $a1, $v0
    sll         $a1, $a1, 2
    addu        $a1, $a1, $v0
    sll         $a1, $a1, 2
    subu        $a1, $a1, $v0
    sll         $a1, $a1, 2
    addiu       $v0, $a3, 0xAF6
    sll         $v1, $v1, 1
    addu        $v0, $a1, $v0
    addu        $v1, $v1, $v0
    lh          $v1, 0x0($v1)
    addu        $a1, $a1, $a3
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    j           func_800B65F4
.end func_800BABB8
