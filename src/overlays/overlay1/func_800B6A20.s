.text
.align 2
.set noreorder
.globl func_800B6A20
.ent func_800B6A20
func_800B6A20:
    addiu       $sp, $sp, -0x48
    sw          $s1, 0x3C($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x40($sp)
    addu        $s2, $a1, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $v0, $zero, 0x1
    andi        $a2, $a2, 0xFFFF
    addu        $a1, $zero, $zero
    sw          $a2, 0x10($sp)
    addiu       $a2, $sp, 0x10
    sw          $ra, 0x44($sp)
    sw          $s0, 0x38($sp)
    sw          $zero, 0x1C($sp)
    sh          $v0, 0x14($sp)
    sh          $zero, 0x16($sp)
    sh          $zero, 0x18($sp)
    sw          $zero, 0x20($sp)
    jal         func_8000D740
    sw          $zero, 0x28($sp)
    addu        $s0, $v0, $zero
    jal         func_80016FE4
    addu        $a0, $s0, $zero
    addu        $v0, $s0, $zero
    andi        $s1, $s1, 0xFFFF
    addiu       $s1, $s1, 0xC
    andi        $s2, $s2, 0xFFFF
    addiu       $s2, $s2, 0xC
    sw          $s1, 0x1C($v0)
    sw          $s2, 0x20($v0)
    lw          $ra, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800B6A20
