.text
.align 2
.set noreorder
.globl func_800A0224
.ent func_800A0224
func_800A0224:
    lui         $v1, 0x8008
    lw          $v1, 0x793C($v1)
    lui         $a1, 0x8008
    lw          $a1, 0x4F34($a1)
    lui         $a0, 0xFE50
    lui         $at, 0x8008
    sw          $a0, 0xC40($at)
    lui         $at, 0x8008
    sw          $a0, 0xC70($at)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addiu       $sp, $sp, -0x18
    lui         $v0, 0x1B0
    lui         $at, 0x8008
    sw          $v0, 0xC50($at)
    lui         $v0, 0xFE60
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0xC44
    sw          $ra, 0x14($sp)
    lui         $at, 0x8008
    sw          $v0, 0xC60($at)
    sw          $v1, 0x0($s0)
    lui         $at, 0x8008
    sw          $a1, 0xC64($at)
    lui         $a1, 0x8009
    lw          $a1, -0x7B80($a1)
    lui         $v0, 0xFF60
    addu        $v0, $v1, $v0
    lui         $at, 0x8008
    sw          $v0, 0xC74($at)
    lui         $v0, 0x1A5
    lui         $at, 0x8008
    sw          $v1, 0xC54($at)
    sw          $v1, 0x20($a1)
    jal         func_8000C8EC
    sw          $v0, 0x1C($a1)
    beqz        $v0, .L800A02F4
    addu        $a0, $zero, $zero
    addiu       $v1, $s0, -0x4
.L800A02C4:
    lw          $v0, 0x0($v1)
    addiu       $a0, $a0, 0x1
    negu        $v0, $v0
    sw          $v0, 0x0($v1)
    sltiu       $v0, $a0, 0x4
    bnez        $v0, .L800A02C4
    addiu       $v1, $v1, 0x10
    lui         $v1, 0x8009
    lw          $v1, -0x7B80($v1)
    lw          $v0, 0x1C($v1)
    negu        $v0, $v0
    sw          $v0, 0x1C($v1)
.L800A02F4:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A0224
