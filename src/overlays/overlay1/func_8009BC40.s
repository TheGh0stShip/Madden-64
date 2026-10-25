.text
.align 2
.set noreorder
.globl func_8009BC40
.ent func_8009BC40
func_8009BC40:
    sll         $a1, $a1, 12
    andi        $a3, $a3, 0xFFF
    or          $a1, $a1, $a3
    addiu       $v0, $a2, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($a2)
    addiu       $v0, $a2, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $v1, 0x0($a2)
    sw          $a1, 0x4($a2)
    sw          $zero, 0xC($a2)
    sw          $v0, 0x10($a2)
    sw          $t0, 0x14($a2)
    lw          $ra, 0x68($sp)
    lw          $s1, 0x64($sp)
    lw          $s0, 0x60($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end func_8009BC40
