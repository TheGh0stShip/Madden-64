.text
.align 2
.set noreorder
.globl func_800975D8
.ent func_800975D8
func_800975D8:
    jal         func_800DD28C
    addu        $a0, $zero, $zero
    addu        $a2, $v0, $zero
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0xFE
    beq         $v0, $v1, .L80097654
    andi        $v1, $a2, 0x1FFF
    lui         $a0, 0x8009
    lh          $a0, -0x751C($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    sh          $a2, -0x4856($at)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v1, $v1, $a1
    lw          $v1, 0x4($v1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    j           func_80092F40
    addiu       $v0, $zero, -0x1
.L80097654:
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4856($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4844($at)
    lui         $v0, 0x8009
    lh          $v0, -0x6D30($v0)
    bnez        $v0, .L800976F0
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x5280($v0)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800976CC
    lui         $v1, 0x1000
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    bnel        $v0, $zero, .L800976BC
    addiu       $v0, $zero, 0xB7
    jal         func_800DD524
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    j           func_80092FC4
    addiu       $v0, $zero, -0x1
.L800976BC:
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    j           func_80092FCC
    nop
.L800976CC:
    jal         func_800DD524
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sh          $v0, 0x6CBC($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    lui         $at, 0x8007
    sh          $v0, -0x4842($at)
.L800976F0:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800975D8
