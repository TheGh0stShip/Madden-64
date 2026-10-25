.text
.align 2
.set noreorder
.globl func_800345E8
.ent func_800345E8
func_800345E8:
    addu        $t0, $zero, $zero
    bnez        $a1, .L800345F8
    addu        $a3, $zero, $zero
    lbu         $a1, 0x0($a0)
.L800345F8:
    sll         $v0, $a3, 16
    bltz        $v0, .L800346AC
    nop
    ori         $t2, $zero, 0x8000
    addiu       $t6, $zero, 0x4000
    ori         $t5, $zero, 0xC000
    ori         $t1, $zero, 0x8400
    ori         $t4, $zero, 0x8100
    ori         $t3, $zero, 0xBF00
    sra         $v0, $v0, 15
.L80034620:
    addu        $v0, $v0, $a0
    lhu         $a2, 0x2($v0)
    andi        $v1, $a2, 0xC000
    beq         $v1, $t2, .L8003465C
    slt         $v0, $t2, $v1
    bnez        $v0, .L8003464C
    nop
    beq         $v1, $t6, .L800346A4
    sll         $v0, $a3, 16
    j .L80034698
    addiu       $a3, $a3, 0x1
.L8003464C:
    beql        $v1, $t5, .L80034690
    andi        $a1, $a2, 0x3FFF
    j .L80034698
    addiu       $a3, $a3, 0x1
.L8003465C:
    andi        $v1, $a2, 0xFF00
    beq         $v1, $t1, .L80034688
    slt         $v0, $t1, $v1
    bnez        $v0, .L80034680
    nop
    beql        $v1, $t4, .L800346A0
    addiu       $a3, $zero, -0x1
    j .L800346A4
    sll         $v0, $a3, 16
.L80034680:
    bne         $v1, $t3, .L800346A4
    sll         $v0, $a3, 16
.L80034688:
    j .L800346A0
    addiu       $a3, $zero, -0x1
.L80034690:
    j .L800346A0
    addiu       $a3, $a3, 0x1
.L80034698:
    andi        $v0, $a1, 0xFFFF
    addu        $t0, $t0, $v0
.L800346A0:
    sll         $v0, $a3, 16
.L800346A4:
    bgezl       $v0, .L80034620
    sra         $v0, $v0, 15
.L800346AC:
    jr          $ra
    andi        $v0, $t0, 0xFFFF
.end func_800345E8
