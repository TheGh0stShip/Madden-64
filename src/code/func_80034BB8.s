.text
.align 2
.set noreorder
.globl func_80034BB8
.ent func_80034BB8
func_80034BB8:
    addiu       $t1, $zero, -0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x24DA($v0)
    addiu       $t0, $zero, -0x1
    beqz        $v0, .L80034CA8
    addu        $a2, $zero, $zero
    lui         $a3, 0x8007
    lw          $a3, 0x24DC($a3)
    addu        $a1, $v0, $zero
    andi        $v0, $a2, 0xFFFF
.L80034BE0:
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    lhu         $v1, 0x0($v1)
    slt         $v0, $a0, $v1
    beql        $v0, $zero, .L80034C08
    addiu       $a2, $a2, 0x1
    j .L80034C18
    addu        $a0, $v1, $zero
.L80034C08:
    andi        $v0, $a2, 0xFFFF
    sltu        $v0, $v0, $a1
    bnez        $v0, .L80034BE0
    andi        $v0, $a2, 0xFFFF
.L80034C18:
    lui         $v0, 0x8007
    lbu         $v0, 0x24DA($v0)
    beqz        $v0, .L80034CA8
    addu        $a2, $zero, $zero
    lui         $t2, 0x8007
    lw          $t2, 0x24DC($t2)
    addu        $a3, $v0, $zero
    andi        $v1, $a2, 0xFFFF
.L80034C38:
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $a1, $v0, $t2
    lw          $v1, 0x8($a1)
    xori        $v0, $v1, 0x2
    sltiu       $v0, $v0, 0x1
    sltiu       $v1, $v1, 0x1
    or          $v0, $v0, $v1
    beql        $v0, $zero, .L80034C98
    addiu       $a2, $a2, 0x1
    lbu         $v0, 0xC($a1)
    bnel        $v0, $zero, .L80034C98
    addiu       $a2, $a2, 0x1
    lhu         $v0, 0x0($a1)
    bnel        $a0, $v0, .L80034C98
    addiu       $a2, $a2, 0x1
    lw          $v1, 0x10($a1)
    sltu        $v0, $v1, $t0
    beql        $v0, $zero, .L80034C98
    addiu       $a2, $a2, 0x1
    addu        $t0, $v1, $zero
    addu        $t1, $a2, $zero
    addiu       $a2, $a2, 0x1
.L80034C98:
    andi        $v0, $a2, 0xFFFF
    sltu        $v0, $v0, $a3
    bnez        $v0, .L80034C38
    andi        $v1, $a2, 0xFFFF
.L80034CA8:
    sll         $v0, $t1, 16
    jr          $ra
    sra         $v0, $v0, 16
.end func_80034BB8
