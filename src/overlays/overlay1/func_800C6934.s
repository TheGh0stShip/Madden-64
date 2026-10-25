.text
.align 2
.set noreorder
.globl func_800C6934
.ent func_800C6934
func_800C6934:
    lui         $v1, 0x8007
    lbu         $v1, 0x4808($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800C69AC
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $a0, 0x1602($at)
    subu        $v0, $a0, $a2
    bgez        $v0, .L800C69A0
    nop
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, 0x1602($at)
    j           func_800C2288
    nop
.L800C69A0:
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, 0x1602($at)
.L800C69AC:
    jr          $ra
    nop
.end func_800C6934
