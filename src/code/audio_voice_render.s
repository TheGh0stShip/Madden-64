.text
.align 2
.set noreorder
.globl audio_voice_render
.ent audio_voice_render
audio_voice_render:
    lui         $v1, 0x8008
    lw          $v1, 0x5028($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x14($sp)
    bne         $v1, $v0, .L8003CE74
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    beqz        $v0, .L8003CDAC
    addiu       $a0, $zero, 0x7
    lw          $v0, 0x14($v0)
    addiu       $a2, $zero, -0x1
    addiu       $a1, $v0, 0xE0
.L8003CC10:
    lw          $v0, 0x18($a1)
    andi        $v0, $v0, 0x5
    bnez        $v0, .L8003CC54
    nop
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lb          $v0, 0x7B08($at)
    beql        $v0, $a2, .L8003CDA0
    addu        $v0, $a0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $a2, 0x7B10($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $a2, 0x7B08($at)
    j .L8003CD90
    nop
.L8003CC54:
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lb          $v0, -0x4870($at)
    beqz        $v0, .L8003CDA0
    addu        $v0, $a0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x5C00($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lbu         $v0, -0x7EF0($at)
    sltu        $v0, $v0, $v1
    beqz        $v0, .L8003CCA4
    addiu       $v0, $v1, -0x1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x5C00($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x5C00($at)
.L8003CCA4:
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lbu         $v0, -0x7EF0($at)
    sltu        $v0, $v1, $v0
    beqz        $v0, .L8003CCC8
    addiu       $v0, $v1, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x5C00($at)
.L8003CCC8:
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x5E48($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lbu         $v0, -0x7B78($at)
    sltu        $v0, $v0, $v1
    beqz        $v0, .L8003CD04
    addiu       $v0, $v1, -0x1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x5E48($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x5E48($at)
.L8003CD04:
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lbu         $v0, -0x7B78($at)
    sltu        $v0, $v1, $v0
    beqz        $v0, .L8003CD28
    addiu       $v0, $v1, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x5E48($at)
.L8003CD28:
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v0, 0x5C00($at)
    srl         $v0, $v0, 4
    sw          $v0, 0x0($a1)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v0, 0x5E48($at)
    srl         $v0, $v0, 4
    sw          $v0, 0x4($a1)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lbu         $v1, -0x7EF0($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v0, 0x5C00($at)
    bne         $v1, $v0, .L8003CDA0
    addu        $v0, $a0, $zero
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lbu         $v1, -0x7B78($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v0, 0x5E48($at)
    bne         $v1, $v0, .L8003CDA0
    addu        $v0, $a0, $zero
.L8003CD90:
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sb          $zero, -0x4870($at)
    addu        $v0, $a0, $zero
.L8003CDA0:
    addiu       $a0, $a0, -0x1
    bnez        $v0, .L8003CC10
    addiu       $a1, $a1, -0x20
.L8003CDAC:
    lui         $s0, 0x8007
    lw          $s0, 0x34F8($s0)
    addiu       $a0, $zero, -0x1
    beq         $s0, $a0, .L8003CE74
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x6CB8($v1)
    bltz        $v1, .L8003CE74
    slti        $v0, $v1, 0x2
    bnez        $v0, .L8003CDE8
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8003CE34
    nop
    j .L8003CE74
    nop
.L8003CDE8:
    lui         $v0, 0x8008
    lw          $v0, 0x7B6C($v0)
    lw          $v0, 0x18($v0)
    andi        $v0, $v0, 0x5
    bnez        $v0, .L8003CE74
    nop
    bnez        $v1, .L8003CE18
    addiu       $v0, $zero, 0x12C
    lui         $at, 0x8007
    sw          $a0, 0x34F8($at)
    j .L8003CE74
    nop
.L8003CE18:
    lui         $at, 0x8009
    sw          $v0, -0x7F5C($at)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sw          $v0, 0x6CB8($at)
    j .L8003CE74
    nop
.L8003CE34:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x7F5C($v0)
    subu        $v0, $v0, $v1
    lui         $at, 0x8009
    sw          $v0, -0x7F5C($at)
    bgez        $v0, .L8003CE74
    nop
    lui         $at, 0x8007
    sw          $a0, 0x34F8($at)
    addu        $a0, $s0, $zero
    jal         func_8003D2D4
    addiu       $a1, $zero, 0x1
    lui         $at, 0x8007
    sw          $s0, 0x34F8($at)
.L8003CE74:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end audio_voice_render
