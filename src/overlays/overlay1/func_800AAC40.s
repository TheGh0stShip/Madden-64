.text
.align 2
.set noreorder
.globl func_800AAC40
.ent func_800AAC40
func_800AAC40:
    sh          $v0, 0x66($s0)
    lhu         $a0, 0x14($s1)
    jal         func_8001A958
    nop
    lw          $a0, 0x14($s0)
    addiu       $a1, $s0, 0x5C
    sh          $v0, 0x60($s0)
    sh          $v0, 0x68($s0)
    jal         func_8000C9AC
    sw          $zero, 0x18($s0)
    lw          $a0, 0x14($s0)
    jal         func_8000CA20
    addiu       $a1, $s0, 0x1C
    lhu         $v0, 0x84($s0)
    sw          $zero, 0x3C($s0)
    sw          $zero, 0x40($s0)
    sw          $s1, 0x44($s0)
    ori         $v0, $v0, 0x10
    sh          $v0, 0x84($s0)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
.end func_800AAC40
