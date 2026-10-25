.text
.align 2
.set noreorder
.globl display_texture_cache_initialize
.ent display_texture_cache_initialize
display_texture_cache_initialize:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x1C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s0, 0x18($sp)
    lhu         $a1, 0x0($s1)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $zero, -0x4F90($at)
    lui         $at, 0x8008
    sw          $zero, 0x5294($at)
    lui         $at, 0x8009
    sh          $v0, -0x6AEA($at)
    lui         $at, 0x8008
    sw          $zero, 0x790C($at)
    lui         $v1, 0x8008
    lw          $v1, 0x790C($v1)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7908
    sw          $v1, 0x0($v0)
    lui         $at, 0x8008
    sw          $zero, 0x6174($at)
    lui         $v1, 0x8008
    lw          $v1, 0x6174($v1)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x6170
    sw          $v1, 0x0($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $a0, -0x5F98($at)
    lui         $at, 0x8009
    sh          $zero, -0x502C($at)
    lui         $at, 0x8009
    sh          $a1, -0x7250($at)
    jal         func_8004EDA8
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x4C2C
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5294($at)
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    lhu         $v0, 0x6($s1)
    addiu       $s0, $s2, -0x4
    addu        $a0, $s0, $zero
    jal         func_8000CCC8
    sh          $v0, 0x0($s2)
    lhu         $a1, 0x0($s1)
    addu        $a0, $zero, $zero
    jal         func_80033174
    addiu       $a2, $zero, 0x248
    lui         $at, 0x8006
    sw          $v0, 0x4BA0($at)
    addiu       $v0, $zero, 0xC
    lui         $at, 0x8009
    sh          $v0, -0x4A2A($at)
    jal         func_8000C8F8
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0x140
    sw          $zero, -0x4($s2)
    lui         $at, 0x8009
    sh          $v0, -0x4A34($at)
    addiu       $v0, $zero, 0xF0
    lui         $at, 0x8009
    sw          $zero, -0x49F8($at)
    lui         $at, 0x8009
    sh          $zero, -0x4A38($at)
    lui         $at, 0x8009
    sh          $zero, -0x4A36($at)
    lui         $at, 0x8009
    sh          $v0, -0x4A32($at)
    lui         $at, 0x8009
    sh          $zero, -0x4A2C($at)
    lui         $at, 0x8009
    sb          $zero, -0x4C2A($at)
    lui         $at, 0x8009
    sb          $zero, -0x4C29($at)
    lui         $at, 0x8009
    sb          $zero, -0x4C28($at)
    lui         $at, 0x8009
    sw          $zero, -0x4A40($at)
    jal         func_8000CC18
    addu        $a0, $s0, $zero
    lw          $v0, 0x14($s1)
    addu        $a0, $zero, $zero
    sll         $a1, $v0, 4
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    sw          $v0, 0xA78($at)
    jal         func_800337CC
    addiu       $a2, $zero, 0x10
    addu        $a0, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, 0xA78($v1)
    addiu       $a1, $zero, 0x400
    lui         $at, 0x8009
    sw          $v0, -0x4CB0($at)
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sw          $v0, -0x4CAC($at)
    jal         func_800337CC
    addiu       $a2, $zero, 0x10
    addu        $a0, $zero, $zero
    lui         $a1, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x4F44($at)
    jal         func_800337CC
    addiu       $a2, $zero, 0x10
    lui         $v1, 0x8006
    lw          $v1, 0x4B58($v1)
    lui         $at, 0x8008
    sw          $v0, 0x5038($at)
    lui         $v0, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x5068($at)
    bnez        $v1, .L8000B584
    addiu       $v0, $zero, 0x1
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5D18
    addu        $a0, $s0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x7900
    lui         $at, 0x8006
    sw          $v0, 0x4B58($at)
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    addiu       $a0, $zero, 0x4
    addu        $a1, $s0, $zero
    jal         func_8004D098
    addu        $a2, $zero, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5A00
    addu        $a0, $s0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x79D4
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    addiu       $a0, $zero, 0x9
    addu        $a1, $s0, $zero
    jal         func_8004D098
    addu        $a2, $zero, $zero
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4C68
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7754
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x5C00
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x47
    lui         $a2, 0x8001
    addiu       $a2, $a2, -0x462C
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x5FB0
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x14
    addu        $a3, $zero, $zero
    jal         func_80045B98
    sw          $v0, 0x14($sp)
    jal         func_8004DE18
    addu        $a0, $s0, $zero
.L8000B584:
    lui         $v1, 0x8005
    addiu       $v1, $v1, 0xEA8
    lui         $a1, 0x8008
    lw          $a1, 0x4F44($a1)
    lui         $v0, 0x8005
    addiu       $v0, $v0, 0xF78
    subu        $v0, $v0, $v1
    lui         $at, 0x8006
    sw          $v1, 0x4B68($at)
    lui         $at, 0x8006
    sw          $v0, 0x4B6C($at)
    lui         $at, 0x8006
    sw          $a1, 0x4B80($at)
    jal         func_80008DF8
    addiu       $a0, $zero, 0x2
    lui         $a0, 0x8009
    lw          $a0, -0x79E0($a0)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5030
    sw          $a0, 0x0($v1)
    lui         $v1, 0x8009
    lw          $v1, -0x79E0($v1)
    sw          $v0, 0x238($s2)
    lui         $at, 0x8008
    sw          $zero, 0x5D38($at)
    lui         $at, 0x8008
    sw          $zero, 0x5D3C($at)
    lui         $at, 0x8008
    sw          $v1, 0x5034($at)
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end display_texture_cache_initialize
