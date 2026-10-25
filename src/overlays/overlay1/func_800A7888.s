.text
.align 2
.set noreorder
.globl func_800A7888
.ent func_800A7888
func_800A7888:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x1F4($s2)
    lhu         $v0, 0x84($s0)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800A78D0
    nop
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x58C0($at)
    jalr        $v0
    addu        $a0, $s0, $zero
.L800A78D0:
    lhu         $v0, 0x84($s0)
    andi        $v1, $v0, 0x10
    bnel        $v1, $zero, .L800A7960
    addu        $a0, $s2, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    sltu        $v0, $v1, $v0
    beqz        $v0, .L800A7950
    addu        $s1, $zero, $zero
.L800A78F4:
    lhu         $v1, 0x84($s0)
    andi        $v0, $v1, 0x4
    beqz        $v0, .L800A7914
    andi        $v0, $v1, 0x400
    jal         func_800A5AEC
    addu        $a0, $s0, $zero
    j           func_800A3210
    nop
.L800A7914:
    beqz        $v0, .L800A792C
    nop
    jal         func_800A5FD0
    addu        $a0, $s0, $zero
    j           func_800A3210
    nop
.L800A792C:
    jal         func_800A61E4
    addu        $a0, $s0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800A78F4
    nop
.L800A7950:
    lhu         $v0, 0x84($s0)
    andi        $v0, $v0, 0xFFFE
    sh          $v0, 0x84($s0)
    addu        $a0, $s2, $zero
.L800A7960:
    jal         func_8000C9AC
    addiu       $a1, $s0, 0x5C
    addu        $a0, $s2, $zero
    jal         func_8000CA20
    addiu       $a1, $s0, 0x1C
    lh          $v0, 0x2($s0)
    lhu         $v1, 0x4($s2)
    sll         $v0, $v0, 1
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $a1, -0x5840($at)
    beq         $v1, $a1, .L800A799C
    nop
    jal         func_8000B7A4
    addu        $a0, $s2, $zero
.L800A799C:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A7888
