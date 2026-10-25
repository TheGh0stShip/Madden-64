.text
.align 2
.set noreorder
.globl func_80098980
.ent func_80098980
func_80098980:
    lhu         $v0, -0x4858($v0)
    beqz        $v0, .L8009899C
    nop
    jal         func_80041E4C
    nop
    lui         $at, 0x8008
    sh          $zero, 0x712E($at)
.L8009899C:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80098980
