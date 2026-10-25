.text
.align 2
.set noreorder
.globl func_800A365C
.ent func_800A365C
func_800A365C:
    addiu       $v0, $zero, 0x35
    sb          $v0, 0x10($sp)
    sll         $a0, $t1, 1
    addu        $a0, $a0, $t1
    sll         $a0, $a0, 2
    subu        $a0, $a0, $t1
    sll         $a0, $a0, 4
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7138
    addu        $a0, $a0, $v0
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x10
    j           func_8009EF9C
    nop
.end func_800A365C
