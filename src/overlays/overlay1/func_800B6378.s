.text
.align 2
.set noreorder
.globl func_800B6378
.ent func_800B6378
func_800B6378:
    sb          $v0, -0x4DF0($at)
    lui         $at, 0x8008
    sb          $s1, 0x7AF2($at)
    jal         func_800E0E24
    nop
    andi        $v0, $v0, 0xFFFF
    addiu       $v1, $zero, 0x1
    bnel        $v0, $v1, .L800B63A8
    addiu       $a0, $zero, 0x1
    jal         func_800E0CFC
    nop
    addiu       $a0, $zero, 0x1
.L800B63A8:
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x5
    jal         func_8001AEA8
    addu        $a0, $zero, $zero
.end func_800B6378
