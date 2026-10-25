.text
.align 2
.set noreorder
.globl func_8000E7F4
.ent func_8000E7F4
func_8000E7F4:
    addiu       $sp, $sp, -0x38
    sw          $s3, 0x2C($sp)
    addu        $s3, $a0, $zero
    sw          $s0, 0x20($sp)
    lui         $s0, 0xB900
    ori         $s0, $s0, 0x31D
    lui         $v0, 0x44
    ori         $v0, $v0, 0x2078
    lui         $v1, 0xC811
    ori         $v1, $v1, 0x2078
    sw          $s2, 0x28($sp)
    addiu       $s2, $sp, 0x10
    addu        $a1, $s2, $zero
    sw          $s1, 0x24($sp)
    addiu       $s1, $sp, 0x18
    addu        $a2, $s1, $zero
    sw          $ra, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s0, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $s0, 0x18($sp)
    jal         func_8000E490
    sw          $v1, 0x1C($sp)
    lui         $v0, 0x44
    ori         $v0, $v0, 0x3078
    lui         $v1, 0xC811
    ori         $v1, $v1, 0x3078
    addu        $a0, $s3, $zero
    addu        $a1, $s2, $zero
    addu        $a2, $s1, $zero
    sw          $s0, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $s0, 0x18($sp)
    jal         func_8000E490
    sw          $v1, 0x1C($sp)
    lui         $t0, 0xFC61
    ori         $t0, $t0, 0xFEC3
    lui         $a3, 0x55FE
    ori         $a3, $a3, 0x7F3F
    lui         $v1, 0xFC61
    ori         $v1, $v1, 0xFFFF
    lui         $v0, 0x5FFE
    ori         $v0, $v0, 0x7E38
    addu        $a0, $s3, $zero
    addu        $a1, $s2, $zero
    addu        $a2, $s1, $zero
    sw          $t0, 0x10($sp)
    sw          $a3, 0x14($sp)
    sw          $v1, 0x18($sp)
    jal         func_8000E490
    sw          $v0, 0x1C($sp)
    lui         $s4, 0xFC60
    ori         $s4, $s4, 0xFEC1
    lui         $v1, 0x55FE
    ori         $v1, $v1, 0x793C
    lui         $s0, 0xFC60
    ori         $s0, $s0, 0xFFFF
    lui         $v0, 0x5FFE
    ori         $v0, $v0, 0x7838
    addu        $a0, $s3, $zero
    addu        $a1, $s2, $zero
    addu        $a2, $s1, $zero
    sw          $s4, 0x10($sp)
    sw          $v1, 0x14($sp)
    sw          $s0, 0x18($sp)
    jal         func_8000E490
    sw          $v0, 0x1C($sp)
    lui         $v0, 0x55FE
    ori         $v0, $v0, 0x7339
    lui         $v1, 0x5FFE
    ori         $v1, $v1, 0x7238
    addu        $a0, $s3, $zero
    addu        $a1, $s2, $zero
    addu        $a2, $s1, $zero
    sw          $s4, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $s0, 0x18($sp)
    jal         func_8000E490
    sw          $v1, 0x1C($sp)
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8000E7F4
