.text
.align 2
.set noreorder
.globl func_800C20F0
.ent func_800C20F0
func_800C20F0:
    addiu       $t2, $zero, -0x1
    addu        $a3, $zero, $zero
    lw          $v0, 0x14($sp)
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    addu        $t0, $zero, $zero
    addu        $a2, $v0, $a2
    srl         $t1, $v1, 1
    blez        $t1, . + 4 + (0x36 << 2)
    sw          $a2, 0x14($sp)
    andi        $v0, $a1, 0xFFFF
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $t4, $v1, $a0
    addiu       $t5, $zero, 0x40
    lw          $t3, 0x10($sp)
    sll         $v0, $a3, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $t4
.end func_800C20F0
