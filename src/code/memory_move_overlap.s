.text
.align 2
.set noreorder
.globl memory_move_overlap
.ent memory_move_overlap
memory_move_overlap:
    sltu        $v0, $a1, $a0
    beqz        $v0, .L8002E388
    addu        $v1, $a0, $zero
    addu        $a1, $a1, $a2
    andi        $a3, $a1, 0x3
    sltu        $v0, $a2, $a3
    beqz        $v0, .L8002E1A0
    addu        $v1, $a0, $a2
    addu        $a3, $a2, $zero
.L8002E1A0:
    beqz        $a3, .L8002E1D4
    subu        $a2, $a2, $a3
    addiu       $a3, $a3, -0x1
    addiu       $v0, $zero, -0x1
    beq         $a3, $v0, .L8002E1D8
    andi        $v0, $v1, 0x3
    addiu       $t0, $zero, -0x1
.L8002E1BC:
    addiu       $a1, $a1, -0x1
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a3, $a3, -0x1
    bne         $a3, $t0, .L8002E1BC
    sb          $v0, 0x0($v1)
.L8002E1D4:
    andi        $v0, $v1, 0x3
.L8002E1D8:
    bnez        $v0, .L8002E2B8
    andi        $a3, $a2, 0x7
    srl         $t2, $a2, 2
    andi        $a3, $t2, 0x7
    addiu       $a3, $a3, -0x1
    addiu       $v0, $zero, -0x1
    beq         $a3, $v0, .L8002E214
    srl         $t0, $a2, 5
    addiu       $t1, $zero, -0x1
.L8002E1FC:
    addiu       $a1, $a1, -0x4
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a3, $a3, -0x1
    bne         $a3, $t1, .L8002E1FC
    sw          $v0, 0x0($v1)
.L8002E214:
    addiu       $t0, $t0, -0x1
    addiu       $v0, $zero, -0x1
    beq         $t0, $v0, .L8002E2AC
    addiu       $a3, $zero, -0x1
.L8002E224:
    addiu       $a1, $a1, -0x4
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a1, $a1, -0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a1, $a1, -0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a1, $a1, -0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a1, $a1, -0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a1, $a1, -0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a1, $a1, -0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, -0x4
    addiu       $a1, $a1, -0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $t0, $t0, -0x1
    addiu       $v1, $v1, -0x4
    bne         $t0, $a3, .L8002E224
    sw          $v0, 0x0($v1)
.L8002E2AC:
    sll         $v0, $t2, 2
    subu        $a2, $a2, $v0
    andi        $a3, $a2, 0x7
.L8002E2B8:
    addiu       $a3, $a3, -0x1
    addiu       $v0, $zero, -0x1
    beq         $a3, $v0, .L8002E2E4
    srl         $t0, $a2, 3
    addiu       $a2, $zero, -0x1
.L8002E2CC:
    addiu       $a1, $a1, -0x1
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a3, $a3, -0x1
    bne         $a3, $a2, .L8002E2CC
    sb          $v0, 0x0($v1)
.L8002E2E4:
    addiu       $t0, $t0, -0x1
    addiu       $v0, $zero, -0x1
    beq         $t0, $v0, .L8002E584
    nop
    addiu       $a2, $zero, -0x1
.L8002E2F8:
    addiu       $a1, $a1, -0x1
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a1, $a1, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a1, $a1, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a1, $a1, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a1, $a1, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a1, $a1, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a1, $a1, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, -0x1
    addiu       $a1, $a1, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $t0, $t0, -0x1
    addiu       $v1, $v1, -0x1
    bne         $t0, $a2, .L8002E2F8
    sb          $v0, 0x0($v1)
    j .L8002E584
    nop
.L8002E388:
    andi        $a3, $a1, 0x3
    beqz        $a3, .L8002E398
    addiu       $v0, $zero, 0x4
    subu        $a3, $v0, $a3
.L8002E398:
    sltu        $v0, $a2, $a3
    bnel        $v0, $zero, .L8002E3A4
    addu        $a3, $a2, $zero
.L8002E3A4:
    beqz        $a3, .L8002E3D8
    subu        $a2, $a2, $a3
    addiu       $a3, $a3, -0x1
    addiu       $v0, $zero, -0x1
    beq         $a3, $v0, .L8002E3DC
    andi        $v0, $v1, 0x3
    addiu       $t0, $zero, -0x1
.L8002E3C0:
    lbu         $v0, 0x0($a1)
    addiu       $a1, $a1, 0x1
    addiu       $a3, $a3, -0x1
    sb          $v0, 0x0($v1)
    bne         $a3, $t0, .L8002E3C0
    addiu       $v1, $v1, 0x1
.L8002E3D8:
    andi        $v0, $v1, 0x3
.L8002E3DC:
    bnez        $v0, .L8002E4BC
    andi        $a3, $a2, 0x7
    srl         $t2, $a2, 2
    andi        $a3, $t2, 0x7
    addiu       $a3, $a3, -0x1
    addiu       $v0, $zero, -0x1
    beq         $a3, $v0, .L8002E418
    srl         $t0, $a2, 5
    addiu       $t1, $zero, -0x1
.L8002E400:
    lw          $v0, 0x0($a1)
    addiu       $a1, $a1, 0x4
    addiu       $a3, $a3, -0x1
    sw          $v0, 0x0($v1)
    bne         $a3, $t1, .L8002E400
    addiu       $v1, $v1, 0x4
.L8002E418:
    addiu       $t0, $t0, -0x1
    addiu       $v0, $zero, -0x1
    beq         $t0, $v0, .L8002E4B0
    addiu       $a3, $zero, -0x1
.L8002E428:
    lw          $v0, 0x0($a1)
    addiu       $a1, $a1, 0x4
    addiu       $t0, $t0, -0x1
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x4
    sw          $v0, 0x0($v1)
    lw          $v0, 0x0($a1)
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x4
    sw          $v0, 0x0($v1)
    bne         $t0, $a3, .L8002E428
    addiu       $v1, $v1, 0x4
.L8002E4B0:
    sll         $v0, $t2, 2
    subu        $a2, $a2, $v0
    andi        $a3, $a2, 0x7
.L8002E4BC:
    addiu       $a3, $a3, -0x1
    addiu       $v0, $zero, -0x1
    beq         $a3, $v0, .L8002E4E8
    srl         $t0, $a2, 3
    addiu       $a2, $zero, -0x1
.L8002E4D0:
    lbu         $v0, 0x0($a1)
    addiu       $a1, $a1, 0x1
    addiu       $a3, $a3, -0x1
    sb          $v0, 0x0($v1)
    bne         $a3, $a2, .L8002E4D0
    addiu       $v1, $v1, 0x1
.L8002E4E8:
    addiu       $t0, $t0, -0x1
    addiu       $v0, $zero, -0x1
    beq         $t0, $v0, .L8002E584
    nop
    addiu       $a2, $zero, -0x1
.L8002E4FC:
    lbu         $v0, 0x0($a1)
    addiu       $a1, $a1, 0x1
    addiu       $t0, $t0, -0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($v1)
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($v1)
    bne         $t0, $a2, .L8002E4FC
    addiu       $v1, $v1, 0x1
.L8002E584:
    jr          $ra
    addu        $v0, $a0, $zero
.end memory_move_overlap
