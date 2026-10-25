.text
.align 2
.set noreorder
.globl func_800A2834
.ent func_800A2834
func_800A2834:
    addiu       $a0, $a0, 0x4F34
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3A($v0)
    lui         $a1, 0x8009
    lw          $a1, -0x7F4C($a1)
    lw          $a2, 0x0($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x7F48($v1)
    lui         $s1, 0x8009
    lhu         $s1, -0x6CE0($s1)
    lui         $at, 0x8009
    sh          $v0, -0x6CE0($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sw          $a1, 0x4F30($at)
    sw          $v1, 0x0($a0)
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, . + 4 + (0x7 << 2)
    lui         $v1, 0xEFFF
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.end func_800A2834
