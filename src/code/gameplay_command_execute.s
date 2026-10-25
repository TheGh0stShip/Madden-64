.text
.align 2
.set noreorder
.globl gameplay_command_execute
.ent gameplay_command_execute
gameplay_command_execute:
    addiu       $sp, $sp, -0x80
    sw          $ra, 0x78($sp)
    sw          $s3, 0x74($sp)
    sw          $s2, 0x70($sp)
    sw          $s1, 0x6C($sp)
    jal         func_800334B8
    sw          $s0, 0x68($sp)
    jal         func_8002FE58
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x65D0
    jal         func_8000B2E0
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4C30
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000C930
    addu        $a3, $zero, $zero
    addiu       $a0, $zero, 0x4
    jal         func_8000B6F8
    addiu       $a1, $zero, 0x5
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    lui         $at, 0x8009
    sw          $a0, -0x7F70($at)
    jal         func_8000C940
    addu        $a2, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addiu       $a1, $zero, 0x140
    jal         func_8000C964
    addiu       $a2, $zero, 0xF0
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x6910
    jal         func_8000D2C0
    nop
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    jal         func_8000D5BC
    addu        $a2, $zero, $zero
    addiu       $a0, $zero, 0x6
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x404
    lui         $at, 0x8008
    sw          $v0, 0x7A64($at)
    lui         $at, 0x8008
    sw          $v0, 0x7AA8($at)
    jal         func_80016E80
    addiu       $a2, $zero, 0x720
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x2
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a3, 0x8000
    addiu       $a3, $a3, 0x414
    addiu       $v0, $zero, 0x18
    jal         func_80015C80
    sw          $v0, 0x10($sp)
    jal         func_80015D2C
    addu        $a0, $zero, $zero
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x410
    lui         $at, 0x8009
    sh          $v0, -0x6A2E($at)
    jal         func_800356C4
    addiu       $a1, $zero, 0x2B8
    addu        $s3, $v0, $zero
    andi        $a0, $s3, 0xFFFF
    jal         func_8001AAD8
    addiu       $a1, $zero, 0x2B
    jal         func_8001AD78
    addu        $a0, $zero, $zero
    lui         $a0, 0x8009
    lh          $a0, -0x6A2E($a0)
    addu        $a1, $a0, $zero
    addu        $a2, $a0, $zero
    jal         func_8001B51C
    addu        $a3, $a0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7A64($a1)
    jal         func_8000C898
    nop
    jal         func_800334B8
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_80031A98
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addu        $a1, $zero, $zero
    addiu       $a2, $sp, 0x18
    addiu       $v0, $zero, 0x5
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0xA
    sw          $zero, 0x24($sp)
    sh          $v0, 0x1C($sp)
    sh          $zero, 0x1E($sp)
    sh          $zero, 0x20($sp)
    jal         func_8000D740
    sw          $zero, 0x28($sp)
    jal         func_80016FE4
    addu        $a0, $v0, $zero
    jal         func_800D67B8
    addiu       $a0, $sp, 0x40
    lui         $v1, 0x8009
    lbu         $v1, -0x63E8($v1)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L8002F254
    addiu       $v0, $zero, 0x1
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    bnez        $v0, .L8002F238
    nop
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0xA48
    sw          $v0, 0x40($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0xA4C
    j .L8002F37C
    sw          $v0, 0x44($sp)
.L8002F238:
    lui         $v0, 0x8000
    addiu       $v0, $v0, 0x15A0
    sw          $v0, 0x40($sp)
    lui         $v0, 0x8000
    addiu       $v0, $v0, 0x15AC
    j .L8002F37C
    sw          $v0, 0x44($sp)
.L8002F254:
    bne         $v1, $v0, .L8002F384
    addu        $s2, $zero, $zero
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    blez        $v0, .L8002F2B8
    addu        $s1, $zero, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6DE4
.L8002F274:
    lbu         $v0, 0x0($s0)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    lui         $at, 0x8008
    sh          $v0, 0x4F6C($at)
    lb          $a0, 0x0($s0)
    jal         func_800E1588
    nop
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L8002F2B8
    addiu       $s2, $zero, 0x1
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    addiu       $s1, $s1, 0x1
    slt         $v0, $s1, $v0
    bnez        $v0, .L8002F274
    addiu       $s0, $s0, 0x1
.L8002F2B8:
    addiu       $v0, $zero, 0x1
    bne         $s2, $v0, .L8002F340
    nop
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x9D4
    sw          $v0, 0x40($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x9F4
    sw          $v0, 0x44($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0xA1C
    sw          $v0, 0x48($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lb          $a0, 0x6DE4($at)
    jal         func_800E154C
    nop
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    slti        $v0, $v1, 0x4
    beqz        $v0, .L8002F364
    slti        $v0, $v1, 0x2
    bnez        $v0, .L8002F364
    nop
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x2540
    sw          $v0, 0x40($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x258C
    sw          $v0, 0x44($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x25B0
    j .L8002F364
    sw          $v0, 0x48($sp)
.L8002F340:
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x994
    sw          $v0, 0x40($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x9B4
    sw          $v0, 0x44($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x9D0
    sw          $v0, 0x48($sp)
.L8002F364:
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x29D4
    sw          $v0, 0x4C($sp)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0xA38
    sw          $v0, 0x50($sp)
.L8002F37C:
    addiu       $v0, $zero, 0xC
    sw          $v0, 0x58($sp)
.L8002F384:
    jal         func_800D6454
    addiu       $a0, $sp, 0x40
    lui         $v1, 0x8009
    lbu         $v1, -0x63E8($v1)
    addu        $a0, $v0, $zero
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8002F3B4
    sll         $v0, $a0, 16
    bnez        $v0, .L8002F3B4
    nop
    lui         $at, 0x8009
    sb          $zero, -0x63E8($at)
.L8002F3B4:
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BE80
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000D684
    nop
    jal         func_80015CFC
    nop
    jal         func_80016EE4
    nop
    jal         func_8001AB74
    nop
    jal         func_8000D4AC
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000B7E4
    nop
    jal         func_80035A7C
    andi        $a0, $s3, 0xFFFF
    jal         func_8000B614
    nop
    jal         func_800334B8
    nop
    lw          $ra, 0x78($sp)
    lw          $s3, 0x74($sp)
    lw          $s2, 0x70($sp)
    lw          $s1, 0x6C($sp)
    lw          $s0, 0x68($sp)
    addiu       $sp, $sp, 0x80
    jr          $ra
    nop
.end gameplay_command_execute
