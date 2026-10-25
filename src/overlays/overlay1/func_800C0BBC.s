.text
.align 2
.set noreorder
.globl func_800C0BBC
.ent func_800C0BBC
func_800C0BBC:
    addiu       $a1, $zero, 0xB
    jal         func_8000D740
    addu        $a2, $s6, $zero
    addu        $a0, $v0, $zero
    addiu       $a1, $zero, 0x1
    jal         func_800950E0
    sw          $a0, 0x0($s0)
    lw          $v0, 0x0($s0)
    lw          $v1, 0x8($v0)
    addiu       $v0, $zero, 0x500
    sw          $v0, 0x28($v1)
    lw          $a0, 0x0($s0)
    jal         func_80034388
    addiu       $a1, $zero, 0x105
    bne         $s1, $s4, .L800C0C08
    nop
    lw          $a0, 0x20($s3)
    jal         func_80034388
    addiu       $a1, $zero, 0x106
.L800C0C08:
    bnez        $s1, .L800C0C30
    nop
    lw          $a0, 0x0($s3)
    lui         $at, 0x8007
    sw          $a0, -0x6520($at)
    jal         func_80033B20
    addiu       $a1, $zero, 0x1
    lw          $a0, 0x0($s3)
    jal         func_8009562C
    nop
.L800C0C30:
    lh          $v0, 0x0($s2)
    lw          $a0, 0x0($s0)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s5
    lhu         $a1, 0x0($v0)
    jal         func_80096A00
    addiu       $s2, $s2, 0x2
    lw          $v1, 0x0($s0)
    lui         $v0, 0x800C
    addiu       $v0, $v0, -0x348C
    sw          $v0, 0xC($v1)
    lw          $a0, 0x0($s0)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x2
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lw          $v0, 0x0($s0)
    sh          $s1, 0x3C($v0)
    addiu       $s1, $s1, 0x1
    slti        $v0, $s1, 0x9
    bnez        $v0, . + 4 + (-0x38 << 2)
    addiu       $s0, $s0, 0x4
    addu        $s1, $zero, $zero
.end func_800C0BBC
