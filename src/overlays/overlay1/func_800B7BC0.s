.text
.align 2
.set noreorder
.globl func_800B7BC0
.ent func_800B7BC0
func_800B7BC0:
    lw          $v0, 0x6178($v0)
    beq         $s2, $v0, .L800B7BE0
    andi        $v0, $s4, 0xFF
    lui         $at, 0x8008
    sh          $v0, 0x7988($at)
    andi        $v0, $s5, 0xFF
    lui         $at, 0x8008
    sh          $v0, 0x6BE0($at)
.L800B7BE0:
    lui         $a1, 0x8008
    lw          $a1, -0x5DDC($a1)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x1630
    jal         func_8002CA88
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x5DD8($a1)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x1648
    jal         func_8002CA88
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x5DE0($a1)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x165C
    jal         func_8002CA88
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x5DE8($a1)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x1674
    jal         func_8002CA88
    nop
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B7BC0
