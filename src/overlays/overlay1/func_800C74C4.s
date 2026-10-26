.text
.align 2
.set noreorder
.globl func_800C74C4
.ent func_800C74C4
func_800C74C4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L800C75D8
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x6CA4($v0)
    lui         $at, 0x8008
    sb          $zero, 0x7AB0($at)
    addiu       $v0, $v0, -0x2
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    sltiu       $v0, $v1, 0x8
    beqz        $v0, .L800C7550
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x2F80($at)
    jr          $v0
    nop
    j           func_800C2E24
    addiu       $v0, $zero, 0xA
    j           func_800C2E24
    addiu       $v0, $zero, 0xE
    j           func_800C2E24
    addiu       $v0, $zero, 0x6
    j           func_800C2E24
    addiu       $v0, $zero, 0x14
    j           func_800C2E24
    addiu       $v0, $zero, 0x8
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8008
    sb          $v0, 0x7AB0($at)
.L800C7550:
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7AB0
    lbu         $v0, 0x0($s0)
    beqz        $v0, .L800C75D8
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7ABC($at)
    lh          $v0, 0x1C($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB2($at)
    lh          $v0, 0x20($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB4($at)
    jal         func_800C5F80
    nop
    lbu         $v1, 0x0($s0)
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800C75D8
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800C75D0
    addiu       $a0, $zero, 0x3A
    addiu       $a1, $zero, 0xF
    jal         func_80041DD4
    addiu       $a2, $zero, 0xF0
    j           func_800C2EB4
    nop
.L800C75D0:
    jal         menu_sound_play
    addiu       $a0, $zero, 0x1
.L800C75D8:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C74C4
