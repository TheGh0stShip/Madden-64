.text
.align 2
.set noreorder
.globl func_800A72F8
.ent func_800A72F8
func_800A72F8:
    addu        $v0, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x5F80($v0)
    beqz        $v0, .L800A7368
    addu        $a1, $zero, $zero
    addu        $a0, $v0, $zero
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x6188
.L800A7318:
    lw          $v0, 0x0($v1)
    beql        $v0, $a0, .L800A7338
    addu        $v1, $zero, $zero
    addiu       $a1, $a1, 0x1
    slti        $v0, $a1, 0x3
    bnez        $v0, .L800A7318
    addiu       $v1, $v1, 0x4
    addu        $v1, $zero, $zero
.L800A7338:
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x6188
.L800A7340:
    lw          $v0, 0x0($a0)
    beq         $v0, $s0, .L800A7360
    slt         $v0, $v1, $a1
    addiu       $v1, $v1, 0x1
    slti        $v0, $v1, 0x3
    bnez        $v0, .L800A7340
    addiu       $a0, $a0, 0x4
    slt         $v0, $v1, $a1
.L800A7360:
    beqz        $v0, .L800A736C
    nop
.L800A7368:
    addiu       $s1, $zero, 0x1
.L800A736C:
    beqz        $s1, . + 4 + (0xB << 2)
    addu        $a0, $s0, $zero
    lui         $at, 0x8008
    sw          $s0, -0x5F80($at)
    addiu       $a1, $zero, 0x2
    jal         func_80034D30
    addu        $a2, $zero, $zero
    j           func_800A2C7C
    addu        $v0, $s1, $zero
.end func_800A72F8
