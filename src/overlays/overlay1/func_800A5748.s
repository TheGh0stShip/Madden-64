.text
.align 2
.set noreorder
.globl func_800A5748
.ent func_800A5748
func_800A5748:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    sll         $a0, $a1, 21
    sra         $a0, $a0, 16
    sw          $ra, 0x24($sp)
    jal         func_800B9274
    addiu       $a1, $sp, 0x10
    lw          $v0, 0x0($s0)
    lw          $v1, 0x10($sp)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lw          $v0, 0x4($s0)
    lw          $a0, 0x14($sp)
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    addu        $v0, $v0, $a0
    andi        $v1, $v1, 0x200
    beqz        $v1, .L800A57C0
    sw          $v0, 0x4($s0)
    lw          $v1, 0x0($s0)
    bltzl       $v1, .L800A57A4
    negu        $v1, $v1
.L800A57A4:
    lui         $v0, 0x187
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A57C0
    nop
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
.L800A57C0:
    lw          $v0, 0x4($s0)
    lui         $v1, 0xFCE4
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A57E8
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8008
    lh          $v1, 0x7AF0($v1)
    bne         $v1, $v0, .L800A57E8
    lui         $v0, 0xFCD0
    sw          $v0, 0x4($s0)
.L800A57E8:
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A5748
