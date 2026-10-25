.text
.align 2
.set noreorder
.globl func_800AFA30
.ent func_800AFA30
func_800AFA30:
    sltiu       $s0, $s0, 0x9
    bnez        $s0, .L800AFAD4
    lui         $v0, 0x6666
    ori         $v0, $v0, 0x6667
    .word       0x02220018  # mult        $s1, $v0
    sra         $v0, $s2, 31
    .word       0x00003010  # mfhi        $a2
    sra         $v1, $a2, 2
    subu        $v1, $v1, $v0
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    subu        $v0, $s1, $v0
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L800AFAB4
    slti        $v0, $v1, 0x3
    beqz        $v0, .L800AFA90
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800AFAA4
    nop
    j           func_800AB3B0
    nop
.L800AFA90:
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800AFAC4
    nop
    j           func_800AB3B0
    nop
.L800AFAA4:
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x1FE8
    j           func_800AB3B8
    nop
.L800AFAB4:
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x1FE4
    j           func_800AB3B8
    nop
.L800AFAC4:
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x1FE0
    j           func_800AB3B8
    nop
.L800AFAD4:
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x1FDC
    jal         func_8004DF94
    addu        $a0, $s3, $zero
    addu        $a0, $s3, $v0
    jal         func_8002E65C
    addu        $a1, $s0, $zero
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800AFA30
