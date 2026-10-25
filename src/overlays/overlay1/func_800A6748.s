.text
.align 2
.set noreorder
.globl func_800A6748
.ent func_800A6748
func_800A6748:
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x6
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x7FA8
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lw          $v1, 0x0($a0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($a0)
    sltiu       $v0, $v0, 0x79
    bnez        $v0, . + 4 + (0x9F << 2)
    addiu       $v0, $zero, 0x5
    lui         $v1, 0x8008
    lw          $v1, 0x7FA0($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    lw          $a1, 0x24($v1)
    j           func_800A211C
    addiu       $a0, $zero, 0xB
.end func_800A6748
