.text
.align 2
.set noreorder
.globl func_800AD184
.ent func_800AD184
func_800AD184:
    addu        $v0, $v0, $t1
    lw          $s0, 0x0($v0)
    lui         $a3, 0x8008
    lw          $a3, 0x4F80($a3)
    addu        $a1, $s2, $zero
    jal         func_8001D088
    addu        $a2, $s0, $zero
    lw          $a0, 0x0($s3)
    lbu         $v1, 0x0($s0)
    lui         $a2, 0x8008
    lw          $a2, 0x4F80($a2)
    lui         $a1, 0x8009
    lw          $a1, -0x7F6C($a1)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a1
    lbu         $a3, 0x5($v0)
    jal         func_8001D1E0
    addu        $a1, $s2, $zero
    lw          $a0, 0x0($fp)
    sll         $v0, $s5, 2
    lui         $t1, 0x8007
    addiu       $t1, $t1, -0x47FC
    addu        $v0, $v0, $t1
    lw          $a1, 0x0($v0)
    addu        $a2, $s4, $zero
    addiu       $s5, $s5, 0x1
    addiu       $s3, $s3, 0x4
    addiu       $s6, $s6, 0x180
    jal         func_8001A998
    addiu       $s4, $s4, 0x1
    sltiu       $v0, $s4, 0x3
    bnez        $v0, . + 4 + (-0x4B << 2)
    nop
    lw          $t1, 0x2C($sp)
    lhu         $v0, 0x0($t1)
    lw          $t1, 0x1C($sp)
    addiu       $v0, $v0, -0x1
    sltu        $v0, $t1, $v0
    beqz        $v0, .L800AD230
    addu        $v1, $zero, $zero
    addiu       $v1, $t1, 0x1
.L800AD230:
    addu        $s4, $zero, $zero
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lhu         $s7, 0x26($sp)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x7928
    lui         $s3, 0x8007
    addiu       $s3, $s3, -0x47F0
    addu        $s6, $zero, $zero
    sw          $v0, 0x6C($sp)
    sll         $v0, $s7, 2
    addu        $fp, $v0, $v1
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5EAC
    sll         $t1, $s7, 1
    addu        $v0, $t1, $v0
    sw          $v0, 0x7C($sp)
    sll         $v0, $s7, 3
    addu        $s5, $v0, $s7
    sw          $t1, 0x74($sp)
    lw          $t1, 0x6C($sp)
    addu        $v0, $t1, $s4
    lw          $t1, 0x2C($sp)
    lw          $v1, 0x0($fp)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t1
    lw          $t1, 0x7C($sp)
    lhu         $a0, 0x0($t1)
    lhu         $s1, 0x2($v0)
    addiu       $v0, $zero, 0x1
    beq         $a0, $v0, . + 4 + (0x32 << 2)
    addu        $s2, $v1, $s6
    slti        $v0, $a0, 0x2
    bnez        $v0, . + 4 + (0x2F << 2)
    addiu       $v0, $zero, 0x2
    bne         $a0, $v0, . + 4 + (0x2D << 2)
    nop
    beqz        $s7, .L800AD318
    sll         $s0, $s5, 2
    lui         $t1, 0x8007
    addiu       $t1, $t1, -0x47F0
    addu        $s0, $s0, $t1
    lw          $a0, 0x0($s0)
    lw          $t1, 0x34($sp)
    sll         $v0, $s1, 2
    lui         $a3, 0x8008
    lw          $a3, 0x4F80($a3)
    addu        $v0, $v0, $t1
    lw          $a2, 0x0($v0)
    jal         func_8001D088
    addu        $a1, $s2, $zero
    lw          $t1, 0x74($sp)
    lw          $a0, 0x0($s0)
    lui         $at, 0x8008
    addu        $at, $at, $t1
    lhu         $v1, -0x5ED8($at)
    j           func_800A8C24
    nop
.L800AD318:
    lw          $t1, 0x34($sp)
    lw          $a0, 0x0($s3)
    sll         $v0, $s1, 2
    addu        $v0, $v0, $t1
    lw          $s0, 0x0($v0)
    lui         $a3, 0x8008
    lw          $a3, 0x4F80($a3)
    addu        $a1, $s2, $zero
    jal         func_8001D088
    addu        $a2, $s0, $zero
    lw          $a0, 0x0($s3)
    lbu         $v1, 0x0($s0)
    lui         $a2, 0x8008
    lw          $a2, 0x4F80($a2)
    lui         $a1, 0x8009
    lw          $a1, -0x7F6C($a1)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a1
    lbu         $a3, 0x5($v0)
.end func_800AD184
