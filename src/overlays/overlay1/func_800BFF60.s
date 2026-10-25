.text
.align 2
.set noreorder
.globl func_800BFF60
.ent func_800BFF60
func_800BFF60:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    addu        $t3, $v1, $zero
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $t2, $v1, $a0
    sll         $v0, $t0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $t2
    lw          $v1, 0x0($v0)
.end func_800BFF60
