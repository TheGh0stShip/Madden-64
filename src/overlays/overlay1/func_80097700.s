.text
.align 2
.set noreorder
.globl func_80097700
.ent func_80097700
func_80097700:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80097824
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    bnez        $v0, .L80097824
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    beqz        $v0, .L80097824
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x7F8C($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x7F8C($at)
    sll         $v0, $v0, 16
    bgez        $v0, .L80097824
    addiu       $v0, $zero, 0x3C
    lui         $at, 0x8009
    sh          $v0, -0x7F8C($at)
    jal         func_800DD6EC
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800977CC
    nop
    jal         func_800DD28C
    addiu       $a0, $zero, 0x3
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x2
    bne         $v0, $v1, .L800977CC
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x751C($a0)
    jal         func_8009EB14
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, -0x801
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800977CC:
    lui         $v0, 0x8008
    lhu         $v0, 0x5280($v0)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L80097824
    nop
    jal         func_800DD524
    addiu       $a0, $zero, 0x3
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x2
    bne         $v0, $v1, .L80097824
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    jal         func_8009EB14
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, -0x801
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L80097824:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80097700
