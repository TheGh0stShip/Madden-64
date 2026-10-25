.text
.align 2
.set noreorder
.globl func_800B05C0
.ent func_800B05C0
func_800B05C0:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x22D8
    sw          $zero, 0x10($sp)
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0x5
    j           func_800ABED0
    addu        $a2, $zero, $zero
.end func_800B05C0
