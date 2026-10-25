.text
.align 2
.set noreorder
.globl func_800BCFBC
.ent func_800BCFBC
func_800BCFBC:
    lui         $at, 0x8008
    sw          $v1, -0x5BB4($at)
    lui         $at, 0x8008
    addu        $at, $at, $a1
    sw          $v0, -0x5BE0($at)
    j           func_800B8BB0
    nop
.end func_800BCFBC
