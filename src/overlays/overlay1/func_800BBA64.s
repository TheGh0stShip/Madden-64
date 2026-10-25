.text
.align 2
.set noreorder
.globl func_800BBA64
.ent func_800BBA64
func_800BBA64:
    sw          $v0, 0x1C($sp)
    lw          $a0, 0x10($s2)
    lw          $a1, 0x10($s3)
    addu        $a2, $s1, $zero
    jal         func_800B7420
    addu        $a3, $s0, $zero
    sw          $v0, 0x20($sp)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x5A0C
    lw          $a0, 0x0($s0)
    beqz        $a0, .L800BBAA8
    nop
    jal         func_8000C9AC
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x0($s0)
    jal         func_8000CA20
    addiu       $a1, $sp, 0x18
.L800BBAA8:
    lw          $ra, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800BBA64
