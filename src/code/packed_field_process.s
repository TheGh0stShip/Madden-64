.text
.align 2
.set noreorder
.globl packed_field_process
.ent packed_field_process
packed_field_process:
    addiu       $sp, $sp, -0x8
    addu        $t0, $a1, $zero
    lui         $a1, 0x3F
    addu        $a3, $a0, $zero
    lw          $a0, 0x8($a3)
    lh          $v1, 0x2E($t0)
    ori         $a1, $a1, 0xFFFF
    srl         $v0, $a0, 22
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    sll         $v0, $a2, 22
    or          $a0, $a0, $v0
    andi        $v0, $a2, 0x3FF
    beq         $v0, $a2, .L8002BBF8
    sw          $a0, 0x8($a3)
    lui         $v0, 0xFFC0
    or          $v0, $a0, $v0
    sw          $v0, 0x8($a3)
.L8002BBF8:
    lui         $a1, 0x7F
    lw          $a0, 0x4($a3)
    lh          $v1, 0x30($t0)
    ori         $a1, $a1, 0xFFFF
    srl         $v0, $a0, 23
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 23
    or          $a0, $a0, $v0
    andi        $v1, $v1, 0x1FF
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    beq         $v1, $v0, .L8002BC48
    sw          $a0, 0x4($a3)
    lui         $v0, 0xFF80
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002BC48:
    lw          $a0, 0x4($a3)
    lh          $v1, 0x50($t0)
    andi        $v0, $a0, 0x7F
    slt         $v0, $v0, $v1
    beqz        $v0, .L8002BC80
    addiu       $v0, $zero, -0x80
    and         $a0, $a0, $v0
    andi        $v1, $v1, 0x7F
    or          $a0, $a0, $v1
    sw          $a0, 0x4($a3)
    lh          $v0, 0x50($t0)
    beq         $v1, $v0, .L8002BC80
    ori         $v0, $a0, 0x7F
    sw          $v0, 0x4($a3)
.L8002BC80:
    lw          $a0, 0x0($a3)
    lh          $v1, 0x32($t0)
    addiu       $t2, $zero, -0x80
    andi        $v0, $a0, 0x7F
    addu        $a2, $v0, $v1
    and         $a0, $a0, $t2
    andi        $v0, $a2, 0x7F
    or          $a0, $a0, $v0
    beq         $v0, $a2, .L8002BCB0
    sw          $a0, 0x0($a3)
    ori         $v0, $a0, 0x7F
    sw          $v0, 0x0($a3)
.L8002BCB0:
    lui         $a1, 0xFF80
    lw          $a0, 0x4($a3)
    ori         $a1, $a1, 0x7FFF
    lh          $v1, 0x34($t0)
    srl         $v0, $a0, 15
    andi        $v0, $v0, 0xFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0xFF
    sll         $v0, $v1, 15
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BCF4
    sw          $a0, 0x4($a3)
    lui         $v0, 0x7F
    ori         $v0, $v0, 0x8000
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002BCF4:
    lw          $a0, 0x4($a3)
    lh          $v1, 0x36($t0)
    addiu       $t1, $zero, -0x7F81
    srl         $v0, $a0, 7
    andi        $v0, $v0, 0xFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $t1
    andi        $v1, $a2, 0xFF
    sll         $v0, $v1, 7
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BD2C
    sw          $a0, 0x4($a3)
    ori         $v0, $a0, 0x7F80
    sw          $v0, 0x4($a3)
.L8002BD2C:
    lw          $a0, 0x8($a3)
    lh          $v1, 0x38($t0)
    srl         $v0, $a0, 7
    andi        $v0, $v0, 0x1F
    addu        $a2, $v0, $v1
    addiu       $v0, $zero, -0xF81
    and         $a0, $a0, $v0
    andi        $v1, $a2, 0x1F
    sll         $v0, $v1, 7
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BD64
    sw          $a0, 0x8($a3)
    ori         $v0, $a0, 0xF80
    sw          $v0, 0x8($a3)
.L8002BD64:
    lui         $a1, 0xFFC0
    lw          $a0, 0x8($a3)
    ori         $a1, $a1, 0xFFF
    lh          $v1, 0x3A($t0)
    srl         $v0, $a0, 12
    andi        $v0, $v0, 0x3FF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    addu        $v0, $v0, $v1
    andi        $v0, $v0, 0x3FF
    sll         $v1, $v0, 12
    or          $a0, $a0, $v1
    beq         $v0, $a2, .L8002BDAC
    sw          $a0, 0x8($a3)
    lui         $v0, 0x3F
    ori         $v0, $v0, 0xF000
    or          $v0, $a0, $v0
    sw          $v0, 0x8($a3)
.L8002BDAC:
    lui         $a1, 0xC000
    lw          $a0, 0x0($a3)
    ori         $a1, $a1, 0x7FFF
    lh          $v1, 0x3C($t0)
    srl         $v0, $a0, 15
    andi        $v0, $v0, 0x7FFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0x7FFF
    sll         $v0, $v1, 15
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BDF0
    sw          $a0, 0x0($a3)
    lui         $v0, 0x3FFF
    ori         $v0, $v0, 0x8000
    or          $v0, $a0, $v0
    sw          $v0, 0x0($a3)
.L8002BDF0:
    lw          $a0, 0x0($a3)
    lh          $v1, 0x3E($t0)
    srl         $v0, $a0, 7
    andi        $v0, $v0, 0xFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $t1
    andi        $v1, $a2, 0xFF
    sll         $v0, $v1, 7
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002BE24
    sw          $a0, 0x0($a3)
    ori         $v0, $a0, 0x7F80
    sw          $v0, 0x0($a3)
.L8002BE24:
    lw          $a0, 0x8($a3)
    lh          $v1, 0x40($t0)
    andi        $v0, $a0, 0x7F
    addu        $a2, $v0, $v1
    and         $a0, $a0, $t2
    andi        $v0, $a2, 0x7F
    or          $a0, $a0, $v0
    beq         $v0, $a2, .L8002BE50
    sw          $a0, 0x8($a3)
    ori         $v0, $a0, 0x7F
    sw          $v0, 0x8($a3)
.L8002BE50:
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end packed_field_process
