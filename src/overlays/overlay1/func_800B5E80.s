.text
.align 2
.set noreorder
.globl func_800B5E80
.ent func_800B5E80
func_800B5E80:
    jal         func_8000C8A0
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x54A0($a1)
    jal         func_8000D998
    addu        $a0, $v0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8A0
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x79AC($a1)
    jal         func_8000D998
    addu        $a0, $v0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x6D28($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D24($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D20($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D1C($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D08($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D18($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D14($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D10($a0)
    jal         func_8000DA98
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D0C($a0)
    jal         func_8000DA98
    nop
    jal         func_800B1A80
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x4C94($a1)
    jal         func_8000D834
    nop
    jal         func_80016FD4
    nop
    jal         func_80035A7C
    andi        $a0, $v0, 0xFFFF
    lui         $a0, 0x8009
    lhu         $a0, -0x7F66($a0)
    jal         func_80016FC4
    nop
    jal         func_8000CDC0
    nop
    jal         func_800334B8
    nop
    jal         func_8001AB74
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    jal         func_8001AAD8
    addiu       $a1, $zero, 0x2C
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x46FC
    jal         func_8001AD78
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5E58($a0)
    jal         func_8001AC70
    nop
    lui         $at, 0x8007
    sb          $zero, 0x17F8($at)
    jal         func_8000BEE8
    addu        $a0, $zero, $zero
    jal         func_8000CDC0
    nop
    jal         func_800334B8
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B5E80
