.text
.align 2
.set noreorder
.globl func_800B2E24
.ent func_800B2E24
func_800B2E24:
    lui         $v1, 0x8008
    lhu         $v1, 0x7914($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B2E60
    sw          $ra, 0x10($sp)
    jal         func_80036540
    addu        $a0, $zero, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    lui         $at, 0x8008
    sh          $zero, 0x7914($at)
    andi        $v0, $v0, 0xFFFD
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
.L800B2E60:
    lui         $a1, 0x8009
    lw          $a1, -0x6CB0($a1)
    beqz        $a1, .L800B2E88
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    jal         func_8000D834
    nop
    lui         $at, 0x8009
    sw          $zero, -0x6CB0($at)
.L800B2E88:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B2E24
