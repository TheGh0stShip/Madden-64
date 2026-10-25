.text
.align 2
.set noreorder
.globl func_800B1F30
.ent func_800B1F30
func_800B1F30:
    addu        $s1, $s1, $v0
    sll         $s1, $s1, 3
    andi        $v0, $s3, 0xFFFF
    sll         $s0, $v0, 5
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addu        $v0, $s1, $s0
    lui         $at, 0x8007
    sw          $a1, -0x4670($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xD77($at)
    addiu       $s5, $a1, 0x28
    jal         func_800167FC
    addiu       $s6, $v1, 0x10
.end func_800B1F30
