.text
.align 2
.set noreorder
.globl func_80094C08
.ent func_80094C08
func_80094C08:
    addu        $a0, $s4, $zero
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x2
    addiu       $s0, $zero, 0xE0
    sb          $v0, 0x10($sp)
    sb          $zero, 0x11($sp)
    sb          $zero, 0x12($sp)
    jal         func_800E1A84
    sb          $s0, 0x13($sp)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    addiu       $v0, $zero, 0x1
    sb          $v0, 0x11($sp)
    sb          $s0, 0x12($sp)
    lw          $v0, 0x1C($v1)
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    sra         $v0, $v0, 18
    jal         func_800E1A84
    sb          $v0, 0x13($sp)
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x64
    sb          $zero, 0x11($sp)
    sb          $zero, 0x12($sp)
    jal         func_800E1A84
    sb          $v0, 0x13($sp)
    addu        $a0, $s4, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x9C
    sb          $zero, 0x11($sp)
    sb          $zero, 0x12($sp)
    jal         func_800E1A84
    sb          $v0, 0x13($sp)
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x4
    sb          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x41
    addiu       $s0, $zero, 0x20
    sb          $zero, 0x11($sp)
    sb          $v0, 0x12($sp)
    jal         func_800E1B00
    sb          $s0, 0x13($sp)
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x40
    jal         func_800E1B00
    sb          $v0, 0x13($sp)
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x60
    jal         func_800E1B00
    sb          $v0, 0x13($sp)
    addu        $a0, $s4, $zero
    addiu       $a1, $sp, 0x10
    jal         func_800E1B00
    sb          $s0, 0x13($sp)
    lw          $ra, 0x6C($sp)
    lw          $s4, 0x68($sp)
    lw          $s3, 0x64($sp)
    lw          $s2, 0x60($sp)
    lw          $s1, 0x5C($sp)
    lw          $s0, 0x58($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end func_80094C08
