.text
.align 2
.set noreorder
.globl func_800B3F7C
.ent func_800B3F7C
func_800B3F7C:
    lui         $a0, 0x8007
    lw          $a0, -0x158C($a0)
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x28($sp)
    jal         func_8001AEA8
    addiu       $a0, $a0, 0x44C
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    lui         $at, 0x8008
    sw          $v0, 0x6C74($at)
    addiu       $v0, $zero, 0x100
    sh          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x4
    addiu       $a1, $zero, 0x1
    addiu       $a2, $sp, 0x10
    sw          $zero, 0x18($sp)
    sh          $v0, 0x20($sp)
    addiu       $v1, $v1, 0x418
    jal         func_8000D740
    sw          $v1, 0x14($sp)
    addiu       $a0, $zero, 0xE
    lui         $at, 0x8007
    sw          $v0, -0x1588($at)
    sw          $zero, 0x1C($v0)
    jal         func_80041BB4
    sw          $zero, 0x20($v0)
    jal         func_8003E460
    nop
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B3F7C
