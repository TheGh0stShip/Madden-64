.text
.align 2
.set noreorder
.globl func_800B0468
.ent func_800B0468
func_800B0468:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x1C($sp)
    addu        $s1, $zero, $zero
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    jal         func_800AD404
    sw          $s0, 0x18($sp)
    jal         func_800AD460
    addiu       $s4, $zero, -0x1
    jal         func_800AD49C
    addiu       $s2, $zero, 0x68
    lui         $a0, 0x8008
    lw          $a0, 0x57E4($a0)
    addiu       $v0, $zero, 0x6
    lui         $at, 0x8007
    sw          $v0, -0x4674($at)
    beqz        $a0, .L800B04D4
    nop
    jal         func_800AD124
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x57E4($v1)
    lui         $at, 0x8007
    sw          $v0, -0x4670($at)
    lbu         $s4, 0x1E($v1)
.L800B04D4:
    lui         $v1, 0x8009
    lw          $v1, -0x5078($v1)
    lui         $v0, 0x8008
    lhu         $v0, 0x57E0($v0)
    lui         $at, 0x8007
    sw          $zero, -0x466C($at)
    lui         $at, 0x8007
    sw          $zero, -0x4668($at)
    lui         $at, 0x8007
    sw          $zero, -0x4664($at)
    lui         $at, 0x8007
    sw          $zero, -0x4660($at)
    addiu       $v0, $v0, -0x1
    sll         $v0, $v0, 16
    lui         $at, 0x8007
    sw          $v1, -0x465C($at)
    sra         $v1, $v0, 16
    sltiu       $v0, $v1, 0x17
    beqz        $v0, . + 4 + (0x1C5 << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xF18($at)
    jr          $v0
    nop
.end func_800B0468
