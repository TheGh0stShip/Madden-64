.text
.align 2
.set noreorder
.globl func_800A9F70
.ent func_800A9F70
func_800A9F70:
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x14($s0)
    jal         func_8000C8EC
    nop
    beqz        $v0, . + 4 + (0xC << 2)
    nop
    lw          $v0, 0xC($s0)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x1C($v0)
    addu        $v0, $v0, $v1
.end func_800A9F70
