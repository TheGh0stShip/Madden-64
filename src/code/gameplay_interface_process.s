.text
.align 2
.set noreorder
.globl gameplay_interface_process
.ent gameplay_interface_process
gameplay_interface_process:
    addiu       $sp, $sp, -0x18
    addu        $t0, $a1, $zero
    lui         $a1, 0xC000
    addu        $a3, $a0, $zero
    lw          $a0, 0x0($a3)
    ori         $a1, $a1, 0x7FFF
    lh          $v1, 0x12($t0)
    srl         $v0, $a0, 15
    andi        $v0, $v0, 0x7FFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0x7FFF
    sll         $v0, $v1, 15
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002B8C0
    sw          $a0, 0x0($a3)
    lui         $v0, 0x3FFF
    ori         $v0, $v0, 0x8000
    or          $v0, $a0, $v0
    sw          $v0, 0x0($a3)
.L8002B8C0:
    lh          $v0, 0x8($a3)
    lh          $v1, 0x14($t0)
    addu        $a1, $v0, $v1
    addu        $v0, $v0, $v1
    sh          $v0, 0x8($a3)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    beq         $v0, $a1, .L8002B8F4
    nop
    bgez        $a1, .L8002B8F0
    addiu       $v0, $zero, 0x7FFF
    addiu       $v0, $zero, -0x8000
.L8002B8F0:
    sh          $v0, 0x8($a3)
.L8002B8F4:
    lw          $a0, 0x4($a3)
    lh          $v1, 0x16($t0)
    andi        $v0, $a0, 0xFFF
    addu        $a2, $v0, $v1
    addiu       $v0, $zero, -0x1000
    and         $a0, $a0, $v0
    andi        $v0, $a2, 0xFFF
    or          $a0, $a0, $v0
    beq         $v0, $a2, .L8002B924
    sw          $a0, 0x4($a3)
    ori         $v0, $a0, 0xFFF
    sw          $v0, 0x4($a3)
.L8002B924:
    lui         $a1, 0xFFF0
    lw          $a0, 0x4($a3)
    ori         $a1, $a1, 0xFFF
    lh          $v1, 0x18($t0)
    srl         $v0, $a0, 12
    andi        $v0, $v0, 0xFF
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0xFF
    sll         $v0, $v1, 12
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002B968
    sw          $a0, 0x4($a3)
    lui         $v0, 0xF
    ori         $v0, $v0, 0xF000
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002B968:
    lw          $a0, 0x0($a3)
    lh          $v1, 0x1A($t0)
    andi        $v0, $a0, 0x7FFF
    addu        $a2, $v0, $v1
    addiu       $v0, $zero, -0x8000
    and         $a0, $a0, $v0
    andi        $v0, $a2, 0x7FFF
    or          $a0, $a0, $v0
    beq         $v0, $a2, .L8002B998
    sw          $a0, 0x0($a3)
    ori         $v0, $a0, 0x7FFF
    sw          $v0, 0x0($a3)
.L8002B998:
    lh          $v0, 0xA($a3)
    lh          $a0, 0x1C($t0)
    lhu         $v1, 0xA($a3)
    addu        $a1, $v0, $a0
    addu        $v1, $v1, $a0
    sh          $v1, 0xA($a3)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    beql        $v1, $a1, .L8002B9D4
    lui         $a1, 0xF
    bgez        $a1, .L8002B9CC
    addiu       $v0, $zero, 0x7FFF
    addiu       $v0, $zero, -0x8000
.L8002B9CC:
    sh          $v0, 0xA($a3)
    lui         $a1, 0xF
.L8002B9D4:
    lw          $a0, 0x4($a3)
    lh          $v1, 0x1E($t0)
    ori         $a1, $a1, 0xFFFF
    srl         $v0, $a0, 20
    addu        $a2, $v0, $v1
    and         $a0, $a0, $a1
    sll         $v0, $a2, 20
    or          $a0, $a0, $v0
    andi        $v0, $a2, 0xFFF
    beq         $v0, $a2, .L8002BA0C
    sw          $a0, 0x4($a3)
    lui         $v0, 0xFFF0
    or          $v0, $a0, $v0
    sw          $v0, 0x4($a3)
.L8002BA0C:
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end gameplay_interface_process
