.text
.align 2
.set noreorder
.globl func_800BBC20
.ent func_800BBC20
func_800BBC20:
    addiu       $sp, $sp, -0x20
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x1948
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lbu         $v0, 0x0($v1)
    beqz        $v0, .L800BBD8C
    nop
    lui         $v0, 0x8007
    lw          $v0, 0x1940($v0)
    beqz        $v0, .L800BBCAC
    nop
    addiu       $s1, $v1, -0xC
.L800BBC58:
    lui         $v0, 0x8007
    lw          $v0, 0x1940($v0)
    lhu         $a0, 0x22($v0)
    jal         func_800B74D8
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    jal         func_800B74D8
    addu        $s0, $v0, $zero
    andi        $s0, $s0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sltu        $v0, $v0, $s0
    bnez        $v0, .L800BBCAC
    nop
    lw          $v0, 0x4($s1)
    lui         $v1, 0x8007
    lw          $v1, 0x1940($v1)
    sw          $v0, 0x0($s1)
    lw          $v0, 0x0($v1)
    bnez        $v0, .L800BBC58
    sw          $v0, 0x4($s1)
.L800BBCAC:
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x193C
    lw          $v0, 0x0($v1)
    beqz        $v0, .L800BBD28
    nop
    addiu       $s1, $v1, 0x4
.L800BBCC4:
    lui         $v0, 0x8007
    lw          $v0, 0x193C($v0)
    lhu         $a0, 0x22($v0)
    jal         func_800B74D8
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    jal         func_800B74D8
    addu        $s0, $v0, $zero
    andi        $s0, $s0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sltu        $s0, $s0, $v0
    bnez        $s0, .L800BBD18
    nop
    lw          $v0, -0x4($s1)
    lui         $v1, 0x8007
    lw          $v1, 0x193C($v1)
    sw          $v0, 0x0($s1)
    lw          $v0, 0x4($v1)
    bnez        $v0, .L800BBCC4
    sw          $v0, -0x4($s1)
.L800BBD18:
    lui         $v0, 0x8007
    lw          $v0, 0x193C($v0)
    bnez        $v0, .L800BBD44
    nop
.L800BBD28:
    lui         $v0, 0x8007
    lw          $v0, 0x1940($v0)
    lui         $at, 0x8007
    sw          $v0, 0x193C($at)
    lw          $v0, 0x0($v0)
    lui         $at, 0x8007
    sw          $v0, 0x1940($at)
.L800BBD44:
    lui         $a2, 0x8007
    addiu       $a2, $a2, 0x1940
    lw          $v0, 0x0($a2)
    bnez        $v0, .L800BBD70
    nop
    lui         $v0, 0x8007
    lw          $v0, 0x193C($v0)
    sw          $v0, 0x0($a2)
    lw          $v0, 0x4($v0)
    lui         $at, 0x8007
    sw          $v0, 0x193C($at)
.L800BBD70:
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    lui         $a1, 0x8007
    lw          $a1, 0x193C($a1)
    lw          $a2, 0x0($a2)
    jal         func_800B71FC
    nop
.L800BBD8C:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BBC20
