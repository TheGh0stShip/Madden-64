.text
.align 2
.set noreorder
.globl func_800935A4
.ent func_800935A4
func_800935A4:
    beqz        $v0, . + 4 + (0x119 << 2)
    addu        $s2, $zero, $zero
    lui         $s7, 0x8008
    addiu       $s7, $s7, 0x5040
    addiu       $s3, $zero, -0xC1
    lui         $s6, 0x8008
    addiu       $s6, $s6, 0x78A8
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x6C80
    lui         $s4, 0x8007
    addiu       $s4, $s4, 0x2720
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    sll         $v1, $s2, 16
    sra         $a2, $v1, 16
    sll         $s1, $a2, 2
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s7
    addu        $a3, $s1, $v0
    lw          $v0, 0x0($a3)
    lbu         $a1, 0x21($v0)
    addiu       $v0, $zero, 0x40
.end func_800935A4
