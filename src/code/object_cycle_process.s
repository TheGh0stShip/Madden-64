.text
.align 2
.set noreorder
.globl object_cycle_process
.ent object_cycle_process
object_cycle_process:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
.L8005873C:
    lw          $v0, 0x19C($s0)
    bnez        $v0, .L80058778
    nop
    lw          $v0, 0x1B4($s0)
    lw          $v0, 0x50($v0)
    bnez        $v0, .L80058768
    nop
    jal         func_80058624
    addu        $a0, $s0, $zero
    j .L80058770
    nop
.L80058768:
    jal         func_8005848C
    addu        $a0, $s0, $zero
.L80058770:
    beqz        $v0, .L80058A34
    addu        $v0, $zero, $zero
.L80058778:
    lw          $v1, 0x19C($s0)
    slti        $v0, $v1, 0xD0
    beqz        $v0, .L80058808
    slti        $v0, $v1, 0xCD
    beqz        $v0, .L800588F0
    addiu       $v0, $zero, 0xC4
    beq         $v1, $v0, .L80058950
    slti        $v0, $v1, 0xC5
    beqz        $v0, .L800587DC
    slti        $v0, $v1, 0xC2
    beqz        $v0, .L800587C0
    slti        $v0, $v1, 0xC0
    beqz        $v0, .L80058894
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800589B8
    nop
    j .L80058A04
    nop
.L800587C0:
    addiu       $v0, $zero, 0xC2
    beq         $v1, $v0, .L800588AC
    addiu       $v0, $zero, 0xC3
    beq         $v1, $v0, .L800588F0
    nop
    j .L80058A04
    nop
.L800587DC:
    addiu       $v0, $zero, 0xC9
    beq         $v1, $v0, .L800588C4
    slti        $v0, $v1, 0xC9
    bnez        $v0, .L800588F0
    addiu       $v0, $zero, 0xCB
    beq         $v1, $v0, .L800588F0
    slti        $v0, $v1, 0xCC
    beqz        $v0, .L80058940
    addu        $a0, $s0, $zero
    j .L800588DC
    nop
.L80058808:
    addiu       $v0, $zero, 0xDB
    beq         $v1, $v0, .L80058960
    slti        $v0, $v1, 0xDC
    beqz        $v0, .L80058844
    addiu       $v0, $zero, 0xD8
    beq         $v1, $v0, .L80058884
    slti        $v0, $v1, 0xD8
    bnez        $v0, .L800589B8
    addiu       $v0, $zero, 0xD9
    beq         $v1, $v0, .L80058914
    addiu       $v0, $zero, 0xDA
    beq         $v1, $v0, .L800588FC
    nop
    j .L80058A04
    nop
.L80058844:
    slti        $v0, $v1, 0xF0
    beqz        $v0, .L80058870
    slti        $v0, $v1, 0xE0
    beqz        $v0, .L80058980
    addiu       $v0, $zero, 0xDC
    beq         $v1, $v0, .L800589EC
    addiu       $v0, $zero, 0xDD
    beq         $v1, $v0, .L80058970
    nop
    j .L80058A04
    nop
.L80058870:
    addiu       $v0, $zero, 0xFE
    beq         $v1, $v0, .L800589A0
    nop
    j .L80058A04
    nop
.L80058884:
    jal         func_80056A88
    addu        $a0, $s0, $zero
    j .L800589F4
    nop
.L80058894:
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    jal         func_80056B50
    addu        $a2, $zero, $zero
    j .L800589F4
    nop
.L800588AC:
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x1
    jal         func_80056B50
    addu        $a2, $zero, $zero
    j .L800589F4
    nop
.L800588C4:
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    jal         func_80056B50
    addiu       $a2, $zero, 0x1
    j .L800589F4
    nop
.L800588DC:
    addiu       $a1, $zero, 0x1
    jal         func_80056B50
    addiu       $a2, $zero, 0x1
    j .L800589F4
    nop
.L800588F0:
    lw          $v1, 0x0($s0)
    j .L80058A0C
    addiu       $v0, $zero, 0x3B
.L800588FC:
    jal         func_80056F8C
    addu        $a0, $s0, $zero
    beqz        $v0, .L800589FC
    addiu       $v0, $zero, 0x1
    j .L80058A34
    sw          $zero, 0x19C($s0)
.L80058914:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x54
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
    addiu       $v0, $zero, 0x2
    j .L80058A34
    sw          $zero, 0x19C($s0)
.L80058940:
    jal         func_800578B8
    addu        $a0, $s0, $zero
    j .L800589F4
    nop
.L80058950:
    jal         func_80057AB0
    addu        $a0, $s0, $zero
    j .L800589F4
    nop
.L80058960:
    jal         func_80057EF0
    addu        $a0, $s0, $zero
    j .L800589F4
    nop
.L80058970:
    jal         func_80058210
    addu        $a0, $s0, $zero
    j .L800589F4
    nop
.L80058980:
    lw          $v0, 0x1B4($s0)
    sll         $v1, $v1, 2
    addu        $v0, $v0, $v1
    lw          $v0, -0x370($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L800589F4
    nop
.L800589A0:
    lw          $v0, 0x1B4($s0)
    lw          $v0, 0xC($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L800589F4
    nop
.L800589B8:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x5B
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x19C($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
    j .L8005873C
    sw          $zero, 0x19C($s0)
.L800589EC:
    jal         func_80058384
    addu        $a0, $s0, $zero
.L800589F4:
    bnel        $v0, $zero, .L8005873C
    sw          $zero, 0x19C($s0)
.L800589FC:
    j .L80058A34
    addu        $v0, $zero, $zero
.L80058A04:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x43
.L80058A0C:
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x19C($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L8005873C
    sw          $zero, 0x19C($s0)
.L80058A34:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end object_cycle_process
