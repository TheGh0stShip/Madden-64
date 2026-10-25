.text
.align 2
.set noreorder
.globl func_800AE90C
.ent func_800AE90C
func_800AE90C:
    addu        $a0, $zero, $zero
    sw          $ra, 0x10($sp)
    jal         func_80032E00
    addiu       $a1, $zero, 0x2000
    lui         $at, 0x8007
    sw          $v0, -0x462C($at)
.end func_800AE90C
