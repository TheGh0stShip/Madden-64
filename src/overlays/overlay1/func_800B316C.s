.text
.align 2
.set noreorder
.globl func_800B316C
.ent func_800B316C
func_800B316C:
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x28($sp)
    jal         func_800AEAAC
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800B31B0
    nop
    jal         func_800AE9B4
    addiu       $a0, $sp, 0x10
    lw          $v0, 0x10($sp)
    beql        $v0, $zero, .L800B31A8
    addiu       $v0, $zero, 0x1
    jalr        $v0
    addiu       $a0, $sp, 0x10
    lhu         $v0, 0x20($sp)
.L800B31A8:
    lui         $at, 0x8009
    sh          $v0, -0x498C($at)
.L800B31B0:
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B316C
