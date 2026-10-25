.text
.align 2
.set noreorder
.globl func_8009C3BC
.ent func_8009C3BC
func_8009C3BC:
    andi        $v0, $s4, 0xFFF
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    andi        $v0, $s1, 0xFFF
    sll         $v0, $v0, 12
    sw          $v1, 0x0($a1)
    andi        $v1, $s0, 0xFFF
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($a1)
    sll         $v0, $s5, 16
    andi        $v1, $s6, 0xFFFF
    or          $v0, $v0, $v1
    sw          $v0, 0xC($a1)
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $v0, 0x10($a1)
    sw          $a2, 0x14($a1)
    lw          $ra, 0x70($sp)
    lw          $s7, 0x6C($sp)
    lw          $s6, 0x68($sp)
    lw          $s5, 0x64($sp)
    lw          $s4, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
.end func_8009C3BC
