.text
.align 2
.set noreorder
.globl func_800B22A4
.ent func_800B22A4
func_800B22A4:
    addu        $at, $at, $v0
    lbu         $a0, 0xD77($at)
    addiu       $s5, $a1, 0x28
    jal         func_800167FC
    addiu       $s7, $v1, 0x10
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xD6A
    addu        $s0, $s0, $v0
    addu        $s0, $s0, $s1
    lui         $at, 0x8007
    sw          $s0, -0x466C($at)
    sll         $v0, $s2, 16
    sra         $s0, $v0, 16
    sll         $s1, $s0, 2
    addu        $v0, $s1, $s6
    lw          $a0, 0x8($v0)
    beqz        $a0, . + 4 + (0x49 << 2)
    addiu       $v0, $s2, 0x1
    lw          $v0, 0x4($a0)
    sll         $v1, $s0, 3
    addu        $v1, $v1, $fp
    sw          $v0, 0x0($v1)
    lbu         $v1, 0x0($a0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800B2388
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800B2324
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L800B233C
    sll         $v1, $s2, 16
    j           func_800ADCB8
    nop
.L800B2324:
    beq         $v1, $v0, .L800B236C
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, . + 4 + (0x23 << 2)
    andi        $a0, $s3, 0xFFFF
    j           func_800ADCB8
    sll         $v1, $s2, 16
.L800B233C:
    lbu         $a2, 0x1($a0)
    andi        $a0, $s3, 0xFFFF
    jal         func_8002C5E4
    andi        $a1, $s4, 0xFFFF
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    addu        $a1, $s1, $s0
    sll         $a1, $a1, 3
    jal         func_800167FC
    addu        $a1, $a1, $s5
    j           func_800ADCB8
    sll         $v1, $s2, 16
.L800B236C:
    lbu         $a2, 0x1($a0)
    lbu         $a3, 0x2($a0)
    andi        $a0, $s3, 0xFFFF
    jal         func_8002C874
    andi        $a1, $s4, 0xFFFF
    j           func_800ADCA4
    addu        $a0, $s1, $s0
.L800B2388:
    lbu         $a2, 0x1($a0)
    lbu         $a3, 0x2($a0)
    andi        $a0, $s3, 0xFFFF
.end func_800B22A4
