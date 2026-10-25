.text
.align 2
.set noreorder
.globl func_800C6A34
.ent func_800C6A34
func_800C6A34:
    lui         $v0, 0x8008
    lw          $v0, 0x55F8($v0)
    bnez        $v0, .L800C6A5C
    addu        $v1, $v0, $zero
    sw          $zero, 0x4($a0)
    sw          $zero, 0x0($a0)
    lui         $at, 0x8008
    sw          $a0, 0x55F8($at)
    j           func_800C2360
    nop
.L800C6A5C:
    lw          $v0, 0x0($v1)
    beql        $v0, $zero, .L800C6A7C
    sw          $zero, 0x0($a0)
.L800C6A68:
    lw          $v1, 0x0($v1)
    lw          $v0, 0x0($v1)
    bnez        $v0, .L800C6A68
    nop
    sw          $zero, 0x0($a0)
.L800C6A7C:
    sw          $v1, 0x4($a0)
    sw          $a0, 0x0($v1)
    jr          $ra
    nop
.end func_800C6A34
