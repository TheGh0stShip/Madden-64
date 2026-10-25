.text
.align 2
.set noreorder
.globl func_800A2800
.ent func_800A2800
func_800A2800:
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0xAF
    sw          $ra, 0x6C($sp)
    sw          $s2, 0x68($sp)
    sw          $s1, 0x64($sp)
    sw          $s0, 0x60($sp)
    jal         func_800AE924
    sh          $v0, 0x20($sp)
    jal         func_8003F6AC
    nop
    jal         func_800AD77C
    addu        $a0, $zero, $zero
    lui         $a0, 0x8008
.end func_800A2800
