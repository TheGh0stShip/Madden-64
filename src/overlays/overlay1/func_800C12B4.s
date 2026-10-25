.text
.align 2
.set noreorder
.globl func_800C12B4
.ent func_800C12B4
func_800C12B4:
    addiu       $s7, $s7, 0x6C40
    sw          $s6, 0x28($sp)
    lui         $s6, 0x8009
    addiu       $s6, $s6, -0x6CF8
    sw          $s5, 0x24($sp)
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x4E08
    sw          $ra, 0x30($sp)
    sw          $s4, 0x20($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lhu         $v1, 0x3C($s3)
.end func_800C12B4
