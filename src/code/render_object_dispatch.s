.text
.align 2
.set noreorder
.globl render_object_dispatch
.ent render_object_dispatch
render_object_dispatch:
    sw          $ra, 0x34($sp)
    sw          $fp, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    swc1        $f27, 0x50($sp)
    swc1        $f26, 0x54($sp)
    swc1        $f25, 0x48($sp)
    swc1        $f24, 0x4C($sp)
    swc1        $f23, 0x40($sp)
    swc1        $f22, 0x44($sp)
    swc1        $f21, 0x38($sp)
    swc1        $f20, 0x3C($sp)
    jal         func_80032E00
    addiu       $a1, $zero, 0xA0
    addu        $a0, $zero, $zero
    lui         $at, 0x8006
    sw          $v0, 0x5564($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x140
    addu        $a0, $zero, $zero
    lui         $at, 0x8006
    sw          $v0, 0x5568($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0xA0
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, 0x4FC0($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0xA0
    addu        $s4, $zero, $zero
    lui         $fp, 0x8009
    addiu       $fp, $fp, -0x6A98
    lui         $s7, 0x8009
    addiu       $s7, $s7, -0x63E0
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x4DE8
    addiu       $s6, $s5, 0x20
    lui         $at, 0x8008
    sw          $v0, 0x7918($at)
    addu        $a0, $zero, $zero
.L80012878:
    jal         func_80032E00
    addiu       $a1, $zero, 0x140
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x140
    sll         $s0, $s4, 24
    sra         $s0, $s0, 22
    addu        $s3, $s0, $fp
    jal         func_80032E00
    sw          $v0, 0x0($s3)
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x140
    addu        $s2, $s0, $s7
    jal         func_80032E00
    sw          $v0, 0x0($s2)
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x140
    addu        $s1, $s0, $s5
    jal         func_80032E00
    sw          $v0, 0x0($s1)
    addu        $s0, $s0, $s6
    sw          $v0, 0x0($s0)
    lw          $a0, 0x0($s3)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x140
    lw          $a0, 0x0($s2)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x140
    lw          $a0, 0x0($s1)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x140
    lw          $a0, 0x0($s0)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x140
    addiu       $v0, $s4, 0x1
    addu        $s4, $v0, $zero
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slti        $v0, $v0, 0x8
    bnez        $v0, .L80012878
    addu        $a0, $zero, $zero
    lui         $a0, 0x8006
    lw          $a0, 0x5564($a0)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0xA0
    lui         $a0, 0x8006
    lw          $a0, 0x5568($a0)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x140
    lui         $a0, 0x8008
    lw          $a0, 0x4FC0($a0)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0xA0
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x410
    jal         func_80035674
    nop
    addu        $s4, $v0, $zero
    andi        $s0, $s4, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addiu       $a1, $zero, 0x22
    addu        $s3, $v0, $zero
    lhu         $a1, 0x0($s3)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x6
    lhu         $a2, 0x0($s3)
    addu        $a0, $v0, $zero
    addiu       $a1, $s3, 0x6
    lui         $at, 0x8006
    sw          $a0, 0x5540($at)
    jal         func_8002E17C
    addiu       $a2, $a2, -0x6
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addiu       $a1, $zero, 0x21
    addu        $s3, $v0, $zero
    lw          $a1, 0x0($s3)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x8
    lw          $a2, 0x0($s3)
    addu        $a0, $v0, $zero
    addiu       $a1, $s3, 0x8
    lui         $at, 0x8006
    sw          $a0, 0x553C($at)
    jal         func_8002E17C
    addiu       $a2, $a2, -0x8
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addiu       $a1, $zero, 0x22
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addiu       $a1, $zero, 0x21
    lui         $v1, 0x8008
    lh          $v1, 0x7A68($v1)
    beqz        $v1, .L80012A44
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80012A30
    addiu       $v0, $zero, 0x3
    addiu       $s1, $zero, 0x27
    j .L80012A4C
    addiu       $s2, $zero, 0x28
.L80012A30:
    bne         $v1, $v0, .L80012A48
    addiu       $s1, $zero, 0x25
    addiu       $s1, $zero, 0x29
    j .L80012A4C
    addiu       $s2, $zero, 0x2A
.L80012A44:
    addiu       $s1, $zero, 0x25
.L80012A48:
    addiu       $s2, $zero, 0x26
.L80012A4C:
    andi        $s0, $s4, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addu        $a1, $s2, $zero
    addu        $s3, $v0, $zero
    lhu         $a1, 0x0($s3)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x6
    lhu         $a2, 0x0($s3)
    addu        $a0, $v0, $zero
    addiu       $a1, $s3, 0x6
    lui         $at, 0x8006
    sw          $a0, 0x5548($at)
    jal         func_8002E17C
    addiu       $a2, $a2, -0x6
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addu        $a1, $s1, $zero
    addu        $s3, $v0, $zero
    lw          $a1, 0x0($s3)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x8
    lw          $a2, 0x0($s3)
    addu        $a0, $v0, $zero
    addiu       $a1, $s3, 0x8
    lui         $at, 0x8006
    sw          $a0, 0x5544($at)
    jal         func_8002E17C
    addiu       $a2, $a2, -0x8
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addu        $a1, $s2, $zero
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addu        $a1, $s1, $zero
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addiu       $a1, $zero, 0x24
    addu        $s3, $v0, $zero
    lhu         $a1, 0x0($s3)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x6
    lhu         $a2, 0x0($s3)
    addu        $a0, $v0, $zero
    addiu       $a1, $s3, 0x6
    lui         $at, 0x8006
    sw          $a0, 0x5550($at)
    jal         func_8002E17C
    addiu       $a2, $a2, -0x6
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addiu       $a1, $zero, 0x23
    addu        $s3, $v0, $zero
    lw          $a1, 0x0($s3)
    lui         $at, 0x8000
    lwc1        $f24, 0x8E0($at)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $a1, -0x8
    lw          $a2, 0x0($s3)
    addu        $a0, $v0, $zero
    addiu       $a1, $s3, 0x8
    lui         $at, 0x8006
    sw          $a0, 0x554C($at)
    jal         func_8002E17C
    addiu       $a2, $a2, -0x8
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addiu       $a1, $zero, 0x24
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addiu       $a1, $zero, 0x23
    lui         $a1, 0x8006
    lw          $a1, 0x5564($a1)
    lui         $a3, 0x8008
    lw          $a3, 0x5804($a3)
    lui         $v0, 0x8006
    lhu         $v0, 0x5554($v0)
    lui         $t0, 0x8008
    lw          $t0, 0x5808($t0)
    lui         $v1, 0x8006
    lhu         $v1, 0x5556($v1)
    lui         $t1, 0x8008
    lw          $t1, 0x5810($t1)
    lui         $a0, 0x8006
    lhu         $a0, 0x5558($a0)
    lui         $at, 0x8008
    sw          $a1, 0x7704($at)
    sb          $zero, 0xC($a1)
    lui         $a2, 0x8008
    lw          $a2, 0x7704($a2)
    addu        $v0, $v0, $a3
    addu        $v1, $v1, $t0
    addu        $a0, $a0, $t1
    sh          $v0, 0x0($a1)
    sh          $v1, 0x2($a1)
    sh          $a0, 0x4($a1)
    sb          $zero, 0xD($a2)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    addiu       $t5, $zero, 0x7F
    sb          $t5, 0xE($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    addiu       $t4, $zero, 0xFF
    sb          $t4, 0xF($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    lui         $a3, 0x8006
    lhu         $a3, 0x5554($a3)
    lui         $v1, 0x8008
    lw          $v1, 0x5804($v1)
    lui         $t0, 0x8008
    lw          $t0, 0x5808($t0)
    lui         $a0, 0x8006
    lhu         $a0, 0x5556($a0)
    lui         $t1, 0x8008
    lw          $t1, 0x5810($t1)
    lui         $a1, 0x8006
    lhu         $a1, 0x5558($a1)
    sb          $zero, 0x1C($v0)
    lui         $a2, 0x8008
    lw          $a2, 0x7704($a2)
    subu        $v1, $v1, $a3
    addu        $a0, $a0, $t0
    addu        $a1, $a1, $t1
    sh          $zero, 0x8($v0)
    sh          $zero, 0xA($v0)
    sh          $v1, 0x10($v0)
    sh          $a0, 0x12($v0)
    sh          $a1, 0x14($v0)
    sb          $zero, 0x1D($a2)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    sb          $t5, 0x1E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    sb          $t4, 0x1F($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    lui         $a3, 0x8008
    lw          $a3, 0x5804($a3)
    lui         $v1, 0x8006
    lhu         $v1, 0x5554($v1)
    lui         $t0, 0x8006
    lhu         $t0, 0x5556($t0)
    lui         $a0, 0x8008
    lw          $a0, 0x5808($a0)
    lui         $t1, 0x8008
    lw          $t1, 0x5810($t1)
    lui         $a1, 0x8006
    lhu         $a1, 0x5558($a1)
    addiu       $t2, $zero, 0x40
    sb          $zero, 0x2C($v0)
    lui         $a2, 0x8008
    lw          $a2, 0x7704($a2)
    addu        $v1, $v1, $a3
    subu        $a0, $a0, $t0
    addu        $a1, $a1, $t1
    sh          $t2, 0x18($v0)
    sh          $zero, 0x1A($v0)
    sh          $v1, 0x20($v0)
    sh          $a0, 0x22($v0)
    sh          $a1, 0x24($v0)
    sb          $zero, 0x2D($a2)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    sb          $t5, 0x2E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    addiu       $t1, $zero, 0x20
    sb          $t4, 0x2F($v0)
    lui         $a1, 0x8008
    lw          $a1, 0x7704($a1)
    lui         $a2, 0x8006
    lhu         $a2, 0x5554($a2)
    lui         $v0, 0x8008
    lw          $v0, 0x5804($v0)
    lui         $a3, 0x8006
    lhu         $a3, 0x5556($a3)
    lui         $v1, 0x8008
    lw          $v1, 0x5808($v1)
    lui         $t0, 0x8008
    lw          $t0, 0x5810($t0)
    lui         $a0, 0x8006
    lhu         $a0, 0x5558($a0)
    subu        $v0, $v0, $a2
    subu        $v1, $v1, $a3
    addu        $a0, $a0, $t0
    sh          $zero, 0x28($a1)
    sh          $t1, 0x2A($a1)
    sh          $v0, 0x30($a1)
    sh          $v1, 0x32($a1)
    sh          $a0, 0x34($a1)
    sb          $zero, 0x3C($a1)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    sb          $zero, 0x3D($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    sb          $t5, 0x3E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    sb          $t4, 0x3F($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7704($v0)
    lui         $at, 0x8000
    lwc1        $f22, 0x8E4($at)
    lui         $t3, 0x8008
    lw          $t3, 0x4FC0($t3)
    lh          $v1, 0x8($v0)
    lh          $a0, 0xA($v0)
    lh          $a1, 0x18($v0)
    lh          $a2, 0x1A($v0)
    lh          $a3, 0x28($v0)
    lh          $t0, 0x2A($v0)
    sh          $t2, 0x38($v0)
    sh          $t1, 0x3A($v0)
    lh          $t1, 0x38($v0)
    lh          $t2, 0x3A($v0)
    lui         $at, 0x8008
    sw          $t3, 0x7A84($at)
    sll         $v1, $v1, 6
    sll         $a0, $a0, 6
    sll         $a1, $a1, 6
    sll         $a2, $a2, 6
    sll         $a3, $a3, 6
    sll         $t0, $t0, 6
    sll         $t1, $t1, 6
    sll         $t2, $t2, 6
    sh          $v1, 0x8($v0)
    sh          $a0, 0xA($v0)
    sh          $a1, 0x18($v0)
    sh          $a2, 0x1A($v0)
    sh          $a3, 0x28($v0)
    sh          $t0, 0x2A($v0)
    sh          $t1, 0x38($v0)
    sh          $t2, 0x3A($v0)
    sb          $t5, 0xC($t3)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    addiu       $a3, $zero, 0xA
    addiu       $a0, $zero, 0xCB
    sh          $a3, 0x0($t3)
    sh          $a0, 0x2($t3)
    sh          $zero, 0x4($t3)
    sb          $zero, 0xD($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $zero, 0xE($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $t4, 0xF($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $zero, 0x1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7A84($v1)
    addiu       $a1, $zero, -0xA
    sh          $zero, 0x8($v0)
    sh          $zero, 0xA($v0)
    sh          $zero, 0x10($v0)
    sh          $a0, 0x12($v0)
    sh          $a1, 0x14($v0)
    sb          $zero, 0x1D($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    addiu       $a2, $zero, -0x7F
    sb          $a2, 0x1E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $t4, 0x1F($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $a2, 0x2C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7A84($v1)
    sh          $zero, 0x18($v0)
    sh          $zero, 0x1A($v0)
    sh          $a1, 0x20($v0)
    sh          $a0, 0x22($v0)
    sh          $zero, 0x24($v0)
    sb          $zero, 0x2D($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $zero, 0x2E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $t4, 0x2F($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sh          $zero, 0x28($v0)
    sh          $zero, 0x2A($v0)
    sh          $zero, 0x30($v0)
    sh          $a0, 0x32($v0)
    sh          $a3, 0x34($v0)
    sb          $zero, 0x3C($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $zero, 0x3D($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $t5, 0x3E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $t4, 0x3F($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7A84($v1)
    sb          $zero, 0x4C($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x7A84($a0)
    addiu       $v0, $zero, 0xD5
    sh          $zero, 0x38($v1)
    sh          $zero, 0x3A($v1)
    sh          $zero, 0x40($v1)
    sh          $v0, 0x42($v1)
    sh          $zero, 0x44($v1)
    sb          $t5, 0x4D($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $zero, 0x4E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $t4, 0x4F($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7A84($v1)
    sb          $zero, 0x5C($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x7A84($a0)
    addiu       $v0, $zero, 0xC1
    sh          $zero, 0x48($v1)
    sh          $zero, 0x4A($v1)
    sh          $zero, 0x50($v1)
    sh          $v0, 0x52($v1)
    sh          $zero, 0x54($v1)
    sb          $a2, 0x5D($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $zero, 0x5E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sb          $t4, 0x5F($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A84($v0)
    sh          $zero, 0x58($v0)
    lui         $v1, 0x8006
    lw          $v1, 0x5568($v1)
    addiu       $s0, $zero, 0xFF
    sh          $zero, 0x5A($v0)
    lui         $at, 0x8009
    sh          $zero, -0x4C36($at)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    lui         $at, 0x8008
    sw          $v1, 0x57FC($at)
.L80012FE4:
    lui         $a0, 0x8009
    lh          $a0, -0x4C36($a0)
    jal         func_8002E828
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5560($at)
    lui         $a0, 0x8009
    lh          $a0, -0x4C36($a0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020502  # mul.s       $f20, $f0, $f2
    jal         func_8002E848
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5560($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020202  # mul.s       $f8, $f0, $f2
    .word       0x4600A087  # neg.s       $f2, $f20
    .word       0x46181182  # mul.s       $f6, $f2, $f24
    lui         $v0, 0x8009
    lhu         $v0, -0x4C36($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x57FC($a0)
    .word       0x46164102  # mul.s       $f4, $f8, $f22
    addiu       $v0, $v0, 0x200
    sll         $v1, $v1, 4
    addu        $v1, $v1, $a0
    lui         $at, 0x8009
    sh          $v0, -0x4C36($at)
    addiu       $v0, $zero, 0xC8
    sh          $v0, 0x2($v1)
    .word       0x46184002  # mul.s       $f0, $f8, $f24
    .word       0x4600320D  # trunc.w.s   $f8, $f6
    .word       0x44094000  # mfc1        $t1, $f8
    .word       0x4600218D  # trunc.w.s   $f6, $f4
    .word       0x44063000  # mfc1        $a2, $f6
    sb          $a2, 0xC($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x57FC($a0)
    .word       0x46161082  # mul.s       $f2, $f2, $f22
    sh          $t1, 0x4($v1)
    .word       0x4600010D  # trunc.w.s   $f4, $f0
    .word       0x44072000  # mfc1        $a3, $f4
    sh          $a3, 0x0($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $a0
    sb          $zero, 0xD($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57FC($v1)
    .word       0x4600100D  # trunc.w.s   $f0, $f2
    .word       0x44080000  # mfc1        $t0, $f0
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $t0, 0xE($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57FC($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $s0, 0xF($v0)
    lui         $a1, 0x8008
    lw          $a1, 0x5A1C($a1)
    lui         $v0, 0x8008
    lw          $v0, 0x57FC($v0)
    sll         $v1, $a1, 4
    addu        $v1, $v1, $v0
    sb          $a2, 0x8C($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    lui         $a2, 0x8008
    lw          $a2, 0x57FC($a2)
    .word       0x44850000  # mtc1        $a1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000000  # add.s       $f0, $f0, $f0
    sh          $zero, 0xA($v1)
    sh          $a3, 0x80($v1)
    sh          $zero, 0x82($v1)
    sh          $t1, 0x84($v1)
    sll         $a0, $a0, 4
    addu        $a0, $a0, $a2
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x8($v1)
    sb          $zero, 0x8D($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57FC($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $t0, 0x8E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57FC($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $s0, 0x8F($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    lui         $a2, 0x8008
    lw          $a2, 0x57FC($a2)
    addiu       $v0, $zero, 0x20
    sll         $a0, $v1, 4
    addu        $a0, $a0, $a2
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    addiu       $v1, $v1, 0x1
    .word       0x46000000  # add.s       $f0, $f0, $f0
    lui         $at, 0x8008
    sw          $v1, 0x5A1C($at)
    slti        $v1, $v1, 0x8
    sh          $v0, 0x8A($a0)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    bnez        $v1, .L80012FE4
    sh          $v0, 0x88($a0)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
.L800131E0:
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    sll         $a0, $v0, 4
    addu        $a0, $a0, $a2
    lh          $v1, 0x8($a0)
    lh          $a1, 0xA($a0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A1C($at)
    slti        $v0, $v0, 0x10
    sll         $v1, $v1, 6
    sll         $a1, $a1, 6
    sh          $v1, 0x8($a0)
    bnez        $v0, .L800131E0
    sh          $a1, 0xA($a0)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6B00
    addu        $s2, $v0, $zero
    lui         $at, 0x8000
    lwc1        $f26, 0x8E8($at)
    lui         $at, 0x8000
    lwc1        $f25, 0x8EC($at)
    lwc1        $f24, 0x8F0($at)
    lui         $at, 0x8000
    lwc1        $f23, 0x8F4($at)
    lwc1        $f22, 0x8F8($at)
    addiu       $s0, $zero, 0xFF
    addiu       $v0, $zero, 0x1F
    sh          $v0, 0x0($s2)
    addiu       $v0, $zero, 0x1C
    lui         $at, 0x8009
    sh          $v0, -0x6AFE($at)
    addiu       $v0, $zero, 0x19
    lui         $at, 0x8009
    sh          $v0, -0x6AFC($at)
    addiu       $v0, $zero, 0x16
    lui         $at, 0x8009
    sh          $v0, -0x6AFA($at)
    addiu       $v0, $zero, 0x13
    lui         $at, 0x8009
    sh          $v0, -0x6AF8($at)
    addiu       $v0, $zero, 0x10
    lui         $at, 0x8009
    sh          $v0, -0x6AF6($at)
    addiu       $v0, $zero, 0xD
    lui         $at, 0x8009
    sh          $v0, -0x6AF4($at)
    addiu       $v0, $zero, 0xA
    lui         $at, 0x8009
    sh          $v0, -0x6AF2($at)
    lui         $at, 0x8008
    sw          $zero, 0x5A34($at)
.L800132B0:
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x6A98($at)
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x6AFE
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    addiu       $v0, $zero, 0x400
    lui         $at, 0x8009
    sh          $v0, -0x4C36($at)
    lui         $at, 0x8008
    sw          $v1, 0x57F8($at)
.L800132EC:
    lui         $a0, 0x8009
    lh          $a0, -0x4C36($a0)
    jal         func_8002E828
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5560($at)
    lui         $a0, 0x8009
    lh          $a0, -0x4C36($a0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020502  # mul.s       $f20, $f0, $f2
    jal         func_8002E848
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5560($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A34($v1)
    sll         $a0, $a0, 4
    addu        $a0, $a0, $v0
    sll         $v1, $v1, 1
    .word       0x46020202  # mul.s       $f8, $f0, $f2
    addu        $v1, $v1, $s2
    sh          $zero, 0x0($a0)
    lh          $v0, 0x0($v1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46004002  # mul.s       $f0, $f8, $f0
    nop
    .word       0x461A4082  # mul.s       $f2, $f8, $f26
    .word       0x4600010D  # trunc.w.s   $f4, $f0
    .word       0x44022000  # mfc1        $v0, $f4
    sh          $v0, 0x2($a0)
    lh          $v0, 0x0($v1)
    sb          $zero, 0xC($a0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x4600A002  # mul.s       $f0, $f20, $f0
    .word       0x4600110D  # trunc.w.s   $f4, $f2
    .word       0x44072000  # mfc1        $a3, $f4
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $a1, 0x8008
    lw          $a1, 0x57F8($a1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $a1
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    .word       0x461AA002  # mul.s       $f0, $f20, $f26
    sh          $v1, 0x4($a0)
    sb          $a3, 0xD($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44061000  # mfc1        $a2, $f2
    sb          $a2, 0xE($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $s0, 0xF($v0)
    lui         $a1, 0x8008
    lw          $a1, 0x5A34($a1)
    addiu       $v0, $zero, 0x7
    subu        $v0, $v0, $a1
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46381082  # mul.d       $f2, $f2, $f24
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    .word       0x44840000  # mtc1        $a0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    .word       0x46360002  # mul.d       $f0, $f0, $f22
    sll         $a0, $a0, 4
    sll         $a1, $a1, 1
    addu        $a1, $a1, $s1
    addu        $a0, $a0, $v0
    addiu       $v0, $zero, 0x14
    sh          $v0, 0x50($a0)
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44022000  # mfc1        $v0, $f4
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    sh          $v0, 0x8($a0)
    sh          $v1, 0xA($a0)
    lh          $v0, 0x0($a1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46004002  # mul.s       $f0, $f8, $f0
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x52($a0)
    lh          $v0, 0x0($a1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x4600A002  # mul.s       $f0, $f20, $f0
    sb          $zero, 0x5C($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $a1, 0x8008
    lw          $a1, 0x57F8($a1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $a1
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    sh          $v1, 0x54($a0)
    sb          $a3, 0x5D($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $a2, 0x5E($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $s0, 0x5F($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A34($v1)
    addiu       $v0, $zero, 0x6
    subu        $v0, $v0, $v1
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46381082  # mul.d       $f2, $f2, $f24
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    lui         $v0, 0x8009
    lhu         $v0, -0x4C36($v0)
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    addiu       $v0, $v0, -0x200
    .word       0x46360002  # mul.d       $f0, $f0, $f22
    lui         $at, 0x8009
    sh          $v0, -0x4C36($at)
    addiu       $v0, $v1, 0x1
    sll         $v1, $v1, 4
    lui         $at, 0x8008
    sw          $v0, 0x5A1C($at)
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44062000  # mfc1        $a2, $f4
    lui         $a0, 0x8008
    lw          $a0, 0x57F8($a0)
    slti        $v0, $v0, 0x5
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44051000  # mfc1        $a1, $f2
    addu        $v1, $v1, $a0
    sh          $a2, 0x58($v1)
    bnez        $v0, .L800132EC
    sh          $a1, 0x5A($v1)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
.L8001359C:
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    lbu         $v1, 0xC($v0)
    lhu         $a1, 0x0($v0)
    lhu         $a2, 0x2($v0)
    lhu         $a0, 0x4($v0)
    sb          $v1, 0xAC($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    lui         $a3, 0x8008
    lw          $a3, 0x57F8($a3)
    negu        $a0, $a0
    sh          $a1, 0xA0($v0)
    sh          $a2, 0xA2($v0)
    sh          $a0, 0xA4($v0)
    sll         $v1, $v1, 4
    addu        $v1, $v1, $a3
    lbu         $v0, 0xD($v1)
    sb          $v0, 0xAD($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    sll         $v1, $v1, 4
    addu        $v1, $v1, $v0
    lbu         $v0, 0xE($v1)
    negu        $v0, $v0
    sb          $v0, 0xAE($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $s0, 0xAF($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x57F8($a0)
    lui         $at, 0x8008
    lwc1        $f2, 0x5A34($at)
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46381082  # mul.d       $f2, $f2, $f24
    sll         $v1, $v0, 4
    addu        $v1, $v1, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    lhu         $a0, 0x50($v1)
    lhu         $a1, 0x52($v1)
    lhu         $v0, 0x54($v1)
    lbu         $a2, 0x5C($v1)
    .word       0x46360002  # mul.d       $f0, $f0, $f22
    negu        $v0, $v0
    sh          $a0, 0xF0($v1)
    sh          $a1, 0xF2($v1)
    sh          $v0, 0xF4($v1)
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44022000  # mfc1        $v0, $f4
    sh          $v0, 0xA8($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0xAA($v1)
    sb          $a2, 0xFC($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    lbu         $v1, 0x5D($v0)
    sb          $v1, 0xFD($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    sll         $v1, $v1, 4
    addu        $v1, $v1, $v0
    lbu         $v0, 0x5E($v1)
    negu        $v0, $v0
    sb          $v0, 0xFE($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sb          $s0, 0xFF($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    addiu       $t0, $v0, 0x1
    .word       0x44881000  # mtc1        $t0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46381082  # mul.d       $f2, $f2, $f24
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46360002  # mul.d       $f0, $f0, $f22
    addiu       $v1, $v0, 0x1
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    sw          $v1, 0x5A1C($at)
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44062000  # mfc1        $a2, $f4
    lui         $a0, 0x8008
    lw          $a0, 0x57F8($a0)
    slti        $v1, $v1, 0x5
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44051000  # mfc1        $a1, $f2
    addu        $v0, $v0, $a0
    sh          $a2, 0xF8($v0)
    bnez        $v1, .L8001359C
    sh          $a1, 0xFA($v0)
    lui         $at, 0x8008
    sw          $t0, 0x5A34($at)
    slti        $v0, $t0, 0x7
    bnez        $v0, .L800132B0
    addiu       $v0, $zero, 0x7
    subu        $v0, $v0, $t0
    lui         $at, 0x8000
    lwc1        $f5, 0x8FC($at)
    lwc1        $f4, 0x900($at)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46241082  # mul.d       $f2, $f2, $f4
    lui         $at, 0x8000
    lwc1        $f7, 0x904($at)
    lwc1        $f6, 0x908($at)
    addiu       $v0, $zero, 0x6
    subu        $v0, $v0, $t0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    lui         $v0, 0x8009
    lw          $v0, -0x6A98($v0)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    addu        $a2, $v0, $zero
    lui         $at, 0x8008
    sw          $a2, 0x57F8($at)
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44082000  # mfc1        $t0, $f4
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44071000  # mfc1        $a3, $f2
.L80013804:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    .word       0x44840000  # mtc1        $a0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    sll         $v1, $a0, 4
    addu        $v1, $v1, $a2
    addiu       $a0, $a0, 0x1
    lui         $at, 0x8008
    sw          $a0, 0x5A1C($at)
    slti        $a0, $a0, 0x5
    sh          $t0, 0x8($v1)
    sh          $a3, 0x58($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0xA($v1)
    bnez        $a0, .L80013804
    sh          $v0, 0x5A($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    lui         $at, 0x8000
    lwc1        $f5, 0x90C($at)
    lwc1        $f4, 0x910($at)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46241082  # mul.d       $f2, $f2, $f4
    addiu       $v0, $v0, 0x1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    lui         $t0, 0x8008
    lw          $t0, 0x57F8($t0)
    lui         $at, 0x8000
    lwc1        $f7, 0x914($at)
    lwc1        $f6, 0x918($at)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44072000  # mfc1        $a3, $f4
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44061000  # mfc1        $a2, $f2
.L800138B4:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    .word       0x44840000  # mtc1        $a0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    sll         $v1, $a0, 4
    addu        $v1, $v1, $t0
    addiu       $a0, $a0, 0x1
    lui         $at, 0x8008
    sw          $a0, 0x5A1C($at)
    slti        $a0, $a0, 0x5
    sh          $a3, 0xA8($v1)
    sh          $a2, 0xF8($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0xAA($v1)
    bnez        $a0, .L800138B4
    sh          $v0, 0xFA($v1)
    lui         $at, 0x8008
    sw          $zero, 0x5A34($at)
    lui         $a3, 0x8009
    addiu       $a3, $a3, -0x6A98
.L80013910:
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a3
    lw          $v0, 0x0($v0)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    addu        $a2, $v0, $zero
    lui         $at, 0x8008
    sw          $a2, 0x57F8($at)
.L80013938:
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    sll         $v0, $v1, 4
    addu        $v0, $v0, $a2
    lh          $a0, 0x8($v0)
    lh          $a1, 0xA($v0)
    addiu       $v1, $v1, 0x1
    lui         $at, 0x8008
    sw          $v1, 0x5A1C($at)
    slti        $v1, $v1, 0x14
    sll         $a0, $a0, 6
    sll         $a1, $a1, 6
    sh          $a0, 0x8($v0)
    bnez        $v1, .L80013938
    sh          $a1, 0xA($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    slti        $v0, $v0, 0x7
    bnez        $v0, .L80013910
    nop
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    lwc1        $f27, 0x50($sp)
    lwc1        $f26, 0x54($sp)
    lwc1        $f25, 0x48($sp)
    lwc1        $f24, 0x4C($sp)
    lwc1        $f23, 0x40($sp)
    lwc1        $f22, 0x44($sp)
    lwc1        $f21, 0x38($sp)
    lwc1        $f20, 0x3C($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end render_object_dispatch
