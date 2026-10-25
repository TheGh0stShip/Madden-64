.text
.align 2
.set noreorder
.globl func_800B3828
.ent func_800B3828
func_800B3828:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $sp, $sp, -0x20
    addiu       $v0, $zero, -0x1
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    beq         $v1, $v0, .L800B38DC
    sw          $s0, 0x10($sp)
    lui         $a1, 0x8008
    lw          $a1, 0x793C($a1)
    lui         $v0, 0x320
    beq         $a1, $v0, .L800B386C
    addiu       $v0, $zero, -0x1
    lui         $a0, 0x8008
    lh          $a0, 0x4F34($a0)
    jal         func_800B932C
    sra         $a1, $a1, 16
.L800B386C:
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6DB0
    addu        $a0, $s0, $zero
    lui         $a1, 0x8009
    lh          $a1, -0x6CE0($a1)
    sll         $a2, $v0, 16
    jal         func_800AAFB0
    sra         $a2, $a2, 16
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x4674
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x0($s1)
    lui         $at, 0x8007
    sw          $s0, -0x4670($at)
    bnez        $v1, .L800B38C8
    addiu       $a0, $zero, 0xF0
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x20F4
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    addiu       $a0, $zero, 0xF0
.L800B38C8:
    addu        $a1, $s1, $zero
    jal         func_800AACE8
    addiu       $a2, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x4642($at)
.L800B38DC:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B3828
