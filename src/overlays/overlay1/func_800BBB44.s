.text
.align 2
.set noreorder
.globl func_800BBB44
.ent func_800BBB44
func_800BBB44:
    subu        $a1, $a1, $a0
    lui         $v1, 0x2F
    ori         $v1, $v1, 0xFFFF
    lui         $v0, 0x5F
    ori         $v0, $v0, 0xFFFE
    addu        $v1, $a1, $v1
    sltu        $v0, $v0, $v1
    beqz        $v0, .L800BBBB4
    andi        $v1, $a3, 0xFFFF
    sra         $a1, $a1, 5
    andi        $v0, $a2, 0xFFFF
    .word       0x00A20018  # mult        $a1, $v0
    .word       0x00001012  # mflo        $v0
    nop
    nop
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L800BBB90
    nop
    break       7
.L800BBB90:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L800BBBA8
    lui         $at, 0x8000
    bne         $v0, $at, .L800BBBA8
    nop
    break       6
.L800BBBA8:
    .word       0x00001012  # mflo        $v0
    j           func_800B74D0
    sll         $v0, $v0, 5
.L800BBBB4:
    andi        $v0, $a2, 0xFFFF
    .word       0x00A20018  # mult        $a1, $v0
    .word       0x00001012  # mflo        $v0
    nop
    nop
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L800BBBD8
    nop
    break       7
.L800BBBD8:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L800BBBF0
    lui         $at, 0x8000
    bne         $v0, $at, .L800BBBF0
    nop
    break       6
.L800BBBF0:
    .word       0x00001012  # mflo        $v0
    jr          $ra
    addu        $v0, $a0, $v0
.end func_800BBB44
