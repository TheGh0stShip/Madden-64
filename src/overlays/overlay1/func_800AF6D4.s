.text
.align 2
.set noreorder
.globl func_800AF6D4
.ent func_800AF6D4
func_800AF6D4:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    sw          $s0, 0x10($sp)
    sw          $ra, 0x18($sp)
    jal         func_800AB2D0
    addu        $s0, $a2, $zero
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
    bnez        $a0, .L800AF748
    nop
    sll         $a0, $v0, 16
    sra         $a0, $a0, 16
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x1FF8
    j           func_800AB054
    addu        $a0, $s1, $a0
.L800AF748:
    blez        $a0, .L800AF764
    sll         $a1, $v0, 16
    sra         $a1, $a1, 16
    jal         func_800167FC
    addu        $a1, $s1, $a1
    j           func_800AB05C
    nop
.L800AF764:
    sll         $a0, $v0, 16
    sra         $a0, $a0, 16
    addu        $a0, $s1, $a0
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x1FF0
    jal         func_8002E65C
    nop
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AF6D4
