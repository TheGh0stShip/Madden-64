.text
.align 2
.set noreorder
.globl func_800B7A60
.ent func_800B7A60
func_800B7A60:
    lui         $s2, 0x8008
    lw          $s2, 0x6178($s2)
    lhu         $v1, 0x4($v0)
    andi        $v0, $s0, 0x1
    addiu       $v0, $v0, 0xE
    lui         $at, 0x8008
    sw          $v0, -0x5DC4($at)
    lui         $v0, 0x80
    lui         $at, 0x8008
    sw          $v0, -0x5DC0($at)
    andi        $v0, $s6, 0xFF
    lui         $at, 0x8008
    sw          $v1, -0x5DDC($at)
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0x2D
    beqz        $v0, . + 4 + (0x30 << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1690($at)
    jr          $v0
    nop
.end func_800B7A60
