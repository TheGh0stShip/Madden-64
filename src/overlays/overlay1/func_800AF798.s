.text
.align 2
.set noreorder
.globl func_800AF798
.ent func_800AF798
func_800AF798:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s4, 0x20($sp)
    lhu         $s4, 0x3A($sp)
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    sw          $s0, 0x10($sp)
    addu        $s0, $a2, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a3, $zero
    sw          $ra, 0x24($sp)
    jal         func_800AB2D0
    sw          $s3, 0x1C($sp)
    jal         func_8004DF94
    addu        $a0, $s1, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2000
    jal         func_8002E65C
    addu        $a0, $s1, $v0
    jal         func_8004DF94
    addu        $a0, $s1, $zero
    sll         $s0, $s0, 16
    sra         $a0, $s0, 16
    bnez        $a0, .L800AF83C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s1, $v0
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0xEE0
    lb          $v1, 0x0($a2)
    lb          $a0, 0x1($a2)
    lb          $a1, 0x2($a2)
    sb          $v1, 0x0($v0)
    sb          $a0, 0x1($v0)
    sb          $a1, 0x2($v0)
    j           func_800AB160
    nop
.L800AF83C:
    blez        $a0, . + 4 + (0x6 << 2)
    sll         $a1, $v0, 16
    sra         $a1, $a1, 16
    jal         func_800167FC
    addu        $a1, $s1, $a1
    j           func_800AB160
    nop
.end func_800AF798
