.text
.align 2
.set noreorder
.globl gameplay_interface_finalize
.ent gameplay_interface_finalize
gameplay_interface_finalize:
    addiu       $sp, $sp, -0x10
    addu        $a3, $a0, $zero
    addu        $t0, $a1, $zero
    lui         $a1, 0x1
    lw          $a0, 0x4($a3)
    lh          $v1, 0x20($t0)
    ori         $a1, $a1, 0xFFFF
    srl         $v0, $a0, 17
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    sll         $v0, $a2, 17
    or          $a0, $a0, $v0
    andi        $v0, $a2, 0x7FFF
    beq         $v0, $a2, .L8002BA60
    sw          $a0, 0x4($a3)
    lui         $v0, 0xFFFE
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002BA60:
    lhu         $v0, 0x8($a3)
    lh          $v1, 0x22($t0)
    addu        $a2, $v0, $v1
    addu        $v0, $v0, $v1
    sh          $v0, 0x8($a3)
    andi        $v0, $v0, 0xFFFF
    beq         $v0, $a2, .L8002BA84
    ori         $v0, $zero, 0xFFFF
    sh          $v0, 0x8($a3)
.L8002BA84:
    lui         $a1, 0xC003
    lw          $a0, 0x0($a3)
    ori         $a1, $a1, 0xFFFF
    lh          $v1, 0x24($t0)
    srl         $v0, $a0, 18
    andi        $v0, $v0, 0xFFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0xFFF
    sll         $v0, $v1, 18
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BAC4
    sw          $a0, 0x0($a3)
    lui         $v0, 0x3FFC
    or          $v0, $a0, $v0
    sw          $v0, 0x0($a3)
.L8002BAC4:
    lui         $a1, 0xFFFC
    lw          $a0, 0x0($a3)
    ori         $a1, $a1, 0x3F
    lh          $v1, 0x26($t0)
    srl         $v0, $a0, 6
    andi        $v0, $v0, 0xFFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0xFFF
    sll         $v0, $v1, 6
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BB08
    sw          $a0, 0x0($a3)
    lui         $v0, 0x3
    ori         $v0, $v0, 0xFFC0
    or          $v0, $a0, $v0
    sw          $v0, 0x0($a3)
.L8002BB08:
    lhu         $v0, 0xA($a3)
    lh          $a0, 0x28($t0)
    lhu         $v1, 0xA($a3)
    addu        $a2, $v0, $a0
    addu        $v1, $v1, $a0
    sh          $v1, 0xA($a3)
    andi        $v1, $v1, 0xFFFF
    beq         $v1, $a2, .L8002BB30
    ori         $v0, $zero, 0xFFFF
    sh          $v0, 0xA($a3)
.L8002BB30:
    lui         $a1, 0xFFFE
    lw          $a0, 0x4($a3)
    ori         $a1, $a1, 0x1FF
    lh          $v1, 0x2A($t0)
    srl         $v0, $a0, 9
    andi        $v0, $v0, 0xFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0xFF
    sll         $v0, $v1, 9
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BB74
    sw          $a0, 0x4($a3)
    lui         $v0, 0x1
    ori         $v0, $v0, 0xFE00
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002BB74:
    lw          $a0, 0x4($a3)
    lh          $v1, 0x2C($t0)
    andi        $v0, $a0, 0x1FF
    addu        $a2, $v0, $v1
    addiu       $v0, $zero, -0x200
    and         $a0, $a0, $v0
    andi        $v0, $a2, 0x1FF
    or          $a0, $a0, $v0
    beq         $v0, $a2, .L8002BBA4
    sw          $a0, 0x4($a3)
    ori         $v0, $a0, 0x1FF
    sw          $v0, 0x4($a3)
.L8002BBA4:
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end gameplay_interface_finalize
