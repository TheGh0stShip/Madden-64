.text
.align 2
.set noreorder
.globl func_800C11EC
.ent func_800C11EC
func_800C11EC:
    lui         $at, 0x8009
    sb          $zero, -0x5C02($at)
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800C11EC
