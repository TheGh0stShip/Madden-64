.text
.align 2
.set noreorder
.globl func_800AACE8
.ent func_800AACE8
func_800AACE8:
    andi        $v0, $v0, 0xFBFF
    beqz        $v1, .L800AAD00
    sh          $v0, 0x84($s0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
.L800AAD00:
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    jal         func_800451C8
    sw          $v0, 0xC($s0)
    lui         $v0, 0x8009
    lh          $v0, -0x4DA8($v0)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x6DEC($at)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x2
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $at, 0x8008
    sb          $s1, -0x5F50($at)
    andi        $a1, $s1, 0xFF
    sltiu       $v0, $a1, 0xA
    beqz        $v0, . + 4 + (0x5C << 2)
    sll         $v0, $a1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xE00($at)
    jr          $v0
    nop
.end func_800AACE8
