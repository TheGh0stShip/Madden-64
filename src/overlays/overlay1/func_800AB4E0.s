.text
.align 2
.set noreorder
.globl func_800AB4E0
.ent func_800AB4E0
func_800AB4E0:
    andi        $s1, $s1, 0xFFFF
    addu        $a0, $s1, $zero
    jal         func_80035EF0
    addiu       $a1, $zero, 0x31
    addu        $a0, $s1, $zero
    lui         $at, 0x8008
    sw          $v0, 0x4F80($at)
    jal         func_80035EF0
    addiu       $a1, $zero, 0x33
    addu        $a0, $s1, $zero
    lui         $at, 0x8008
    sw          $v0, 0x7AF8($at)
    jal         func_80035EF0
    addiu       $a1, $zero, 0x34
    addu        $a0, $s1, $zero
    lui         $at, 0x8009
    sw          $v0, -0x6CA0($at)
    jal         func_80035EF0
    addiu       $a1, $zero, 0x35
    lui         $at, 0x8008
    sw          $v0, 0x69C8($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4AA8
    lui         $at, 0x8008
    sw          $v0, -0x5EC4($at)
    lui         $at, 0x8008
    sw          $v0, -0x5EE0($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4AC8
    addiu       $v1, $zero, -0x1
    lui         $at, 0x8008
    sw          $v0, -0x5EC0($at)
    lui         $at, 0x8008
    sw          $v0, -0x5EDC($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sh          $v0, -0x484A($at)
    lui         $at, 0x8007
    sh          $v0, -0x4846($at)
    lui         $at, 0x8007
    sh          $v0, -0x4848($at)
    addiu       $v0, $zero, 0x35
    lui         $at, 0x8007
    sb          $v0, -0x483C($at)
    addiu       $v0, $zero, 0x5A
    lui         $at, 0x8008
    sh          $zero, -0x5EE2($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EE4($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EB6($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EB8($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EAA($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EAC($at)
    lui         $at, 0x8007
    sh          $zero, -0x4858($at)
    lui         $at, 0x8007
    sh          $v1, -0x4856($at)
    lui         $at, 0x8007
    sh          $v1, -0x4854($at)
    lui         $at, 0x8007
    sh          $zero, -0x4850($at)
    lui         $at, 0x8007
    sh          $zero, -0x484E($at)
    lui         $at, 0x8007
    sh          $zero, -0x484C($at)
    lui         $at, 0x8007
    sh          $v1, -0x4844($at)
    lui         $at, 0x8007
    sh          $v1, -0x4842($at)
    lui         $at, 0x8008
    sh          $v0, -0x5EA0($at)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AB4E0
