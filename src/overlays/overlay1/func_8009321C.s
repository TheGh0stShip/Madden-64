.text
.align 2
.set noreorder
.globl func_8009321C
.ent func_8009321C
func_8009321C:
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v1, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $v0, 0x2DC0($at)
    andi        $a0, $a0, 0x1F
    bnel        $a0, $v0, .L80093258
    addiu       $s4, $zero, 0x1
.L80093258:
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0xCF7($at)
    addiu       $a0, $zero, 0xFF
    subu        $a0, $a0, $v0
    sra         $a0, $a0, 3
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    addiu       $v0, $v0, 0x14
    sll         $v1, $a0, 1
    addu        $v1, $v1, $s2
    bne         $s4, $s5, . + 4 + (0xE << 2)
    sh          $v0, 0x0($v1)
.end func_8009321C
