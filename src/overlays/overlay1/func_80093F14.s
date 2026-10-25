.text
.align 2
.set noreorder
.globl func_80093F14
.ent func_80093F14
func_80093F14:
    lh          $v0, 0x76DC($v0)
    xori        $v1, $v0, 0x2
    sltu        $v1, $zero, $v1
    xori        $v0, $v0, 0x4
    sltu        $v0, $zero, $v0
    and         $v1, $v1, $v0
    bnez        $v1, .L80093F48
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x79
    bnez        $v0, .L80093F64
    nop
.L80093F48:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x200
    bnez        $v0, .L80093F64
    nop
    jal         func_8009BCB0
    nop
.L80093F64:
    jal         func_8009C9E8
    nop
    jal         func_800C1BE0
    nop
    jal         func_800D5A40
    nop
    lui         $a0, 0x3BE3
    ori         $a0, $a0, 0xF7FF
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $a1, 0x8009
    lbu         $a1, -0x750D($a1)
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    and         $v0, $v0, $a0
    ori         $v0, $v0, 0x4000
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    beq         $a1, $v1, .L80093FCC
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    blez        $v0, .L80093FCC
    nop
    jal         func_800293CC
    nop
.L80093FCC:
    jal         func_800297A4
    nop
    jal         func_800E20C0
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x100
    bnez        $v0, .L80093FF8
    nop
    jal         func_800A365C
    addiu       $a0, $zero, 0x1
.L80093FF8:
    jal         func_800B1F84
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, . + 4 + (0x9 << 2)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4856($at)
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    lui         $at, 0x8007
    sh          $v0, -0x4844($at)
    lui         $at, 0x8007
.end func_80093F14
