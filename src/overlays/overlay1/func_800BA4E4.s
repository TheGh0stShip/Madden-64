.text
.align 2
.set noreorder
.globl func_800BA4E4
.ent func_800BA4E4
func_800BA4E4:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    beqz        $a1, .L800BA514
    sw          $ra, 0x14($sp)
    addiu       $v0, $zero, 0x1
    beq         $a1, $v0, .L800BA524
    nop
    j           func_800B5E08
    nop
.L800BA514:
    lw          $v0, 0x24($a0)
    lw          $s0, 0x1C($v0)
    j           func_800B5E08
    nop
.L800BA524:
    lw          $v0, 0x24($a0)
    lw          $s0, 0x20($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    bnel        $v0, $zero, .L800BA544
    negu        $s0, $s0
.L800BA544:
    sra         $v0, $s0, 16
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BA4E4
