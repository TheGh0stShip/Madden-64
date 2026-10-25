.text
.align 2
.set noreorder
.globl func_800AD36C
.ent func_800AD36C
func_800AD36C:
    jal         func_8001D1E0
    addu        $a1, $s2, $zero
    lw          $a0, 0x0($fp)
    sll         $v0, $s5, 2
    lui         $t1, 0x8007
    addiu       $t1, $t1, -0x47F0
    addu        $v0, $v0, $t1
    lw          $a1, 0x0($v0)
    addu        $a2, $s4, $zero
    addiu       $s5, $s5, 0x1
    addiu       $s3, $s3, 0x4
    addiu       $s6, $s6, 0x180
    jal         func_8001A998
    addiu       $s4, $s4, 0x1
    sltiu       $v0, $s4, 0x3
.end func_800AD36C
