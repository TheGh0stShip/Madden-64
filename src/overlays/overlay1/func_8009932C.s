.text
.align 2
.set noreorder
.globl func_8009932C
.ent func_8009932C
func_8009932C:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    jal         func_8000F31C
    nop
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $v0, 0x351C($at)
    lui         $v1, 0x8009
    lhu         $v1, -0x7904($v1)
    lui         $at, 0x8008
    sh          $v0, 0x50F2($at)
    lui         $at, 0x8007
    sh          $v1, -0x643E($at)
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800993A8
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    j           func_80094C94
    addiu       $v0, $zero, 0x2
.L800993A8:
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x643A($at)
    lui         $v1, 0x8008
    lh          $v1, 0x7A68($v1)
    lui         $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x7B64($at)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80099468
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L800994EC
    nop
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800994EC
    nop
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x2
    beql        $v0, $zero, .L8009944C
    addiu       $v0, $zero, 0x7
    addiu       $v0, $zero, 0x9
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    j           func_80094D34
    addiu       $v0, $zero, 0xA
.L8009944C:
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    addiu       $v0, $zero, 0x8
    lui         $at, 0x8007
    sh          $v0, -0x643A($at)
    j           func_80094DC0
    ori         $v0, $zero, 0xA000
.L80099468:
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800994EC
    nop
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800994C8
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    j           func_80094DB4
    addiu       $v0, $zero, 0x2
.L800994C8:
    addiu       $v0, $zero, 0x5
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    addiu       $v0, $zero, 0x6
    lui         $at, 0x8007
    sh          $v0, -0x643A($at)
    ori         $v0, $zero, 0xC000
    lui         $at, 0x8008
    sw          $v0, 0x7B64($at)
.L800994EC:
    lui         $v0, 0x8007
    lhu         $v0, -0x643C($v0)
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0x9
    beqz        $v0, . + 4 + (0xF << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x640($at)
    jr          $v0
    nop
.end func_8009932C
