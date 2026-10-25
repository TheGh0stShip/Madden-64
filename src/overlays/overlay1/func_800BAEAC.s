.text
.align 2
.set noreorder
.globl func_800BAEAC
.ent func_800BAEAC
func_800BAEAC:
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7608
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x200
    lui         $a0, 0x8008
    lw          $a0, 0x762C($a0)
    jal         func_80033B20
    addiu       $a1, $zero, 0x1
    addu        $a0, $s0, $zero
    jal         func_800C16A0
    addiu       $a1, $zero, 0x400
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BAEAC
