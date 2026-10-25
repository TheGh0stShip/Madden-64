.text
.align 2
.set noreorder
.globl bitstream_record_decode
.ent bitstream_record_decode
bitstream_record_decode:
    addiu       $sp, $sp, -0x18
    lbu         $v0, 0xC($a1)
    addu        $t4, $a0, $zero
    beqz        $v0, .L8002FC5C
    addiu       $t3, $zero, 0x1
    lbu         $v0, 0x4($a1)
    lbu         $a0, 0x7($a1)
    sll         $t1, $v0, 1
    srl         $v1, $a0, 4
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v1, $v0, 1
    sltiu       $v0, $v1, 0x1F
    bnez        $v0, .L8002F978
    andi        $a0, $a0, 0xF
    addiu       $v1, $zero, 0x1E
.L8002F978:
    andi        $v0, $a3, 0x4000
    bnez        $v0, .L8002F9C4
    nop
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00C20019  # multu       $a2, $v0
    addu        $v0, $v1, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $t2, -0x79C8($at)
    .word       0x0000C810  # mfhi        $t9
    srl         $v1, $t9, 3
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    subu        $t0, $a2, $v0
    j .L8002FA00
    addu        $t8, $v1, $zero
.L8002F9C4:
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00C20019  # multu       $a2, $v0
    addu        $v0, $v1, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $t2, -0x7AF8($at)
    .word       0x0000C810  # mfhi        $t9
    srl         $t0, $t9, 3
    sll         $v0, $t0, 2
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 1
    subu        $v1, $a2, $v0
    addu        $t8, $t0, $zero
.L8002FA00:
    bnez        $t8, .L8002FA10
    andi        $v0, $a3, 0x4000
    bnel        $v0, $zero, .L8002FA10
    addu        $t0, $v1, $zero
.L8002FA10:
    beqz        $t2, .L8002FC5C
    sll         $v0, $v1, 2
    addu        $v0, $v0, $t2
    lw          $t6, 0x4($v0)
    sll         $v0, $t0, 2
    lb          $v1, 0xF($a1)
    addu        $v0, $v0, $t2
    lw          $t5, 0x4($v0)
    bltz        $v1, .L8002FA4C
    sll         $v0, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $t0, 0x1C58($at)
    j .L8002FA64
    nop
.L8002FA4C:
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1C58
    sll         $v1, $v1, 1
    subu        $v0, $v0, $v1
    lhu         $v0, 0x0($v0)
    sll         $t0, $v0, 1
.L8002FA64:
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x1C58
    lhu         $t7, 0x0($v1)
    beqz        $t8, .L8002FAA4
    sltiu       $v0, $a0, 0x5
    lb          $v0, 0xE($a1)
    bltz        $v0, .L8002FA94
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    lhu         $t7, 0x0($v0)
    j .L8002FAA4
    sltiu       $v0, $a0, 0x5
.L8002FA94:
    subu        $v0, $v1, $v0
    lhu         $v0, 0x0($v0)
    sll         $t7, $v0, 1
    sltiu       $v0, $a0, 0x5
.L8002FAA4:
    bnel        $v0, $zero, .L8002FAAC
    srl         $t0, $t0, 2
.L8002FAAC:
    lbu         $v0, 0xD($a1)
    .word       0x00490018  # mult        $v0, $t1
    .word       0x00001012  # mflo        $v0
    lbu         $v1, 0xC($a1)
    lbu         $a1, 0x6($a1)
    addu        $v0, $t4, $v0
    addu        $a3, $v0, $v1
    andi        $v0, $a1, 0x1C
    beqz        $v0, .L8002FB04
    andi        $v0, $a1, 0x10
    beqz        $v0, .L8002FAE4
    andi        $v0, $a1, 0x8
    negu        $t1, $t1
    negu        $t3, $t3
.L8002FAE4:
    beqz        $v0, .L8002FAF4
    andi        $v0, $a1, 0x4
    addu        $t3, $t1, $zero
    addiu       $t1, $zero, -0x1
.L8002FAF4:
    beqz        $v0, .L8002FB04
    nop
    negu        $t3, $t1
    addiu       $t1, $zero, 0x1
