.text
.align 2
.set noreorder
.globl func_800A73BC
.ent func_800A73BC
func_800A73BC:
    addu        $v1, $zero, $zero
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x58DC
    sll         $v0, $v1, 16
.L800A73CC:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $a0
    sw          $zero, 0x0($v0)
    addiu       $v0, $v1, 0x1
    addu        $v1, $v0, $zero
    sll         $v0, $v0, 16
    blezl       $v0, .L800A73CC
    sll         $v0, $v1, 16
    jr          $ra
    nop
.end func_800A73BC
