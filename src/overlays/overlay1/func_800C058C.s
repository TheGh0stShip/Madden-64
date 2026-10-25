.text
.align 2
.set noreorder
.globl func_800C058C
.ent func_800C058C
func_800C058C:
    nop
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0x7
    bne         $v0, $v1, .L800C0698
    sll         $v0, $s1, 16
    jal         func_800BBAF4
    addu        $a0, $s3, $zero
    beqz        $v0, .L800C0650
    nop
    jal         func_800BC004
    addu        $a0, $s3, $zero
    addu        $s1, $v0, $zero
    addiu       $v0, $s1, -0x400
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x801
    beqz        $v0, .L800C05D4
    addiu       $s4, $zero, 0x2
    addiu       $s4, $zero, 0x1
.L800C05D4:
    sll         $v0, $s1, 16
    sra         $a0, $v0, 16
    slti        $v0, $a0, 0x800
    beqz        $v0, .L800C0608
    addiu       $v0, $zero, 0x400
    subu        $v1, $v0, $a0
    bltzl       $v1, .L800C05F4
    negu        $v1, $v1
.L800C05F4:
    subu        $v0, $v0, $v1
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    j           func_800BBF0C
    srl         $s0, $v0, 1
.L800C0608:
    addiu       $v1, $zero, 0xC00
    subu        $v1, $v1, $a0
    bltzl       $v1, .L800C0618
    negu        $v1, $v1
.L800C0618:
    subu        $v0, $v0, $v1
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    addiu       $v1, $zero, 0xFFF
    subu        $s0, $v1, $v0
    sll         $v1, $s0, 16
    sra         $v1, $v1, 16
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    beql        $v1, $v0, .L800C0694
    addiu       $s1, $s1, -0x1
    j           func_800BBF74
    sll         $v0, $s1, 16
.L800C0650:
    jal         func_800C157C
    addu        $a0, $s3, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $v0, $s2, $v0
    andi        $v1, $v0, 0xFFF
    slti        $v0, $v1, 0x801
    bnez        $v0, .L800C0680
    slti        $v0, $v1, 0x639
    addiu       $v0, $zero, 0xFFF
    subu        $v1, $v0, $v1
    slti        $v0, $v1, 0x639
.L800C0680:
    bnez        $v0, .L800C0698
    sll         $v0, $s1, 16
    jal         func_800C157C
    addu        $a0, $s3, $zero
    addu        $s0, $v0, $zero
.L800C0694:
    sll         $v0, $s1, 16
.L800C0698:
    sra         $a1, $v0, 16
    sll         $v0, $s0, 16
    sra         $a2, $v0, 16
    bne         $a1, $a2, .L800C06C0
    addu        $a0, $s3, $zero
    addu        $a1, $a2, $zero
    jal         func_800C0018
    addu        $a2, $zero, $zero
    j           func_800BBFD8
    sll         $v0, $s1, 16
.L800C06C0:
    jal         func_800C058C
    lui         $a3, 0x1
    beqz        $s4, .L800C06F8
    addiu       $v0, $zero, 0x1
    bne         $s4, $v0, .L800C06EC
    lui         $v0, 0x6
    lbu         $v0, 0x1B($s3)
    bnez        $v0, .L800C06F0
    addiu       $v0, $zero, 0x18
    j           func_800BBFCC
    addiu       $v0, $zero, 0x19
.L800C06EC:
    ori         $v0, $v0, 0x8
.L800C06F0:
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
.L800C06F8:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800C058C
