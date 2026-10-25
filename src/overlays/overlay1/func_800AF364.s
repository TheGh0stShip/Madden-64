.text
.align 2
.set noreorder
.globl func_800AF364
.ent func_800AF364
func_800AF364:
    lui         $a0, 0x8007
    lw          $a0, -0x4708($a0)
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    lui         $a1, 0x8007
    lw          $a1, -0x4700($a1)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    ori         $v0, $v0, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
    jal         func_8000D874
    nop
    jal         func_8001AEA8
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, -0x5E80($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AF364
