.text
.align 2
.set noreorder
.globl func_800C1D58
.ent func_800C1D58
func_800C1D58:
    lw          $v0, 0x14($s1)
    and         $v0, $v0, $s7
    sw          $v0, 0x14($s1)
    sh          $s2, 0x3C($s1)
    addiu       $v0, $s3, 0x1
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xE
    bnez        $v0, . + 4 + (-0xB5 << 2)
    sll         $v0, $s3, 16
    lw          $ra, 0x4C($sp)
    lw          $fp, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_800C1D58
