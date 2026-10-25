.text
.align 2
.set noreorder
.globl func_800C3768
.ent func_800C3768
func_800C3768:
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    addiu       $sp, $sp, -0x30
    addiu       $a1, $zero, 0x31
    sw          $s2, 0x18($sp)
    addiu       $s2, $zero, 0x1
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    jal         func_80035EF0
    sw          $s0, 0x10($sp)
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    addiu       $s5, $zero, -0x2
    lui         $at, 0x8008
    sw          $v0, 0x4F80($at)
    jal         func_80035EF0
    addiu       $a1, $zero, 0x32
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    addiu       $a1, $zero, 0x35
    jal         func_80035EF0
    addu        $s0, $v0, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0x3
    lui         $at, 0x8008
    sw          $v0, 0x69C8($at)
    jal         func_8000D740
    addu        $a2, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x4F80($a0)
    lw          $v1, 0x8($v0)
    ori         $s4, $zero, 0xFFFF
    lui         $at, 0x8009
    sw          $v0, -0x4C94($at)
    lui         $at, 0x8008
    sw          $v1, 0x775C($at)
    jal         func_80098070
    addu        $a1, $s0, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    addiu       $a1, $zero, 0x5
    jal         func_8000D740
    addu        $a2, $zero, $zero
    lui         $a1, 0x8008
    lw          $a1, 0x69C8($a1)
    addu        $s1, $v0, $zero
    jal         func_800980FC
    addu        $a0, $s1, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5D48
    sw          $s1, 0x0($v0)
    lw          $v1, 0x14($s1)
    addu        $s3, $v0, $zero
    ori         $v0, $zero, 0xFFFF
    sh          $v0, 0x3C($s1)
    addiu       $v0, $zero, -0x2
    and         $v1, $v1, $v0
    sw          $v1, 0x14($s1)
.L800C3860:
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    addiu       $a1, $zero, 0x5
    jal         func_8000D740
    addu        $a2, $zero, $zero
    addu        $a0, $s1, $zero
    addu        $a1, $v0, $zero
    andi        $s0, $s2, 0xFFFF
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s3
    jal         func_80098164
    sw          $a1, 0x0($s0)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $s5
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    addiu       $s2, $s2, 0x1
    sh          $s4, 0x3C($v0)
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0xE
    bnez        $v0, .L800C3860
    nop
    lui         $at, 0x8008
    sh          $zero, 0x7AC2($at)
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800C3768
