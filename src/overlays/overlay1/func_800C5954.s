.text
.align 2
.set noreorder
.globl func_800C5954
.ent func_800C5954
func_800C5954:
    lui         $v0, 0x8009
    lw          $v0, -0x7F70($v0)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lhu         $v0, 0x206($v0)
    andi        $v0, $v0, 0x100
    beqz        $v0, .L800C5994
    nop
    lw          $v0, 0x24($a0)
    lw          $v1, 0x1C($v0)
    lw          $v0, 0x20($v0)
    negu        $s1, $v1
    j           func_800C127C
    negu        $s0, $v0
.L800C5994:
    lw          $v0, 0x24($a0)
    lw          $s1, 0x1C($v0)
    lw          $s0, 0x20($v0)
    jal         func_80031A1C
    addiu       $a0, $zero, 0xA
    andi        $v0, $v0, 0xFF
    addiu       $v0, $v0, 0xC
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    jal         func_800B7B0C
    andi        $a2, $v0, 0xFF
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C5954
