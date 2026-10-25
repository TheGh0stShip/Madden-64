.text
.align 2
.set noreorder
.globl func_800B9050
.ent func_800B9050
func_800B9050:
    lui         $v1, 0x8009
    lw          $v1, -0x49DC($v1)
    lw          $v0, 0x20($v1)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    negu        $v0, $v0
    jal         func_8000C8DC
    sw          $v0, 0x20($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x7950($a0)
    beqz        $a0, .L800B908C
    addiu       $v1, $zero, -0x2
    lw          $v0, 0x14($a0)
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
.L800B908C:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800B9050
