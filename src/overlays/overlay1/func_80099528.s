.text
.align 2
.set noreorder
.globl func_80099528
.ent func_80099528
func_80099528:
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x630C
    addiu       $a1, $zero, 0x5
    jal         func_800B7A60
    nop
    jal         func_80045714
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6444
    addiu       $v0, $zero, 0x3
    sh          $v0, 0x0($a2)
    addiu       $v0, $zero, 0x4000
    lui         $at, 0x8007
    sh          $v0, -0x6430($at)
    addiu       $v0, $zero, 0x5000
    lui         $at, 0x8007
    sh          $v0, -0x642E($at)
    addiu       $v0, $zero, 0xF00
    lui         $at, 0x8007
    sh          $v0, -0x6442($at)
    lui         $at, 0x8007
    sh          $v0, -0x6440($at)
    addiu       $v0, $zero, 0x1800
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
    jal         func_8000D740
    addiu       $a1, $zero, 0xC
    lui         $at, 0x8008
    sw          $v0, 0xA7C($at)
    jal         func_800334B8
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x50F0
    jal         func_8000D740
    addiu       $a1, $zero, 0x8
    lui         $at, 0x8008
    sw          $v0, 0xC24($at)
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    lui         $a0, 0x8008
    lh          $a0, 0x7A68($a0)
    andi        $a1, $v0, 0x8
    xori        $v1, $a0, 0x3
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0x1
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $a1, 0x4A48($at)
    beqz        $v1, . + 4 + (0x2B << 2)
    nop
    bnez        $a1, . + 4 + (0x29 << 2)
    addiu       $v0, $zero, 0x3
    bne         $a0, $v0, . + 4 + (0x14 << 2)
    addiu       $v0, $zero, 0x1
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v1, $v0, 0xFF
    sltiu       $v0, $v1, 0x50
    beqz        $v0, . + 4 + (0x21 << 2)
    nop
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00620019  # multu       $v1, $v0
    .word       0x00004010  # mfhi        $t0
    srl         $a0, $t0, 4
    jal         func_80011228
    andi        $a0, $a0, 0xFF
    addiu       $v0, $zero, 0xFF
    sb          $v0, 0x10($sp)
    sb          $v0, 0x11($sp)
    sb          $v0, 0x12($sp)
    j           func_80094F70
    sb          $zero, 0x13($sp)
.end func_80099528
