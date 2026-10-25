.text
.align 2
.set noreorder
.globl gameplay_interface_update
.ent gameplay_interface_update
gameplay_interface_update:
    addiu       $sp, $sp, -0x8
    addu        $t0, $a1, $zero
    lui         $a1, 0xFFE0
    addu        $a3, $a0, $zero
    lw          $a0, 0x4($a3)
    ori         $a1, $a1, 0x1FF
    lh          $v1, 0x6($t0)
    srl         $v0, $a0, 9
    andi        $v0, $v0, 0xFFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0xFFF
    sll         $v0, $v1, 9
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002B674
    sw          $a0, 0x4($a3)
    lui         $v0, 0x1F
    ori         $v0, $v0, 0xFE00
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002B674:
    lui         $a1, 0x1F
    lw          $a0, 0x4($a3)
    lh          $v1, 0x8($t0)
    ori         $a1, $a1, 0xFFFF
    srl         $v0, $a0, 21
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    sll         $v0, $a2, 21
    or          $a0, $a0, $v0
    andi        $v0, $a2, 0x7FF
    beq         $v0, $a2, .L8002B6B0
    sw          $a0, 0x4($a3)
    lui         $v0, 0xFFE0
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002B6B0:
    lh          $v0, 0x2($a3)
    lh          $a0, 0xA($t0)
    lhu         $v1, 0x2($a3)
    addu        $a1, $v0, $a0
    addu        $v1, $v1, $a0
    sh          $v1, 0x2($a3)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    beql        $v1, $a1, .L8002B6EC
    lui         $a1, 0x3F
    bgez        $a1, .L8002B6E4
    addiu       $v0, $zero, 0x7FFF
    addiu       $v0, $zero, -0x8000
.L8002B6E4:
    sh          $v0, 0x2($a3)
    lui         $a1, 0x3F
.L8002B6EC:
    lw          $a0, 0x8($a3)
    lh          $v1, 0xC($t0)
    ori         $a1, $a1, 0xFFFF
    srl         $v0, $a0, 22
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    sll         $v0, $a2, 22
    or          $a0, $a0, $v0
    andi        $v0, $a2, 0x3FF
    beq         $v0, $a2, .L8002B724
    sw          $a0, 0x8($a3)
    lui         $v0, 0xFFC0
    or          $v0, $a0, $v0
    sw          $v0, 0x8($a3)
.L8002B724:
    lui         $a1, 0xFF80
    lw          $a0, 0x0($a3)
    ori         $a1, $a1, 0xFFFF
    lh          $v1, 0xE($t0)
    srl         $v0, $a0, 16
    andi        $v0, $v0, 0x7F
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0x7F
    sll         $v0, $v1, 16
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002B764
    sw          $a0, 0x0($a3)
    lui         $v0, 0x7F
    or          $v0, $a0, $v0
    sw          $v0, 0x0($a3)
.L8002B764:
    lui         $a1, 0xFFC0
    lw          $a0, 0x8($a3)
    ori         $a1, $a1, 0x3FFF
    lh          $v1, 0x10($t0)
    srl         $v0, $a0, 14
    andi        $v0, $v0, 0xFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0xFF
    sll         $v0, $v1, 14
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002B7A8
    sw          $a0, 0x8($a3)
    lui         $v0, 0x3F
    ori         $v0, $v0, 0xC000
    or          $v0, $a0, $v0
    sw          $v0, 0x8($a3)
.L8002B7A8:
    lw          $a0, 0x4($a3)
    lh          $v1, 0x12($t0)
    andi        $v0, $a0, 0x1FF
    addu        $a2, $v0, $v1
    addiu       $v0, $zero, -0x200
    and         $a0, $a0, $v0
    andi        $v0, $a2, 0x1FF
    or          $a0, $a0, $v0
    beq         $v0, $a2, .L8002B7D8
    sw          $a0, 0x4($a3)
    ori         $v0, $a0, 0x1FF
    sw          $v0, 0x4($a3)
.L8002B7D8:
    lw          $a0, 0x8($a3)
    lh          $v1, 0x14($t0)
    sll         $v0, $a0, 18
    sra         $v0, $v0, 18
    addu        $a1, $v0, $v1
    addiu       $v1, $zero, -0x4000
    and         $a0, $a0, $v1
    andi        $v0, $a1, 0x3FFF
    or          $a0, $a0, $v0
    sll         $v0, $a1, 18
    sra         $v0, $v0, 18
    beq         $v0, $a1, .L8002B824
    sw          $a0, 0x8($a3)
    bgez        $a1, .L8002B81C
    and         $v0, $a0, $v1
    j .L8002B820
    ori         $v0, $v0, 0x2000
.L8002B81C:
    ori         $v0, $v0, 0x1FFF
.L8002B820:
    sw          $v0, 0x8($a3)
.L8002B824:
    lui         $a1, 0xC07F
    lw          $a0, 0x0($a3)
    ori         $a1, $a1, 0xFFFF
    lh          $v1, 0x16($t0)
    srl         $v0, $a0, 23
    andi        $v0, $v0, 0x7F
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0x7F
    sll         $v0, $v1, 23
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002B864
    sw          $a0, 0x0($a3)
    lui         $v0, 0x3F80
    or          $v0, $a0, $v0
    sw          $v0, 0x0($a3)
.L8002B864:
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end gameplay_interface_update