.L8002FB04:
    lbu         $v0, 0x0($t2)
    beqz        $v0, .L8002FC5C
    addu        $t4, $zero, $zero
.L8002FB10:
    addu        $a0, $a3, $zero
    beqz        $t8, .L8002FB88
    addu        $a1, $t7, $zero
    lbu         $v0, 0x1($t2)
    beqz        $v0, .L8002FBA8
    addu        $a2, $zero, $zero
.L8002FB28:
    andi        $v0, $t6, 0x1
    beqz        $v0, .L8002FB50
    andi        $v0, $a1, 0x1
    lbu         $v1, 0x0($a0)
    sltiu       $v0, $v1, 0x78
    bnez        $v0, .L8002FB50
    andi        $v0, $a1, 0x1
    addiu       $v0, $v1, -0x18
    sb          $v0, 0x0($a0)
    andi        $v0, $a1, 0x1
.L8002FB50:
    bnel        $v0, $zero, .L8002FB58
    subu        $a0, $a0, $t1
.L8002FB58:
    andi        $v0, $a1, 0x2
    bnel        $v0, $zero, .L8002FB64
    addu        $a0, $a0, $t1
.L8002FB64:
    srl         $t6, $t6, 1
    srl         $a1, $a1, 2
    lbu         $v0, 0x1($t2)
    addiu       $a2, $a2, 0x1
    sltu        $v0, $a2, $v0
    bnez        $v0, .L8002FB28
    addu        $a0, $a0, $t3
    j .L8002FBAC
    andi        $v0, $a1, 0x1
.L8002FB88:
    andi        $v0, $a1, 0x1
    bnel        $v0, $zero, .L8002FB94
    subu        $a0, $a3, $t1
.L8002FB94:
    andi        $v0, $a1, 0x2
    bnel        $v0, $zero, .L8002FBA0
    addu        $a0, $a0, $t1
.L8002FBA0:
    srl         $a1, $a1, 2
    addu        $a0, $a0, $t3
.L8002FBA8:
    andi        $v0, $a1, 0x1
.L8002FBAC:
    bnel        $v0, $zero, .L8002FBB4
    subu        $a0, $a0, $t1
.L8002FBB4:
    andi        $v0, $a1, 0x2
    bnel        $v0, $zero, .L8002FBC0
    addu        $a0, $a0, $t1
.L8002FBC0:
    srl         $a1, $a1, 2
    lbu         $v0, 0x1($t2)
    addu        $a0, $a0, $t3
    beqz        $v0, .L8002FC2C
    addu        $a2, $zero, $zero
.L8002FBD4:
    andi        $v0, $t5, 0x1
    beqz        $v0, .L8002FBFC
    andi        $v0, $a1, 0x1
    lbu         $v1, 0x0($a0)
    sltiu       $v0, $v1, 0x78
    bnez        $v0, .L8002FBFC
    andi        $v0, $a1, 0x1
    addiu       $v0, $v1, -0x18
    sb          $v0, 0x0($a0)
    andi        $v0, $a1, 0x1
.L8002FBFC:
    bnel        $v0, $zero, .L8002FC04
    subu        $a0, $a0, $t1
.L8002FC04:
    andi        $v0, $a1, 0x2
    bnel        $v0, $zero, .L8002FC10
    addu        $a0, $a0, $t1
.L8002FC10:
    srl         $t5, $t5, 1
    srl         $a1, $a1, 2
    lbu         $v0, 0x1($t2)
    addiu       $a2, $a2, 0x1
    sltu        $v0, $a2, $v0
    bnez        $v0, .L8002FBD4
    addu        $a0, $a0, $t3
.L8002FC2C:
    andi        $v0, $t0, 0x1
    beqz        $v0, .L8002FC3C
    addu        $a3, $a3, $t1
    subu        $a3, $a3, $t3
.L8002FC3C:
    andi        $v0, $t0, 0x2
    bnel        $v0, $zero, .L8002FC48
    addu        $a3, $a3, $t3
.L8002FC48:
    lbu         $v0, 0x0($t2)
    addiu       $t4, $t4, 0x1
    sltu        $v0, $t4, $v0
    bnez        $v0, .L8002FB10
    srl         $t0, $t0, 2
.L8002FC5C:
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end bitstream_record_decode
