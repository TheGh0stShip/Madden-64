.text
.align 2
.set noreorder
.globl func_800B2250
.ent func_800B2250
func_800B2250:
    addiu       $a1, $a1, 0x5A58
    sll         $s1, $s0, 2
    addu        $s1, $s1, $s0
    sll         $s1, $s1, 3
    sll         $s0, $s2, 5
    addu        $s0, $s0, $s2
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s2
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s2
    sll         $s0, $s0, 2
    subu        $s0, $s0, $s2
    sll         $s0, $s0, 2
    addu        $s2, $zero, $zero
    addiu       $fp, $v1, 0xC
    sh          $t1, 0x16($sp)
    sw          $v0, 0x0($v1)
    addu        $v0, $s1, $s0
    lui         $at, 0x8007
    sw          $a1, -0x4670($at)
    lui         $at, 0x8008
.end func_800B2250
