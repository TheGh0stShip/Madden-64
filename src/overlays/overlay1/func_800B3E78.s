.text
.align 2
.set noreorder
.globl func_800B3E78
.ent func_800B3E78
func_800B3E78:
    lw          $a0, 0x0($s0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sw          $a0, 0x44C($v0)
    lw          $a0, 0x0($s0)
    beqz        $a0, .L800B3E9C
    addiu       $s0, $s0, 0x4
    jal         func_80016FE4
    nop
.L800B3E9C:
    addiu       $s3, $s3, 0x1
    sltiu       $v0, $s3, 0x2
    bnez        $v0, . + 4 + (-0xF << 2)
    addiu       $s1, $s1, 0x1
    lui         $at, 0x8009
    addu        $at, $at, $s4
    lw          $v0, -0x5058($at)
    bnel        $v0, $zero, .L800B3EF8
    addiu       $s7, $s7, 0x214C
    lui         $at, 0x8009
    addu        $at, $at, $s4
    lw          $v0, -0x5054($at)
    bnel        $v0, $zero, .L800B3EF8
    addiu       $s7, $s7, 0x214C
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s7
    lw          $a0, 0x2DD0($at)
    sll         $v1, $s2, 2
    addu        $v0, $v0, $v1
    sw          $a0, 0x480($v0)
    addiu       $s7, $s7, 0x214C
.L800B3EF8:
    addiu       $s4, $s4, 0x8
    addiu       $s6, $s6, 0x8
    addiu       $s2, $s2, 0x1
    sltiu       $v0, $s2, 0x2
    bnez        $v0, . + 4 + (-0x2B << 2)
    addiu       $s5, $s5, 0x2
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7760($v0)
    sw          $v0, 0x46C($v1)
    sw          $v0, 0x470($v1)
    sw          $v0, 0x478($v1)
    sw          $v0, 0x47C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x2DCC($v0)
    sw          $v0, 0x454($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x4F18($v0)
    sw          $v0, 0x458($v1)
    lw          $ra, 0xFC($sp)
    lw          $fp, 0xF8($sp)
    lw          $s7, 0xF4($sp)
    lw          $s6, 0xF0($sp)
    lw          $s5, 0xEC($sp)
    lw          $s4, 0xE8($sp)
    lw          $s3, 0xE4($sp)
    lw          $s2, 0xE0($sp)
    lw          $s1, 0xDC($sp)
    lw          $s0, 0xD8($sp)
    addiu       $sp, $sp, 0x100
    jr          $ra
    nop
.end func_800B3E78
