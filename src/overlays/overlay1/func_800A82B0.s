.text
.align 2
.set noreorder
.globl func_800A82B0
.ent func_800A82B0
func_800A82B0:
    addiu       $v0, $v1, 0x3
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0xEE
    sra         $v0, $v0, 2
    addu        $v0, $v1, $v0
    addiu       $a2, $zero, 0x11
    jal         func_800A6A70
    sw          $v0, 0x18($s0)
    lw          $v1, 0xA0($s0)
    lhu         $v0, 0x24($sp)
    addu        $v0, $v0, $v1
    sh          $v0, 0x24($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x18($s0)
.end func_800A82B0
