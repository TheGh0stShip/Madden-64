.text
.align 2
.set noreorder
.globl display_command_update
.ent display_command_update
display_command_update:
    addiu       $sp, $sp, -0x18
    lui         $a0, 0xBA00
    ori         $a0, $a0, 0x1402
    lui         $a1, 0xBA00
    ori         $a1, $a1, 0x1701
    lui         $a2, 0xB900
    ori         $a2, $a2, 0x201
    lui         $a3, 0x2
    ori         $a3, $a3, 0x2205
    lui         $t2, 0xB900
    ori         $t2, $t2, 0x31D
    lui         $t0, 0x55
    ori         $t0, $t0, 0x2078
    lui         $t3, 0xFC60
    ori         $t3, $t3, 0xFEC1
    lui         $t1, 0x55FE
    ori         $t1, $t1, 0x793C
    lui         $t4, 0xBB00
    ori         $t4, $t4, 0x1
    lui         $t5, 0xBA00
    ori         $t5, $t5, 0x602
    lui         $t6, 0xBA00
    ori         $t6, $t6, 0x1301
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    lui         $t7, 0xBA00
    ori         $t7, $t7, 0x1102
    sw          $s0, 0x0($sp)
    lui         $s0, 0xBA00
    ori         $s0, $s0, 0x1001
    sw          $s1, 0x4($sp)
    lui         $s1, 0xBA00
    ori         $s1, $s1, 0xC02
    sw          $s2, 0x8($sp)
    lui         $s2, 0xBA00
    ori         $s2, $s2, 0x903
    sw          $s3, 0xC($sp)
    lui         $s3, 0xB900
    ori         $s3, $s3, 0x2
    sw          $s4, 0x10($sp)
    lui         $s4, 0xBA00
    ori         $s4, $s4, 0xE02
    addiu       $v1, $v0, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x10
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    lui         $v1, 0x80
    sw          $v1, 0xC($v0)
    addiu       $v1, $v0, 0x18
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x20
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    lui         $v1, 0xB700
    sw          $v1, 0x18($v0)
    addiu       $v1, $v0, 0x28
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x30
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x38
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $zero, -0x1
    sw          $v1, 0x34($v0)
    addiu       $v1, $v0, 0x40
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x48
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    lui         $v1, 0x8
    sw          $v1, 0x44($v0)
    addiu       $v1, $v0, 0x50
    sw          $a0, 0x0($v0)
    sw          $zero, 0x4($v0)
    sw          $a1, 0x8($v0)
    sw          $a2, 0x10($v0)
    sw          $zero, 0x14($v0)
    sw          $a3, 0x1C($v0)
    sw          $t2, 0x20($v0)
    sw          $t0, 0x24($v0)
    sw          $t3, 0x28($v0)
    sw          $t1, 0x2C($v0)
    sw          $t4, 0x30($v0)
    sw          $t5, 0x38($v0)
    sw          $zero, 0x3C($v0)
    sw          $t6, 0x40($v0)
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x58
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x60
    sw          $t7, 0x48($v0)
    sw          $zero, 0x4C($v0)
    sw          $s0, 0x50($v0)
    sw          $zero, 0x54($v0)
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $zero, 0x2000
    sw          $v1, 0x5C($v0)
    addiu       $v1, $v0, 0x68
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $zero, 0xC00
    sw          $v1, 0x64($v0)
    addiu       $v1, $v0, 0x70
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x78
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    ori         $v1, $zero, 0x8000
    sw          $s1, 0x58($v0)
    sw          $s2, 0x60($v0)
    sw          $s3, 0x68($v0)
    sw          $zero, 0x6C($v0)
    sw          $s4, 0x70($v0)
    sw          $v1, 0x74($v0)
    lw          $s4, 0x10($sp)
    lw          $s3, 0xC($sp)
    lw          $s2, 0x8($sp)
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end display_command_update
