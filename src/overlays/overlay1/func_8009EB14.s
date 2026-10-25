.text
.align 2
.set noreorder
.globl func_8009EB14
.ent func_8009EB14
func_8009EB14:
    or          $a1, $a1, $a2
    addiu       $v0, $a3, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $v1, 0x0($a3)
    bnez        $t0, . + 4 + (-0x35 << 2)
    sw          $a1, 0x4($a3)
    lw          $ra, 0x6C($sp)
    lw          $fp, 0x68($sp)
    lw          $s7, 0x64($sp)
    lw          $s6, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end func_8009EB14
