.text
.align 2
.set noreorder
.globl func_800B0624
.ent func_800B0624
func_800B0624:
    lui         $v0, 0x8008
    lw          $v0, 0x57E4($v0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2238
    beqz        $v0, .L800B0644
    nop
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2284
.L800B0644:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800B0664
    addiu       $a0, $zero, 0x3B
    jal         func_80041E54
    addiu       $a0, $zero, 0xC
    j           func_800AC510
    nop
.L800B0664:
    addiu       $a1, $zero, 0xF
    jal         func_80041DD4
    addiu       $a2, $zero, 0xB4
    j           func_800AC510
    nop
.end func_800B0624
