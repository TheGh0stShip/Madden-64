.text
.align 2
.set noreorder
.globl func_800984F4
.ent func_800984F4
func_800984F4:
    sh          $v0, 0xA8($v1)
    addu        $a0, $s1, $zero
    jal         func_8000CA20
    addiu       $a1, $sp, 0x18
    addu        $a0, $s1, $zero
    jal         func_8000C9AC
    addiu       $a1, $sp, 0x10
    lui         $a0, 0x8008
    lw          $a0, 0x6A2C($a0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lhu         $v0, 0xA8($a0)
    addu        $v0, $v0, $v1
    sh          $v0, 0xA8($a0)
    lhu         $v1, 0xC($s0)
    andi        $v0, $v0, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80098570
    nop
    lhu         $v0, 0xA6($a0)
    lhu         $v1, 0xA4($a0)
    sh          $zero, 0xA8($a0)
    addiu       $v0, $v0, 0x1
    sh          $v0, 0xA6($a0)
    andi        $v0, $v0, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80098570
    nop
    lw          $v0, 0xAC($a0)
    jalr        $v0
    nop
.L80098570:
    lw          $ra, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800984F4
