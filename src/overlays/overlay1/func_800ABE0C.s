.text
.align 2
.set noreorder
.globl func_800ABE0C
.ent func_800ABE0C
func_800ABE0C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    addu        $a3, $zero, $zero
    andi        $v0, $a1, 0x2
    beqz        $v0, .L800ABF00
    sw          $ra, 0x1C($sp)
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800ABF00
    andi        $a0, $s0, 0xFFFF
    sll         $a3, $a0, 1
    lui         $at, 0x8007
    addu        $at, $at, $a3
    lhu         $v0, -0x484C($at)
    beqz        $v0, .L800ABE90
    sll         $v0, $a0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a2, -0x5ED4($at)
    addiu       $v1, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $a3
    sh          $zero, -0x5EB8($at)
    lui         $at, 0x8008
    addu        $at, $at, $a3
    sh          $v1, -0x5EAC($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a2, -0x5EE0($at)
    j           func_800A77B0
    addiu       $a1, $zero, 0x1
.L800ABE90:
    lui         $at, 0x8008
    addu        $at, $at, $a3
    lhu         $v0, -0x5EB4($at)
    sll         $v1, $a0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a2, -0x5EC4($at)
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    addu        $at, $at, $a3
    sh          $zero, -0x5EAC($at)
    lui         $at, 0x8008
    addu        $at, $at, $a3
    sh          $v0, -0x5EB8($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a2, -0x5EE0($at)
    jal         func_800A9330
    nop
    andi        $a1, $s0, 0xFFFF
    sll         $v0, $a1, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $a0, -0x5EB8($at)
    jal         func_800A84E0
    nop
    j           func_800A7A94
    nop
.L800ABF00:
    andi        $v0, $s0, 0xFFFF
    sll         $v1, $v0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $a2, -0x5EB8($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v1, -0x5EE4($at)
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, -0x5EE0($at)
    beqz        $v1, .L800ABF48
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800ABF74
    andi        $v0, $a1, 0x4000
    j           func_800A78B8
    andi        $a3, $a3, 0xFFFF
.L800ABF48:
    andi        $v0, $a1, 0x4000
    bnel        $v0, $zero, .L800ABF54
    addiu       $a3, $zero, 0x1
.L800ABF54:
    andi        $v0, $a1, 0x8000
    bnel        $v0, $zero, .L800ABF60
    addiu       $a3, $zero, 0x2
.L800ABF60:
    andi        $v0, $a1, 0x4
    bnel        $v0, $zero, .L800ABFD8
    addiu       $a3, $zero, 0x3
    j           func_800A78B8
    andi        $a3, $a3, 0xFFFF
.L800ABF74:
    bnel        $v0, $zero, .L800ABF7C
    addiu       $a3, $zero, 0x1
.L800ABF7C:
    andi        $v0, $a1, 0x8000
    bnel        $v0, $zero, .L800ABF88
    addiu       $a3, $zero, 0x2
.L800ABF88:
    andi        $v0, $a1, 0x4
    bnel        $v0, $zero, .L800ABF94
    addiu       $a3, $zero, 0x3
.L800ABF94:
    andi        $v0, $a1, 0x10
    beqz        $v0, .L800ABFB4
    andi        $v0, $a2, 0xFFFF
    bnez        $v0, .L800ABFD8
    addiu       $a2, $a2, -0x1
    lhu         $v0, 0x0($a0)
    j           func_800A78B4
    addiu       $a2, $v0, -0x1
.L800ABFB4:
    andi        $v0, $a1, 0x2020
    beqz        $v0, .L800ABFD8
    andi        $v0, $a2, 0xFFFF
    lhu         $v1, 0x0($a0)
    addiu       $v0, $v0, 0x1
    slt         $v0, $v0, $v1
    bnez        $v0, .L800ABFD8
    addiu       $a2, $a2, 0x1
    addu        $a2, $zero, $zero
.L800ABFD8:
    andi        $a3, $a3, 0xFFFF
    beqz        $a3, .L800AC1C0
    andi        $a1, $s0, 0xFFFF
    sll         $v0, $a1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, -0x5EE0($at)
    andi        $v1, $a2, 0xFFFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a0
    lhu         $a3, 0x0($v0)
    beqz        $a1, .L800AC054
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x4852($v0)
    lui         $v1, 0x8008
    lhu         $v1, -0x5ED6($v1)
    or          $v0, $a3, $v0
    lui         $at, 0x8007
    sh          $v0, -0x4856($at)
    lui         $at, 0x8007
    sh          $v1, -0x4844($at)
    lui         $at, 0x8008
    sh          $v0, 0x7946($at)
    lui         $at, 0x8008
    sh          $v1, 0x6C8C($at)
    j           func_800A7A80
    andi        $v0, $s0, 0xFFFF
.L800AC054:
    lui         $v0, 0x8008
    lhu         $v0, -0x5ED8($v0)
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    lui         $at, 0x8007
    sh          $a3, -0x4854($at)
    lui         $at, 0x8008
    sh          $a3, 0x791C($at)
    lui         $at, 0x8007
    sh          $v0, -0x4842($at)
    lui         $at, 0x8008
    sh          $v0, 0x6BE6($at)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800AC1A0
    andi        $v0, $a3, 0x1FFF
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    sll         $v0, $v0, 2
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v0, $v0, $a1
    lw          $v0, 0x4($v0)
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, 0x2DBC($at)
    lbu         $a1, 0x0($v0)
    andi        $a1, $a1, 0x1F
    andi        $a1, $a1, 0xFF
    sll         $v0, $a1, 5
    or          $v0, $v0, $a1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $a1, 0x2DC0($at)
    lui         $a1, 0x8008
    lw          $a1, 0x7894($a1)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a2, 0x2DC0($at)
    sll         $v0, $v0, 2
    addu        $a1, $a1, $v0
    sll         $v0, $a2, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a1, 0x2DB8($at)
    lui         $a1, 0x8009
    lw          $a1, -0x7F6C($a1)
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $a1, $a1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a1, 0x2DB4($at)
    jal         func_80022354
    andi        $a0, $a0, 0xFFFF
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x6DDC($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x5280($v0)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    andi        $v0, $v0, 0xFF3F
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x78A8($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $v1, -0x6C80($at)
    jal         func_80091E2C
    nop
.L800AC1A0:
    andi        $v0, $s0, 0xFFFF
    sll         $v0, $v0, 1
    addiu       $v1, $zero, 0x3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, -0x5EE4($at)
    jal         func_800A9F70
    nop
.L800AC1C0:
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800ABE0C
