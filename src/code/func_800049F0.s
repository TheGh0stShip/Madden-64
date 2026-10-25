.text
.align 2
.set noreorder
.globl func_800049F0
.ent func_800049F0
func_800049F0:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x1C($sp)
    addu        $s1, $a0, $zero
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x18
    sw          $ra, 0x20($sp)
    jal         func_80032E00
    sw          $s0, 0x18($sp)
    lui         $v1, 0x51EB
    ori         $v1, $v1, 0x851F
    .word       0x02230018  # mult        $s1, $v1
    addu        $a0, $zero, $zero
    addiu       $a2, $zero, 0x10
    sw          $s1, 0x0($v0)
    sra         $s1, $s1, 31
    addiu       $v1, $zero, -0x10
    lui         $at, 0x8006
    sw          $v0, 0x4A00($at)
    sw          $zero, 0x4($v0)
    .word       0x00004010  # mfhi        $t0
    sra         $s0, $t0, 4
    subu        $s0, $s0, $s1
    addiu       $s0, $s0, 0xF
    and         $s0, $s0, $v1
    sw          $s0, 0x8($v0)
    sll         $s0, $s0, 2
    jal         func_800337CC
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0x10
    jal         func_800337CC
    sw          $v0, 0xC($v1)
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x100
    jal         func_80032E00
    sw          $v0, 0x10($v1)
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    addiu       $s1, $zero, 0x7
    sw          $v0, 0x14($v1)
.L80004AA4:
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    addu        $s0, $s1, $zero
    lw          $v0, 0x14($v0)
    sll         $a0, $s1, 5
    addiu       $s1, $s1, -0x1
    jal         func_80008C94
    addu        $a0, $v0, $a0
    bnez        $s0, .L80004AA4
    nop
    lui         $a0, 0x8006
    lw          $a0, 0x4A00($a0)
    jal         func_80004D34
    nop
    lui         $a0, 0x8006
    lw          $a0, 0x4A00($a0)
    jal         func_80004D34
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6A30
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x56
    lui         $a2, 0x8001
    addiu       $a2, $a2, -0x7344
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x69C8
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x80
    addu        $a3, $zero, $zero
    jal         func_80045B98
    sw          $v0, 0x14($sp)
    jal         func_8004DE18
    addu        $a0, $s0, $zero
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800049F0
