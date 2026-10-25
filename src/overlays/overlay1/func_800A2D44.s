.text
.align 2
.set noreorder
.globl func_800A2D44
.ent func_800A2D44
func_800A2D44:
    sw          $v1, 0x8($a1)
    sw          $a0, 0xC($a1)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0xFF7F
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    andi        $v0, $v0, 0x4
    beqz        $v0, . + 4 + (0x2A << 2)
    nop
    jal         func_8009E958
    nop
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    jal         func_8009C9E8
    nop
    addiu       $a0, $zero, 0x19
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    jal         func_8002098C
    nop
    sll         $v0, $v0, 16
    beqz        $v0, . + 4 + (0x12 << 2)
    nop
    jal         func_8002099C
.end func_800A2D44
