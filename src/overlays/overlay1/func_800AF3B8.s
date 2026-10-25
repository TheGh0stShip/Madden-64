.text
.align 2
.set noreorder
.globl func_800AF3B8
.ent func_800AF3B8
func_800AF3B8:
    lui         $a0, 0x8007
    lw          $a0, -0x4708($a0)
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    lui         $a1, 0x8007
    lw          $a1, -0x4700($a1)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    andi        $v0, $v0, 0xFFFE
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
    jal         func_8000D834
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5E80($a0)
    jal         func_8001AEA8
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AF3B8
