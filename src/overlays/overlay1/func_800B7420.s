.text
.align 2
.set noreorder
.globl func_800B7420
.ent func_800B7420
func_800B7420:
    lui         $a1, 0x8007
    lw          $a1, 0x18F4($a1)
    jal         func_8000D998
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x6A28($a0)
    jal         func_80016FF4
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x800A
    addiu       $a1, $a1, 0x3164
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6CE8
    jal         func_8000CB78
    addu        $a2, $s0, $zero
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x5A20
    jal         func_800A2FF0
    nop
    jal         func_800B49CC
    nop
    jal         func_800BCFBC
    nop
    jal         func_800BF1C8
    nop
    lui         $at, 0x8009
    sh          $zero, -0x5080($at)
    jal         func_8000BEE8
    addiu       $a0, $zero, 0x1
    lui         $a1, 0x8008
    lbu         $a1, -0x5DB5($a1)
    jal         func_800A6590
    addu        $a0, $s0, $zero
    lui         $s3, 0x8009
    lw          $s3, -0x79E0($s3)
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    lui         $at, 0x8007
    sw          $zero, -0x564C($at)
    bne         $s3, $v0, . + 4 + (0x5 << 2)
    nop
.L800B74C8:
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    beq         $s3, $v0, .L800B74C8
    nop
.end func_800B7420
