.text
.align 2
.set noreorder
.globl func_800BD6F8
.ent func_800BD6F8
func_800BD6F8:
    .word       0x00C60018  # mult        $a2, $a2
    .word       0x00003012  # mflo        $a2
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    srl         $v0, $a2, 31
    addu        $a2, $a2, $v0
    sra         $a2, $a2, 1
    .word       0x00C30018  # mult        $a2, $v1
    .word       0x00003012  # mflo        $a2
    sll         $a0, $s0, 16
    sra         $a0, $a0, 16
    jal         func_800B9274
    addiu       $a1, $sp, 0x10
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x7A70
.end func_800BD6F8
