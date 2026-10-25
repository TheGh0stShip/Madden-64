.text
.align 2
.set noreorder
.globl func_800C354C
.ent func_800C354C
func_800C354C:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B70
    addiu       $v1, $zero, -0x7
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    lw          $v1, 0x0($a0)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800C35E0
    nop
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x6A68
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    addiu       $a1, $zero, -0x1
    lw          $v0, 0x0($a0)
    sll         $v0, $v0, 1
.L800C3598:
    addu        $v0, $v0, $a2
    lh          $v0, 0x0($v0)
    bne         $v0, $v1, .L800C35C4
    addiu       $a0, $a0, 0x4
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x2
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    j           func_800BEEAC
    nop
.L800C35C4:
    lw          $v0, 0x0($a0)
    bne         $v0, $a1, .L800C3598
    sll         $v0, $v0, 1
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B70
    lw          $v1, 0x0($a0)
    addiu       $v0, $zero, -0x1
.L800C35E0:
    beq         $v1, $v0, .L800C363C
    nop
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x6A68
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    addiu       $a1, $zero, -0x1
    lw          $v0, 0x0($a0)
    sll         $v0, $v0, 1
.L800C3604:
    addu        $v0, $v0, $a2
    lh          $v0, 0x0($v0)
    bnel        $v0, $v1, .L800C3630
    addiu       $a0, $a0, 0x4
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x4
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    j           func_800BEF18
    nop
.L800C3630:
    lw          $v0, 0x0($a0)
    bne         $v0, $a1, .L800C3604
    sll         $v0, $v0, 1
.L800C363C:
    jr          $ra
    nop
.end func_800C354C
