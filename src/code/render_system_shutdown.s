.text
.align 2
.set noreorder
.globl render_system_shutdown
.ent render_system_shutdown
render_system_shutdown:
    lui         $a0, 0x8006
    lw          $a0, 0x5528($a0)
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    jal         func_8000B7E4
    sw          $s0, 0x10($sp)
    lui         $a0, 0x8006
    lw          $a0, 0x5524($a0)
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x54A8
    lui         $s3, 0x8009
    addiu       $s3, $s3, -0x4860
    lui         $at, 0x8006
    sw          $zero, 0x5528($at)
    lui         $at, 0x8006
    sh          $zero, 0x5500($at)
    jal         func_8000D684
    nop
    lui         $at, 0x8006
    sw          $zero, 0x5524($at)
.L80011960:
    sll         $s0, $s2, 16
    sra         $s0, $s0, 14
    addu        $s1, $s0, $s4
    lw          $a1, 0x0($s1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $s0, $s0, $s3
    lw          $a1, 0x0($s0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x40
    sw          $zero, 0x0($s1)
    bnez        $v0, .L80011960
    sw          $zero, 0x0($s0)
    lui         $a1, 0x8008
    lw          $a1, 0x76D8($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x551C($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x4760
    lw          $a1, 0x0($s0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $v0, 0x8006
    lhu         $v0, 0x5520($v0)
    addiu       $v1, $zero, 0x1
    lui         $at, 0x8009
    sw          $zero, -0x4CD4($at)
    lui         $at, 0x8008
    sw          $zero, 0x76D8($at)
    lui         $at, 0x8006
    sw          $zero, 0x551C($at)
    sw          $zero, 0x0($s0)
    lui         $at, 0x8006
    sh          $zero, 0x5502($at)
    lui         $at, 0x8006
    sh          $v1, 0x5504($at)
    lui         $at, 0x8006
    sh          $zero, 0x550E($at)
    lui         $at, 0x8006
    sh          $zero, 0x5510($at)
    lui         $at, 0x8006
    sh          $zero, 0x5512($at)
    lui         $at, 0x8006
    sw          $zero, 0x5514($at)
    lui         $at, 0x8006
    sw          $zero, 0x5518($at)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8006
    sh          $v0, 0x5520($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x5
    bnez        $v0, .L80011A64
    nop
    lui         $at, 0x8006
    sh          $zero, 0x5520($at)
.L80011A64:
    lui         $at, 0x8006
    sw          $zero, 0x5508($at)
    lui         $at, 0x8006
    sh          $v1, 0x552C($at)
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end render_system_shutdown
