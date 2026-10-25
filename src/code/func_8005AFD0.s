.text
.align 2
.set noreorder
.globl func_8005AFD0
.ent func_8005AFD0
func_8005AFD0:
    addiu       $sp, $sp, -0x10
    lw          $v0, 0x20($a0)
    lw          $t4, 0x1A4($a0)
    lw          $v1, 0xD8($a0)
    blez        $v0, .L8005B0FC
    addu        $t3, $zero, $zero
    addiu       $t2, $v1, 0x2C
.L8005AFEC:
    lw          $v1, -0x20($t2)
    lw          $v0, -0x8($t2)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x138($a0)
    nop
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005B014
    nop
    break       7
.L8005B014:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005B02C
    lui         $at, 0x8000
    bne         $v1, $at, .L8005B02C
    nop
    break       6
.L8005B02C:
    .word       0x00003812  # mflo        $a3
    lw          $v0, 0x0($t2)
    nop
    .word       0x0043001B  # divu        $zero, $v0, $v1
    bnez        $v1, .L8005B048
    nop
    break       7
.L8005B048:
    .word       0x00003010  # mfhi        $a2
    bnez        $a2, .L8005B058
    addu        $a1, $a3, $zero
    addu        $a2, $v1, $zero
.L8005B058:
    bnez        $t3, .L8005B094
    addiu       $v0, $a2, -0x1
    .word       0x0045001A  # div         $zero, $v0, $a1
    bnez        $a1, .L8005B070
    nop
    break       7
.L8005B070:
    addiu       $at, $zero, -0x1
    bne         $a1, $at, .L8005B088
    lui         $at, 0x8000
    bne         $v0, $at, .L8005B088
    nop
    break       6
.L8005B088:
    .word       0x00001012  # mflo        $v0
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x48($t4)
.L8005B094:
    lw          $v0, 0x40($t4)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t4
    lw          $v1, 0x38($v0)
    sll         $a3, $a3, 1
    sll         $v0, $t3, 2
    addu        $v0, $v0, $v1
    lw          $t1, 0x0($v0)
    blez        $a3, .L8005B0E8
    addu        $a1, $zero, $zero
    sll         $v0, $a2, 2
    addu        $t0, $v0, $t1
    addu        $v0, $a2, $a1
.L8005B0C8:
    addiu       $a1, $a1, 0x1
    lw          $v1, -0x4($t0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t1
    sw          $v1, 0x0($v0)
    slt         $v0, $a1, $a3
    bnez        $v0, .L8005B0C8
    addu        $v0, $a2, $a1
.L8005B0E8:
    lw          $v0, 0x20($a0)
    addiu       $t3, $t3, 0x1
    slt         $v0, $t3, $v0
    bnez        $v0, .L8005AFEC
    addiu       $t2, $t2, 0x54
.L8005B0FC:
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end func_8005AFD0
