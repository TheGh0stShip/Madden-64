.text
.align 2
.set noreorder
.globl func_800C3D68
.ent func_800C3D68
func_800C3D68:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $a1, 0x8($s0)
    lui         $v0, 0x8009
    lw          $v0, -0x7F70($v0)
    lh          $v1, 0xB8($a1)
    lhu         $v0, 0x1A($v0)
    bgez        $v1, .L800C3DB0
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    slti        $v0, $a0, -0x11B3
    beqz        $v0, .L800C3DEC
    addiu       $v1, $zero, -0x11B3
    lhu         $v0, 0xA8($a1)
    j           func_800BF6A4
    subu        $a0, $v1, $a0
.L800C3DB0:
    sra         $a0, $v0, 16
    addiu       $v0, $zero, 0x11B3
    slt         $v0, $v0, $a0
    beqz        $v0, .L800C3DEC
    addiu       $a0, $a0, -0x11B3
    lhu         $v0, 0xA8($a1)
    andi        $a0, $a0, 0xFFFF
    ori         $v0, $v0, 0x8
    jal         func_800BF624
    sh          $v0, 0xA8($a1)
    addu        $a0, $s0, $zero
    jal         func_8000EBEC
    andi        $a1, $v0, 0xFF
    j           func_800BF6D4
    nop
.L800C3DEC:
    lhu         $v0, 0xA8($a1)
    andi        $v0, $v0, 0xFFF7
    sh          $v0, 0xA8($a1)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C3D68
