.text
.align 2
.set noreorder
.globl func_80098088
.ent func_80098088
func_80098088:
    addu        $a1, $s0, $zero
    addiu       $v0, $a1, 0xA
    lui         $at, 0x8008
    sw          $a1, 0x7784($at)
    lui         $at, 0x8008
    sw          $v0, 0x7788($at)
    jal         func_800167FC
    nop
    lui         $a0, 0x8008
    lh          $a0, 0x2D94($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7788($a1)
    jal         func_800167FC
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F14($v1)
    lui         $a2, 0x8008
    lw          $a2, 0x2DC8($a2)
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x6
    sh          $v0, 0x2C($sp)
    addiu       $v0, $zero, 0x2B
    sw          $zero, 0x40($sp)
    sh          $zero, 0x2E($sp)
    sh          $zero, 0x30($sp)
    sw          $zero, 0x38($sp)
    sw          $zero, 0x34($sp)
    sw          $v0, 0x28($sp)
    lui         $at, 0x8008
.end func_80098088
