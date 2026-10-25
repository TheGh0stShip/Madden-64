.text
.align 2
.set noreorder
.globl func_8002C1F4
.ent func_8002C1F4
func_8002C1F4:
    addu        $a3, $zero, $zero
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x4538
    addiu       $t2, $zero, 0x5
    andi        $t0, $a0, 0xFFFF
    addu        $t1, $zero, $zero
.L8002C20C:
    lbu         $v0, 0x1($a2)
    beq         $v0, $t2, .L8002C230
    andi        $v0, $a0, 0xFFFF
    lbu         $v0, 0x0($a2)
    beq         $t0, $v0, .L8002C258
    nop
    beqz        $t1, .L8002C20C
    addiu       $a2, $a2, 0x4
    andi        $v0, $a0, 0xFFFF
.L8002C230:
    addiu       $a0, $v0, -0x1
    sltiu       $v0, $a0, 0x32
    beql        $v0, $zero, .L8002C2E8
    addu        $a3, $zero, $zero
    sll         $v0, $a0, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1338($at)
    jr          $v0
    nop
.L8002C258:
    lhu         $a3, 0x2($a2)
    j .L8002C230
    andi        $v0, $a0, 0xFFFF
    sll         $v0, $a3, 16
    sra         $a0, $v0, 16
    beqz        $a0, .L8002C2EC
    sll         $v1, $a1, 16
    sra         $v1, $v1, 16
    subu        $v1, $v1, $a0
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    .word       0x0044001A  # div         $zero, $v0, $a0
    bnez        $a0, .L8002C2A0
    nop
    break       7
.L8002C2A0:
    addiu       $at, $zero, -0x1
    bne         $a0, $at, .L8002C2B8
    lui         $at, 0x8000
    bne         $v0, $at, .L8002C2B8
    nop
    break       6
.L8002C2B8:
    .word       0x00001012  # mflo        $v0
    j .L8002C2E8
    addiu       $a3, $v0, 0x64
    j .L8002C2E8
    addiu       $a3, $zero, 0x64
    j .L8002C2E8
    addiu       $a3, $zero, 0x19
    j .L8002C2E8
    addiu       $a3, $zero, 0x32
    j .L8002C2E8
    addiu       $a3, $zero, 0x63
    addu        $a3, $zero, $zero
.L8002C2E8:
    sll         $v0, $a3, 16
.L8002C2EC:
    sra         $v0, $v0, 16
    nor         $v0, $zero, $v0
    sra         $v0, $v0, 31
    and         $a3, $a3, $v0
    jr          $ra
    andi        $v0, $a3, 0xFFFF
.end func_8002C1F4
