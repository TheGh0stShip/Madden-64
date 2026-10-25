.text
.align 2
.set noreorder
.globl gameplay_interface_dispatch
.ent gameplay_interface_dispatch
gameplay_interface_dispatch:
    addiu       $sp, $sp, -0x50
    sw          $s6, 0x48($sp)
    addu        $s6, $a1, $zero
    sw          $s4, 0x40($sp)
    addu        $s4, $a2, $zero
    sw          $s5, 0x44($sp)
    addu        $s5, $a3, $zero
    sw          $ra, 0x4C($sp)
    sw          $s3, 0x3C($sp)
    sw          $s2, 0x38($sp)
    sw          $s1, 0x34($sp)
    bnez        $a0, .L8002ACA4
    sw          $s0, 0x30($sp)
    j .L8002ACB4
    addu        $a1, $zero, $zero
.L8002ACA4:
    sltiu       $v0, $a0, 0xA
    beqz        $v0, .L8002ACB4
    addiu       $a1, $zero, 0x2
    addiu       $a1, $zero, 0x1
.L8002ACB4:
    beqz        $s6, .L8002ACE4
    addu        $s3, $zero, $zero
    addiu       $a0, $zero, 0x20
    addu        $v1, $s4, $zero
.L8002ACC4:
    lw          $v0, 0x0($v1)
    sb          $a0, 0x0($v0)
    lw          $v0, 0x0($v1)
    addiu       $s3, $s3, 0x1
    sb          $zero, 0x1($v0)
    sltu        $v0, $s3, $s6
    bnez        $v0, .L8002ACC4
    addiu       $v1, $v1, 0x4
.L8002ACE4:
    addiu       $v0, $zero, 0x1
    beq         $a1, $v0, .L8002AE4C
    addu        $s3, $zero, $zero
    slti        $v0, $a1, 0x2
    beql        $v0, $zero, .L8002AD0C
    addiu       $v0, $zero, 0x2
    beqz        $a1, .L8002AD1C
    nop
    j .L8002B18C
    nop
.L8002AD0C:
    beq         $a1, $v0, .L8002AFFC
    nop
    j .L8002B18C
    nop
