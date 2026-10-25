.text
.align 2
.set noreorder
.globl func_8002E58C
.ent func_8002E58C
func_8002E58C:
    andi        $v0, $a0, 0x3
    sltu        $v0, $zero, $v0
    sltu        $v1, $zero, $a2
    and         $v0, $v0, $v1
    beqz        $v0, .L8002E5CC
    addu        $a3, $a0, $zero
    addu        $t0, $a1, $zero
    sb          $t0, 0x0($a3)
.L8002E5AC:
    addiu       $a3, $a3, 0x1
    addiu       $a2, $a2, -0x1
    andi        $v0, $a3, 0x3
    sltu        $v0, $zero, $v0
    sltu        $v1, $zero, $a2
    and         $v0, $v0, $v1
    bnel        $v0, $zero, .L8002E5AC
    sb          $t0, 0x0($a3)
.L8002E5CC:
    sltiu       $v0, $a2, 0x5
    bnel        $v0, $zero, .L8002E604
    addiu       $a2, $a2, -0x1
    andi        $v1, $a1, 0xFF
    sll         $v0, $v1, 8
    or          $v1, $v1, $v0
    sll         $v0, $v1, 16
    or          $v1, $v1, $v0
.L8002E5EC:
    sw          $v1, 0x0($a3)
    addiu       $a2, $a2, -0x4
    sltiu       $v0, $a2, 0x5
    beqz        $v0, .L8002E5EC
    addiu       $a3, $a3, 0x4
    addiu       $a2, $a2, -0x1
.L8002E604:
    addiu       $v0, $zero, -0x1
    beq         $a2, $v0, .L8002E620
    nop
.L8002E610:
    sb          $a1, 0x0($a3)
    addiu       $a2, $a2, -0x1
    bne         $a2, $v0, .L8002E610
    addiu       $a3, $a3, 0x1
.L8002E620:
    jr          $ra
    addu        $v0, $a0, $zero
.end func_8002E58C
