.text
.align 2
.set noreorder
.globl func_8009AD18
.ent func_8009AD18
func_8009AD18:
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    lui         $a1, 0xFC12
    ori         $a1, $a1, 0x1824
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a0, 0xFF33
    ori         $a0, $a0, 0xFFFF
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a1, 0x0($v1)
    sw          $a0, 0x4($v1)
    lui         $a0, 0x40
    ori         $a0, $a0, 0x4340
    lui         $a1, 0x10
    jal         func_8000A63C
    ori         $a1, $a1, 0x4340
    j           func_80096688
    addu        $a0, $zero, $zero
.end func_8009AD18
