.text
.align 2
.set noreorder
.globl func_800B74D8
.ent func_800B74D8
func_800B74D8:
    lui         $at, 0x8007
    sw          $zero, 0x18F0($at)
    lui         $at, 0x8007
    sh          $zero, 0x18E2($at)
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
.end func_800B74D8
