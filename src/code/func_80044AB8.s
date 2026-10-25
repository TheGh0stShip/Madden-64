.text
.align 2
.set noreorder
.globl func_80044AB8
.ent func_80044AB8
func_80044AB8:
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    addiu       $sp, $sp, -0x20
    addiu       $a1, $zero, 0x6
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $s2, 0x18($sp)
    lui         $s2, 0x8007
    addiu       $s2, $s2, 0x48FC
    sw          $ra, 0x1C($sp)
    jal         func_80035F88
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
.L80044AEC:
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    lhu         $a1, 0x0($s2)
    andi        $a3, $s0, 0xFFFF
    addiu       $s0, $s0, 0x1
    jal         func_8004486C
    andi        $a2, $s1, 0xFFFF
    sltiu       $v0, $s0, 0x4
    bnez        $v0, .L80044AEC
    nop
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    andi        $s0, $s1, 0xFFFF
    addu        $a1, $s0, $zero
    addiu       $s2, $s2, 0x2
    jal         func_80044744
    addiu       $s1, $s1, 0x1
    jal         func_800444D0
    addu        $a0, $s0, $zero
    sltiu       $v0, $s1, 0x4
    bnel        $v0, $zero, .L80044AEC
    addu        $s0, $zero, $zero
    jal         func_8004211C
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x5AA8($a1)
    lui         $at, 0x8008
    sh          $zero, -0x565C($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    lw          $a1, -0x5668($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80044AB8
