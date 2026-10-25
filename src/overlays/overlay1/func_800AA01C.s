.text
.align 2
.set noreorder
.globl func_800AA01C
.ent func_800AA01C
func_800AA01C:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lhu         $v0, 0x84($s0)
    lh          $v1, 0x2($s0)
    sw          $zero, 0x3C($s0)
    sw          $zero, 0x40($s0)
    sw          $zero, 0x44($s0)
    sh          $zero, 0x6C($s0)
    sh          $zero, 0x6E($s0)
    sh          $zero, 0x70($s0)
    ori         $v0, $v0, 0x5
    sll         $v1, $v1, 2
    sh          $v0, 0x84($s0)
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lw          $v0, -0x58C0($at)
    jalr        $v0
    nop
    lh          $v0, 0x68($s0)
    lh          $v1, 0x60($s0)
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 5
    sh          $v0, 0x70($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AA01C
