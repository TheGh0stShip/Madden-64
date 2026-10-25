.text
.align 2
.set noreorder
.globl func_8002F838
.ent func_8002F838
func_8002F838:
    addiu       $a0, $zero, 0x3
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x4D55
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x5A4C($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x49C8($at)
    addiu       $v0, $zero, 0x9
    lui         $at, 0x8009
    sh          $v0, -0x6D4C($at)
    addiu       $v0, $zero, 0xA
    lui         $at, 0x8009
    sh          $v0, -0x6D4A($at)
    lui         $at, 0x8008
    sh          $zero, 0x5A40($at)
    lui         $at, 0x8008
    sh          $zero, 0x7A92($at)
.L8002F884:
    sb          $zero, 0x0($v1)
    addiu       $a0, $a0, -0x1
    bgez        $a0, .L8002F884
    addiu       $v1, $v1, -0x1
    lui         $v1, 0x8009
    lbu         $v1, -0x63E8($v1)
    addiu       $v0, $zero, 0x12C
    lui         $at, 0x8008
    sh          $v0, 0x7A60($at)
    bnez        $v1, .L8002F8C0
    nop
    lui         $v0, 0x800E
    addiu       $v0, $v0, 0x49F0
    j .L8002F8C8
    nop
.L8002F8C0:
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x8B8
.L8002F8C8:
    lui         $at, 0x8008
    sw          $v0, 0x6DD8($at)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x2EC8
    lui         $at, 0x8008
    sw          $v0, 0x7894($at)
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x4368
    lui         $at, 0x8008
    sw          $v0, 0x5A30($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x2DF0
    lui         $at, 0x8009
    sw          $v0, -0x7F6C($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x5528
    lui         $at, 0x8009
    sh          $zero, -0x5A50($at)
    lui         $at, 0x8009
    sw          $v0, -0x4C8C($at)
    lui         $at, 0x8008
    sw          $zero, 0x7A64($at)
    lui         $at, 0x8008
    sw          $zero, 0x5298($at)
    jr          $ra
    nop
.end func_8002F838
