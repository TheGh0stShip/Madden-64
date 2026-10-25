.text
.align 2
.set noreorder
.globl func_800B4004
.ent func_800B4004
func_800B4004:
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    jal         func_800B7D98
    sw          $s0, 0x10($sp)
    jal         func_8003D78C
    addu        $a0, $zero, $zero
    jal         func_8000BE80
    addu        $s5, $zero, $zero
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x4FB0
    lui         $s3, 0x8009
    addiu       $s3, $s3, -0x5058
.L800B4048:
    addu        $s2, $zero, $zero
    addu        $s0, $s3, $zero
    addu        $s1, $s4, $zero
.L800B4054:
    lw          $v0, 0x0($s0)
    beql        $v0, $zero, .L800B4080
    addiu       $s0, $s0, 0x4
    lw          $a1, 0x0($s1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lw          $a1, 0x0($s0)
    jal         func_8000D834
    addiu       $s0, $s0, 0x4
.L800B4080:
    addiu       $s2, $s2, 0x1
    sltiu       $v0, $s2, 0x2
    bnez        $v0, .L800B4054
    addiu       $s1, $s1, 0x4
    addiu       $s4, $s4, 0x8
    addiu       $s5, $s5, 0x1
    sltiu       $v0, $s5, 0x2
    bnez        $v0, .L800B4048
    addiu       $s3, $s3, 0x8
    lui         $a1, 0x8007
    lw          $a1, -0x1588($a1)
    beqz        $a1, .L800B40EC
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000D874
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8007
    lw          $a1, -0x1588($a1)
    jal         func_8000D834
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x6C74($a0)
    jal         func_8001AEA8
    nop
.L800B40EC:
    lui         $a0, 0x8008
    lw          $a0, 0x7760($a0)
    jal         func_8000DA98
    nop
    lui         $a1, 0x8007
    lw          $a1, -0x158C($a1)
    lui         $at, 0x8008
    sw          $zero, 0x7760($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sw          $zero, -0x158C($at)
    lui         $at, 0x8007
    sb          $zero, -0x1590($at)
    lui         $at, 0x8007
    sb          $zero, -0x158F($at)
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B4004
