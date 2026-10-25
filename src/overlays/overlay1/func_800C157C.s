.text
.align 2
.set noreorder
.globl func_800C157C
.ent func_800C157C
func_800C157C:
    nop
    lhu         $v0, 0x3C($s0)
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x6C40($at)
    lw          $v0, 0x14($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800C15B0
    nop
    lw          $v0, 0x14($s0)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($s0)
.L800C15B0:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C157C