.L8002AD1C:
    lh          $a0, 0x0($s5)
    lw          $a1, 0x0($s4)
    jal         func_800167FC
    addiu       $s3, $zero, 0x1
    lw          $a0, 0x0($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11C8
    jal         func_8002E688
    addiu       $s2, $zero, 0x4
    lh          $a0, 0x2($s5)
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s4)
    jal         func_8002E688
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11D0
    jal         func_8002E688
    nop
    lh          $a0, 0x4($s5)
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s4)
    jal         func_8002E688
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11D8
    jal         func_8002E688
    nop
    lh          $s0, 0x6($s5)
    beqz        $s0, .L8002ADE8
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x4($s4)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x4($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11E0
    jal         func_8002E688
    nop
    beq         $s0, $s3, .L8002ADE8
    addiu       $s3, $zero, 0x2
    lw          $a0, 0x4($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11EC
    jal         func_8002E688
    nop
.L8002ADE8:
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s5
    lh          $s0, 0x0($v0)
    blez        $s0, .L8002B18C
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    sll         $v0, $s3, 2
    addu        $s1, $v0, $s4
    lw          $a0, 0x0($s1)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11F0
    jal         func_8002E688
    nop
    addiu       $v0, $zero, 0x1
    beq         $s0, $v0, .L8002B18C
    nop
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11EC
    j .L8002B184
    nop
.L8002AE4C:
    lh          $s0, 0x0($s5)
    beqz        $s0, .L8002AEE4
    addiu       $s2, $zero, 0x1
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s4)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    beq         $s0, $s2, .L8002AE8C
    nop
    lw          $a0, 0x0($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x1204
    j .L8002AE98
    nop
.L8002AE8C:
    lw          $a0, 0x0($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x1214
.L8002AE98:
    jal         func_8002E688
    sll         $s0, $s3, 2
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s5
    lh          $a0, 0x0($v0)
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    addu        $s0, $s0, $s4
    lw          $a0, 0x0($s0)
    addiu       $s2, $s2, 0x1
    jal         func_8002E688
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s0)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11D8
    jal         func_8002E688
    addiu       $s3, $s3, 0x1
    j .L8002AEEC
    sll         $v0, $s2, 1
.L8002AEE4:
    addiu       $s2, $zero, 0x2
    sll         $v0, $s2, 1
.L8002AEEC:
    addu        $v0, $v0, $s5
    lh          $s0, 0x0($v0)
    beqz        $s0, .L8002AF94
    addiu       $s2, $s2, 0x1
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    sll         $v0, $s3, 2
    addu        $s1, $v0, $s4
    lw          $a0, 0x0($s1)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1
    beq         $s0, $v0, .L8002AF3C
    nop
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x1220
    j .L8002AF48
    nop
.L8002AF3C:
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x1230
.L8002AF48:
    jal         func_8002E688
    sll         $s0, $s3, 2
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s5
    lh          $a0, 0x0($v0)
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    addu        $s0, $s0, $s4
    lw          $a0, 0x0($s0)
    addiu       $s2, $s2, 0x1
    jal         func_8002E688
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s0)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11D8
    jal         func_8002E688
    addiu       $s3, $s3, 0x1
    j .L8002AF9C
    sll         $v0, $s2, 1
.L8002AF94:
    addiu       $s2, $s2, 0x1
    sll         $v0, $s2, 1
.L8002AF9C:
    addu        $v0, $v0, $s5
    lh          $s0, 0x0($v0)
    beqz        $s0, .L8002B18C
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    sll         $v0, $s3, 2
    addu        $s1, $v0, $s4
    lw          $a0, 0x0($s1)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11E0
    jal         func_8002E688
    nop
    addiu       $v0, $zero, 0x1
    beq         $s0, $v0, .L8002B18C
    nop
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11EC
    j .L8002B184
    nop
.L8002AFFC:
    lh          $s0, 0x0($s5)
    beqz        $s0, .L8002B050
    addiu       $s2, $zero, 0x1
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s4)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x123C
    jal         func_8002E688
    nop
    beq         $s0, $s2, .L8002B050
    addiu       $s3, $zero, 0x1
    lw          $a0, 0x0($s4)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11EC
    jal         func_8002E688
    nop
.L8002B050:
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s5
    lh          $s0, 0x0($v0)
    beqz        $s0, .L8002B0B8
    addiu       $s2, $s2, 0x1
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    sll         $v0, $s3, 2
    addu        $s1, $v0, $s4
    lw          $a0, 0x0($s1)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x1244
    jal         func_8002E688
    nop
    addiu       $v0, $zero, 0x1
    beq         $s0, $v0, .L8002B0B8
    addiu       $s3, $s3, 0x1
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11EC
    jal         func_8002E688
    nop
.L8002B0B8:
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s5
    lh          $s0, 0x0($v0)
    beqz        $s0, .L8002B120
    addiu       $s2, $s2, 0x1
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    sll         $v0, $s3, 2
    addu        $s1, $v0, $s4
    lw          $a0, 0x0($s1)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x124C
    jal         func_8002E688
    nop
    addiu       $v0, $zero, 0x1
    beq         $s0, $v0, .L8002B120
    addiu       $s3, $s3, 0x1
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x11EC
    jal         func_8002E688
    nop
.L8002B120:
    sltu        $v0, $s3, $s6
    beqz        $v0, .L8002B18C
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s5
    lh          $s0, 0x0($v0)
    beqz        $s0, .L8002B18C
    addu        $a0, $s0, $zero
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    sll         $v0, $s3, 2
    addu        $s1, $v0, $s4
    lw          $a0, 0x0($s1)
    jal         func_8002E65C
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1
    beq         $s0, $v0, .L8002B178
    nop
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x125C
    j .L8002B184
    nop
.L8002B178:
    lw          $a0, 0x0($s1)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x1270
.L8002B184:
    jal         func_8002E688
    nop
.L8002B18C:
    lw          $ra, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end gameplay_interface_dispatch
