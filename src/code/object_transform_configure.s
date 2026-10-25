.text
.align 2
.set noreorder
.globl object_transform_configure
.ent object_transform_configure
object_transform_configure:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a2, $zero
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7FF0
    addiu       $a2, $zero, 0x80
    sw          $ra, 0x1C($sp)
    jal         func_80033308
    addu        $a3, $zero, $zero
    lhu         $v0, 0x206($s1)
    sb          $s0, 0x240($s1)
    andi        $s0, $s0, 0xFF
    ori         $v0, $v0, 0x400
    sh          $v0, 0x206($s1)
    slti        $v0, $s0, 0x2
    beqz        $v0, .L8000CF88
    nop
    bltz        $s0, .L8000CF88
    addu        $a0, $zero, $zero
.L8000CE70:
    lhu         $v0, 0x1FC($s1)
    lhu         $v1, 0x1F8($s1)
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $v1, 0x7FF0($at)
    lhu         $v0, 0x1FE($s1)
    lhu         $v1, 0x1FA($s1)
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $v1, 0x7FF2($at)
    lhu         $v1, 0xA($s1)
    lhu         $v0, 0x1FC($s1)
    addiu       $v1, $v1, -0x1
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v1, -0x8000($at)
    lhu         $v0, 0x1FE($s1)
    lhu         $v1, 0x1FA($s1)
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v1, -0x7FFE($at)
    lhu         $v0, 0x1FC($s1)
    lhu         $v1, 0x1F8($s1)
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v1, -0x7FF0($at)
    lhu         $v1, 0xC($s1)
    lhu         $v0, 0x1FE($s1)
    addiu       $v1, $v1, -0x1
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v1, -0x7FEE($at)
    lhu         $v1, 0xA($s1)
    lhu         $v0, 0x1FC($s1)
    addiu       $v1, $v1, -0x1
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v1, -0x7FE0($at)
    lhu         $v1, 0xC($s1)
    lhu         $v0, 0x1FE($s1)
    addiu       $v1, $v1, -0x1
    srl         $v0, $v0, 1
    subu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v1, -0x7FDE($at)
    addiu       $a0, $a0, 0x40
    sltiu       $v0, $a0, 0x80
    bnez        $v0, .L8000CE70
    sll         $v0, $s2, 24
    bgez        $v0, .L8000CF84
    sb          $s2, 0x242($s1)
    addiu       $v0, $zero, 0xFF
    j .L8000CF88
    sb          $v0, 0x241($s1)
.L8000CF84:
    sb          $zero, 0x241($s1)
.L8000CF88:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_transform_configure
