.text
.align 2
.set noreorder
.globl func_800C08BC
.ent func_800C08BC
func_800C08BC:
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x6C40
    lui         $fp, 0x8009
    addiu       $fp, $fp, -0x4E08
    lw          $v1, 0x14($a0)
    addiu       $s7, $zero, -0x2
    lui         $v0, 0x800C
    addiu       $v0, $v0, -0x3160
    sw          $v0, 0xC($a0)
    addiu       $v0, $zero, -0x2
    and         $v1, $v1, $v0
    sw          $v1, 0x14($a0)
    andi        $s1, $s3, 0xFFFF
.L800C08F8:
    addiu       $a3, $zero, 0x8
    bne         $s1, $a3, .L800C090C
    nop
    lui         $at, 0x8007
    sw          $zero, -0x6520($at)
.L800C090C:
    lw          $a0, 0x14($sp)
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6548
    jal         func_8000D740
    addiu       $a1, $zero, 0xB
    addu        $a0, $v0, $zero
    addiu       $a1, $zero, 0x1
    sll         $v0, $s1, 2
    addu        $s0, $v0, $s5
    jal         func_800950E0
    sw          $a0, 0x0($s0)
    lw          $a0, 0x0($s0)
    jal         func_80095150
    addiu       $a1, $zero, 0x96
    lw          $v0, 0x0($s0)
    lw          $v1, 0x8($v0)
    addiu       $v0, $zero, 0x1E0
    sw          $v0, 0x28($v1)
    lw          $a0, 0x0($s0)
    jal         func_80034388
    addiu       $a1, $zero, 0x105
    addiu       $a3, $zero, 0x8
    bne         $s1, $a3, .L800C0978
    nop
    lw          $a0, 0x20($s5)
    jal         func_80034388
    addiu       $a1, $zero, 0x106
.L800C0978:
    bnel        $s1, $zero, .L800C09A0
    addiu       $s6, $s6, 0x20
    lw          $a0, 0x0($s5)
    lui         $at, 0x8007
    sw          $a0, -0x6520($at)
    jal         func_80033B20
    addiu       $a1, $zero, 0x1
    lw          $a0, 0x0($s5)
    jal         func_8009562C
    addiu       $s6, $s6, 0x20
.L800C09A0:
    addiu       $a0, $zero, 0x10
    jal         func_80096878
    addu        $a1, $s6, $zero
    addu        $a1, $v0, $zero
    sll         $v0, $s1, 1
    addu        $v0, $v0, $fp
    sh          $a1, 0x0($v0)
    sltiu       $v0, $s1, 0x4
    beqz        $v0, .L800C09D4
    andi        $a1, $a1, 0xFFFF
    lw          $a0, 0x0($s0)
    j           func_800BC2B8
    nop
.L800C09D4:
    lw          $a0, 0x0($s0)
    lhu         $a1, 0x0($fp)
    jal         func_80096A00
    andi        $s2, $s3, 0xFFFF
    sll         $s4, $s2, 2
    addu        $s1, $s4, $s5
    lw          $v1, 0x0($s1)
    lui         $v0, 0x800C
    addiu       $v0, $v0, -0x348C
    sw          $v0, 0xC($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $s7
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sh          $s3, 0x3C($v0)
    sltiu       $v0, $s2, 0x8
    beqz        $v0, .L800C0AA0
    addiu       $a1, $zero, 0x4
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    jal         func_8000D740
    addu        $a2, $zero, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7AD0
    addu        $s0, $s4, $s0
    sw          $v0, 0x0($s0)
    sw          $zero, 0x18($v0)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $s7
    sw          $v0, 0x14($v1)
    lw          $a0, 0x0($s0)
    lw          $a1, 0x0($s1)
    jal         func_80097578
    nop
    lw          $a0, 0x0($s0)
    lui         $at, 0x8007
    addu        $at, $at, $s2
    lbu         $a1, 0x2710($at)
    lui         $at, 0x8007
    addu        $at, $at, $s2
    lbu         $a2, 0x2718($at)
    jal         func_80097590
    nop
    lw          $v0, 0x0($s0)
    sh          $s3, 0x3C($v0)
    lw          $v1, 0x0($s0)
    lui         $v0, 0x800C
    addiu       $v0, $v0, -0x31EC
    sw          $v0, 0xC($v1)
.L800C0AA0:
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0x9
    bnez        $v0, .L800C08F8
    andi        $s1, $s3, 0xFFFF
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    addiu       $a1, $zero, 0x39
    addiu       $v0, $zero, 0x8
    lui         $at, 0x8009
    sb          $v0, -0x7F8A($at)
    lui         $at, 0x8007
    sw          $zero, -0x6520($at)
    lui         $at, 0x8009
    sh          $zero, -0x7F84($at)
    jal         func_80035F88
    addu        $s3, $zero, $zero
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x26F8
    lui         $at, 0x8009
    sb          $zero, -0x5C02($at)
    andi        $v0, $s3, 0xFFFF
.L800C0AF8:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sw          $zero, 0x0($v0)
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0x6
    bnez        $v0, .L800C0AF8
    andi        $v0, $s3, 0xFFFF
    lw          $ra, 0x3C($sp)
    lw          $fp, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800C08BC
