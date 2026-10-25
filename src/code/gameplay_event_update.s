.text
.align 2
.set noreorder
.globl gameplay_event_update
.ent gameplay_event_update
gameplay_event_update:
    addiu       $sp, $sp, -0x10
    sw          $s0, 0x8($sp)
    addu        $t6, $a0, $zero
    addu        $t7, $a1, $zero
    addu        $t2, $zero, $zero
    addu        $t5, $zero, $zero
    lui         $t4, 0x8007
    addiu       $t4, $t4, -0x45DC
    addiu       $s0, $zero, 0x40
    andi        $t9, $t7, 0xFFFF
    andi        $v1, $t6, 0xFFFF
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    andi        $a0, $a2, 0xFFFF
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x1876
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 4
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 1
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sll         $v0, $t9, 1
    addu        $t8, $v0, $v1
    lui         $t1, 0x8008
    addiu       $t1, $t1, 0x57C0
.L80025FCC:
    lw          $t0, 0x0($t4)
    lui         $v0, 0x7F8
    lui         $v1, 0x20
    and         $v0, $t0, $v0
    beq         $v0, $v1, .L80026178
    sra         $v0, $t0, 27
    bnel        $t9, $v0, .L80026180
    addiu       $t4, $t4, 0x4
    addu        $a0, $zero, $zero
    sll         $v0, $t0, 5
    sra         $v1, $v0, 24
    addiu       $v0, $zero, -0x40
    and         $v0, $v1, $v0
    beq         $v0, $s0, .L8002600C
    addiu       $t3, $zero, 0x4
    addiu       $t3, $zero, 0x1
.L8002600C:
    andi        $v1, $v1, 0x3F
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80026080
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L80026034
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L8002604C
    sll         $v0, $t0, 13
    j .L8002617C
    addiu       $t5, $zero, 0x1
.L80026034:
    beq         $v1, $v0, .L800260B0
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L80026088
    addu        $v0, $a0, $a3
    j .L8002617C
    addiu       $t5, $zero, 0x1
.L8002604C:
    lh          $v1, 0x0($t8)
    sra         $a1, $v0, 17
    addu        $a0, $v1, $zero
    slt         $v1, $v1, $a1
    beqz        $v1, .L8002617C
    addu        $v0, $a0, $a3
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $a1
    bnel        $v0, $zero, .L80026180
    addiu       $t4, $t4, 0x4
    j .L8002612C
    nop
.L80026080:
    lhu         $a0, 0x0($t8)
    addu        $v0, $a0, $a3
.L80026088:
    lw          $v1, 0x0($t4)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v1, 13
    sra         $v1, $v1, 17
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L80026180
    addiu       $t4, $t4, 0x4
    j .L8002612C
    nop
.L800260B0:
    lh          $a1, 0x0($t8)
    beqz        $a1, .L8002617C
    sll         $v1, $t0, 13
    sra         $v1, $v1, 17
    .word       0x00A3001A  # div         $zero, $a1, $v1
    bnez        $v1, .L800260D0
    nop
    break       7
.L800260D0:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L800260E8
    lui         $at, 0x8000
    bne         $a1, $at, .L800260E8
    nop
    break       6
.L800260E8:
    .word       0x00002012  # mflo        $a0
    sll         $v0, $a3, 16
    sra         $v0, $v0, 16
    addu        $v0, $a1, $v0
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L80026108
    nop
    break       7
.L80026108:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L80026120
    lui         $at, 0x8000
    bne         $v0, $at, .L80026120
    nop
    break       6
.L80026120:
    .word       0x00001012  # mflo        $v0
    beql        $a0, $v0, .L80026180
    addiu       $t4, $t4, 0x4
.L8002612C:
    lh          $v0, 0x0($t1)
    beqz        $v0, .L8002614C
    sll         $v0, $t2, 16
    lh          $v1, 0x2($t1)
    sra         $v0, $v0, 16
    slt         $v0, $v0, $v1
    beql        $v0, $zero, .L80026180
    addiu       $t4, $t4, 0x4
.L8002614C:
    sh          $t3, 0x0($t1)
    sh          $t2, 0x2($t1)
    sh          $t6, 0x4($t1)
    sh          $a2, 0x6($t1)
    sh          $t7, 0x8($t1)
    lw          $v0, 0x0($t4)
    addiu       $t5, $zero, 0x1
    sll         $v0, $v0, 28
    sra         $v0, $v0, 28
    j .L8002617C
    sb          $v0, 0xC($t1)
.L80026178:
    addiu       $t5, $zero, 0x1
.L8002617C:
    addiu       $t4, $t4, 0x4
.L80026180:
    addu        $v0, $t5, $zero
    beqz        $v0, .L80025FCC
    addiu       $t2, $t2, 0x1
    lw          $s0, 0x8($sp)
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end gameplay_event_update
