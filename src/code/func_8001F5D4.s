.text
.align 2
.set noreorder
.globl func_8001F5D4
.ent func_8001F5D4
func_8001F5D4:
    addiu       $sp, $sp, -0x20
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x40C
    addiu       $a1, $zero, 0xBF4
    sw          $ra, 0x1C($sp)
    jal         func_800356C4
    sw          $s0, 0x18($sp)
    andi        $a0, $v0, 0xFFFF
    addiu       $a1, $sp, 0x10
    lui         $at, 0x8008
    sh          $v0, 0x7954($at)
    addiu       $v0, $zero, 0x1
    sh          $zero, 0x10($sp)
    jal         func_80044F94
    sh          $v0, 0x12($sp)
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x6D20
    jal         func_80033AA8
    addu        $a0, $zero, $zero
    lui         $v1, 0x8007
    lw          $v1, -0x6D78($v1)
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x7B0C
    lui         $at, 0x8009
    sw          $v0, -0x79D0($at)
    sw          $zero, 0x0($s0)
    lui         $at, 0x8008
    sw          $zero, -0x7344($at)
    lui         $at, 0x8008
    sw          $zero, -0x728C($at)
    lui         $at, 0x8008
    sw          $zero, -0x7A54($at)
    bnez        $v1, .L8001F694
    addiu       $a0, $s0, 0x8
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x800
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, -0x7A84($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x800
    lui         $at, 0x8008
    sw          $v0, -0x72BC($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sw          $v0, -0x6D78($at)
    addiu       $a0, $s0, 0x8
.L8001F694:
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, -0x7293($at)
    addiu       $v0, $s0, 0x60
    lui         $at, 0x8008
    sw          $v0, -0x7AFC($at)
    addiu       $v0, $s0, 0x828
    lui         $at, 0x8008
    sw          $v0, -0x7334($at)
    addiu       $v0, $zero, 0x7
    lui         $at, 0x8008
    sb          $zero, -0x7A5B($at)
    lui         $at, 0x8008
    sh          $v0, -0x72E8($at)
    lui         $at, 0x8008
    sh          $v0, -0x7AB0($at)
    lui         $at, 0x8008
    sw          $zero, -0x72E0($at)
    lui         $at, 0x8008
    sw          $zero, -0x7AA8($at)
    jal         func_80034388
    lui         $a1, 0x6
    addiu       $a0, $s0, 0x7D0
    jal         func_80034388
    lui         $a1, 0x6
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8001F5D4
