.text
.align 2
.set noreorder
.globl func_800BD6CC
.ent func_800BD6CC
func_800BD6CC:
    lui         $a0, 0x8008
    lw          $a0, 0x6CFC($a0)
    sw          $s0, 0x20($sp)
    lui         $s0, 0x8006
    lhu         $s0, 0x4A4C($s0)
    sw          $ra, 0x28($sp)
    jal         func_8000C8EC
    nop
    bnel        $v0, $zero, .L800BD6F4
    addiu       $s0, $s0, 0x7FF
.L800BD6F4:
    andi        $a2, $s1, 0xFFFF
.end func_800BD6CC
