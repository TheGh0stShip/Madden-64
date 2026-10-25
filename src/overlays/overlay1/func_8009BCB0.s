.text
.align 2
.set noreorder
.globl func_8009BCB0
.ent func_8009BCB0
func_8009BCB0:
    sw          $v0, 0xC($v1)
    lw          $v0, 0x8($a0)
    sh          $a1, 0x4($v0)
    jr          $ra
    sh          $a2, 0x6($v0)
.end func_8009BCB0
