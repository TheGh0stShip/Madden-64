.text
.align 2
.set noreorder
.globl render_system_initialize
.ent render_system_initialize
render_system_initialize:
    lui         $v0, 0x8006
    lh          $v0, 0x550C($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    bnez        $v0, .L8001146C
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8006
    lh          $v0, 0x5502($v0)
    bnez        $v0, .L80011474
    nop
    jal         func_800114D0
    addiu       $s0, $zero, 0x1
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    jal         func_8000D5BC
    addu        $a2, $zero, $zero
    ori         $a0, $zero, 0xFFFE
    lui         $at, 0x8006
    sw          $v0, 0x5524($at)
    jal         func_8000B6F8
    addiu       $a1, $zero, 0x3
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    lui         $at, 0x8006
    sw          $a0, 0x5528($at)
    lui         $at, 0x8006
    sh          $s0, 0x5500($at)
    jal         func_8000C940
    addu        $a2, $zero, $zero
    lui         $a0, 0x8006
    lw          $a0, 0x5528($a0)
    addiu       $a1, $zero, 0x140
    jal         func_8000C964
    addiu       $a2, $zero, 0xF0
    lui         $a0, 0x8006
    lw          $a0, 0x5528($a0)
    jal         func_8000C8AC
    nop
    lui         $a0, 0x8006
    lw          $a0, 0x5528($a0)
    lui         $a1, 0x8006
    lw          $a1, 0x5524($a1)
    jal         func_8000C898
    nop
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x8
    lui         $a0, 0x8006
    lw          $a0, 0x5524($a0)
    addiu       $a1, $zero, 0xE
    addu        $a2, $v0, $zero
    addiu       $v0, $zero, 0x457
    lui         $at, 0x8009
    sw          $a2, -0x4CD4($at)
    jal         func_8000D740
    sh          $v0, 0x0($a2)
    lui         $a1, 0x8009
    lw          $a1, -0x4CD4($a1)
    lui         $at, 0x8008
    sw          $v0, 0x774C($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a0, 0x8006
    lw          $a0, 0x5528($a0)
    addu        $a1, $zero, $zero
    jal         func_8000CB78
    addu        $a2, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, 0x5290($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    lui         $at, 0x8006
    sh          $s0, 0x5502($at)
    beq         $v1, $v0, .L80011474
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x8
    addiu       $a0, $zero, 0x24
    addiu       $a1, $zero, 0xD
    addiu       $v0, $v0, 0xC
    sll         $v0, $v0, 16
    jal         func_8003CFA0
    sra         $a2, $v0, 16
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    lui         $at, 0x8008
    sw          $v0, 0x5290($at)
    j .L80011474
    nop
.L8001146C:
    lui         $at, 0x8006
    sh          $zero, 0x550C($at)
.L80011474:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end render_system_initialize
