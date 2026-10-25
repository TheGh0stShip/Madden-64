.text
.align 2
.set noreorder
.globl resource_archive_decode
.ent resource_archive_decode
resource_archive_decode:
    addiu       $sp, $sp, -0x2B0
    sw          $s0, 0x288($sp)
    lw          $s0, 0x2C4($sp)
    sw          $s6, 0x2A0($sp)
    addu        $s6, $a0, $zero
    addiu       $a0, $sp, 0x1F0
    sw          $fp, 0x2A8($sp)
    addu        $fp, $a2, $zero
    sw          $ra, 0x2AC($sp)
    sw          $s7, 0x2A4($sp)
    sw          $s5, 0x29C($sp)
    sw          $s4, 0x298($sp)
    sw          $s3, 0x294($sp)
    sw          $s2, 0x290($sp)
    sw          $s1, 0x28C($sp)
    sh          $a1, 0x27E($sp)
    jal         func_80063530
    sh          $a3, 0x286($sp)
    addiu       $a0, $sp, 0x20
    addiu       $a1, $zero, 0x3D
    addiu       $a2, $zero, 0x1D0
    jal         func_80054DB0
    sw          $v0, 0x20($sp)
    addiu       $a0, $sp, 0x20
    jal         func_8005560C
    addu        $a1, $s0, $zero
    addiu       $a0, $sp, 0x20
    jal         func_800551B4
    addiu       $a1, $zero, 0x1
    jal         func_80054768
    addiu       $a0, $sp, 0x20
    lw          $v0, 0x90($sp)
    lw          $a2, 0x9C($sp)
    .word       0x00460018  # mult        $v0, $a2
    .word       0x00003012  # mflo        $a2
    lw          $v0, 0x24($sp)
    addiu       $a0, $sp, 0x20
    lw          $v0, 0x8($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a3, $zero, 0x1
    lw          $v1, 0x30($s6)
    andi        $v1, $v1, 0x80
    beqz        $v1, .L80017710
    addu        $s3, $v0, $zero
    lw          $s5, 0x2C8($sp)
    j .L80017734
    addu        $s0, $s5, $zero
.L80017710:
    lw          $a1, 0x90($sp)
    lw          $v0, 0x94($sp)
    .word       0x00A20018  # mult        $a1, $v0
    .word       0x00002812  # mflo        $a1
    addu        $a0, $zero, $zero
    jal         func_80032E00
    sll         $a1, $a1, 1
    addu        $s5, $v0, $zero
    addu        $s0, $s5, $zero
.L80017734:
    lw          $a0, 0x90($sp)
    lw          $v1, 0x94($sp)
    lw          $v0, 0xAC($sp)
    addu        $s1, $a0, $zero
    sltu        $v0, $v0, $v1
    beqz        $v0, .L80017790
    addu        $s7, $v1, $zero
    sll         $v0, $a0, 16
    sra         $s2, $v0, 16
    sll         $s4, $s2, 1
.L8001775C:
    addiu       $a0, $sp, 0x20
    addu        $a1, $s3, $zero
    jal         func_800549E8
    addiu       $a2, $zero, 0x1
    lw          $a1, 0x0($s3)
    addu        $a0, $s0, $zero
    jal         func_8001AA60
    addu        $a2, $s2, $zero
    lw          $v0, 0xAC($sp)
    lw          $v1, 0x94($sp)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8001775C
    addu        $s0, $s0, $s4
.L80017790:
    jal         func_80055444
    addiu       $a0, $sp, 0x20
    jal         func_80054ED0
    addiu       $a0, $sp, 0x20
    addu        $a0, $s6, $zero
    andi        $a1, $s1, 0xFFFF
    lhu         $t0, 0x286($sp)
    andi        $a2, $s7, 0xFFFF
    sll         $a3, $fp, 16
    sll         $v0, $t0, 16
    lhu         $t0, 0x27E($sp)
    sra         $a3, $a3, 16
    sra         $v0, $v0, 16
    sw          $v0, 0x10($sp)
    sll         $v0, $t0, 16
    sra         $v0, $v0, 16
    sw          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x10
    jal         func_80017840
    sw          $v0, 0x18($sp)
    andi        $v0, $s1, 0x3
    beql        $v0, $zero, .L80017804
    sh          $s1, 0x1E($s6)
    addiu       $v0, $s1, 0x1
.L800177F0:
    addu        $s1, $v0, $zero
    andi        $v0, $v0, 0x3
    bnez        $v0, .L800177F0
    addiu       $v0, $s1, 0x1
    sh          $s1, 0x1E($s6)
.L80017804:
    sw          $s5, 0x4($s6)
    sw          $zero, 0x8($s6)
    lw          $ra, 0x2AC($sp)
    lw          $fp, 0x2A8($sp)
    lw          $s7, 0x2A4($sp)
    lw          $s6, 0x2A0($sp)
    lw          $s5, 0x29C($sp)
    lw          $s4, 0x298($sp)
    lw          $s3, 0x294($sp)
    lw          $s2, 0x290($sp)
    lw          $s1, 0x28C($sp)
    lw          $s0, 0x288($sp)
    addiu       $sp, $sp, 0x2B0
    jr          $ra
    nop
.end resource_archive_decode
