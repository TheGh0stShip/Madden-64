.text
.align 2
.set noreorder
.globl resource_buffers_process
.ent resource_buffers_process
resource_buffers_process:
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    addiu       $sp, $sp, -0x28
    sw          $ra, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s0, 0x8($a0)
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $s1, 0x30($v0)
    jal         func_8000C810
    nop
    lw          $a0, 0x38($s0)
    beqz        $a0, .L8001B720
    addu        $s0, $a0, $zero
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a0, $zero, $zero
    addiu       $s0, $s0, -0x1
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    addu        $a0, $zero, $zero
    lui         $a0, 0x40
    ori         $a0, $a0, 0x4240
    lui         $a1, 0x10
    jal         func_8000A63C
    ori         $a1, $a1, 0x4240
    lui         $a0, 0xE
    jal         func_8000B008
    ori         $a0, $a0, 0x3001
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    jal         func_8000A22C
    addiu       $a0, $zero, 0x80
    jal         func_8000A984
    lui         $a0, 0x8
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFE
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0x793C
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A270
    sw          $a1, 0x4($v1)
    jal         func_80009E58
    addu        $a0, $zero, $zero
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $zero, 0x10($sp)
    lui         $a2, 0x400
    ori         $a2, $a2, 0x103F
    lui         $a1, 0xB100
    ori         $a1, $a1, 0x206
    addiu       $a3, $zero, 0x604
.L8001B6E0:
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a0, $s0, $zero
    addiu       $s0, $s0, -0x1
    sw          $s1, 0x4($v1)
    addiu       $s1, $s1, 0x40
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, 0x10
    sw          $a2, 0x0($v1)
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a1, 0x8($v1)
    bnez        $a0, .L8001B6E0
    sw          $a3, 0xC($v1)
.L8001B720:
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end resource_buffers_process
