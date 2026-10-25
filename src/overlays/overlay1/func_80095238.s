.text
.align 2
.set noreorder
.globl func_80095238
.ent func_80095238
func_80095238:
    lui         $v0, 0x8009
    lbu         $v0, -0x750A($v0)
    addiu       $sp, $sp, -0x30
    beqz        $v0, .L8009526C
    sw          $ra, 0x28($sp)
    jal         func_80029AD0
    nop
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x2F8C
    addiu       $a0, $sp, 0x10
    sw          $v0, 0x10($sp)
    jal         func_800AE924
    sh          $zero, 0x20($sp)
.L8009526C:
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6CE0($at)
    addiu       $v0, $zero, 0x56
    lui         $at, 0x8007
    sh          $v0, -0x4856($at)
    addiu       $v0, $zero, 0x51
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    addiu       $v0, $zero, 0x9
    lui         $at, 0x8007
    sh          $v0, -0x4844($at)
    addiu       $v0, $zero, 0x6
    lui         $at, 0x8007
    sh          $v0, -0x4842($at)
    lui         $v0, 0xFEC0
    lui         $at, 0x8008
    sw          $v0, 0x4F34($at)
    addiu       $v0, $zero, 0x19
    lui         $at, 0x8008
    sw          $zero, 0x4F30($at)
    lui         $at, 0x8009
    sh          $v0, -0x6CAC($at)
    jal         func_800BEE28
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    bnez        $v0, .L800952E8
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x6B04($at)
.L800952E8:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    addiu       $v1, $zero, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x6DDC($at)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x6DDC($at)
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80095238
