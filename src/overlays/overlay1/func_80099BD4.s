.text
.align 2
.set noreorder
.globl func_80099BD4
.ent func_80099BD4
func_80099BD4:
    lhu         $v0, 0x68($s1)
    sw          $v1, 0x74($s1)
    ori         $v0, $v0, 0x8
    sh          $v0, 0x68($s1)
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80099BD4
