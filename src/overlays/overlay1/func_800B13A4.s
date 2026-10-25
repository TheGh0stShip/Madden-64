.text
.align 2
.set noreorder
.globl func_800B13A4
.ent func_800B13A4
func_800B13A4:
    lw          $t0, 0xC($s1)
    lui         $v0, 0x8009
    lh          $v0, -0x6A2E($v0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x46B8
    sw          $v0, 0x10($sp)
    sll         $v0, $t0, 2
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lui         $at, 0x8007
    sw          $v1, -0x466C($at)
    jal         func_8003DDF8
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0x60
    addu        $a1, $s0, $zero
    addu        $a2, $s1, $zero
    jal         func_800AEFF8
    addu        $a3, $zero, $zero
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800B13A4
