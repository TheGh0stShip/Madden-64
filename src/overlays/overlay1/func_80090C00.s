.text
.align 2
.set noreorder
.globl func_80090C00
.ent func_80090C00
func_80090C00:
    lui         $at, 0x8008
    sh          $zero, 0x2DA6($at)
    lui         $at, 0x8008
    sh          $zero, 0x2DAA($at)
    lui         $at, 0x8008
    sh          $zero, 0x2DAE($at)
    lui         $at, 0x8008
    sh          $v0, 0x2DA2($at)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x2D98
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x4EE4
    lw          $v0, 0x0($a1)
    lw          $v1, 0x4($a1)
    sw          $v0, 0x0($a0)
    sw          $v1, 0x4($a0)
    lw          $v0, 0x8($a1)
    lw          $v1, 0xC($a1)
    sw          $v0, 0x8($a0)
    sw          $v1, 0xC($a0)
    lw          $v0, 0x10($a1)
    lw          $v1, 0x14($a1)
    sw          $v0, 0x10($a0)
    sw          $v1, 0x14($a0)
    addu        $a1, $zero, $zero
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x7F10
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6CE0($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x76DC($at)
    lui         $at, 0x8009
    sb          $zero, -0x6AEC($at)
    andi        $v0, $a1, 0xFFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sw          $zero, 0x0($v0)
.end func_80090C00
