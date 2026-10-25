.text
.align 2
.set noreorder
.globl func_800975A0
.ent func_800975A0
func_800975A0:
    sw          $a0, 0x2DB8($at)
    lui         $a0, 0x8009
    lw          $a0, -0x7F6C($a0)
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a2, 0x2DBC($at)
    addu        $a0, $a0, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x2DB4($at)
    j           func_80092F48
    nop
.end func_800975A0
