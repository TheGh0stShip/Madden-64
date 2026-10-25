.text
.align 2
.set noreorder
.globl func_800BA55C
.ent func_800BA55C
func_800BA55C:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    jal         func_800C157C
    sw          $s0, 0x10($sp)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    sll         $v0, $v0, 16
    jal         func_8000C8EC
    sra         $s0, $v0, 16
    bnel        $v0, $zero, .L800BA588
    addiu       $s0, $s0, 0x800
.L800BA588:
    sra         $s0, $s0, 4
    andi        $v0, $s0, 0xFF
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BA55C
