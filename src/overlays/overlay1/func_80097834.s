.text
.align 2
.set noreorder
.globl func_80097834
.ent func_80097834
func_80097834:
    lui         $v0, 0x8008
    lhu         $v0, 0x6CA0($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    addiu       $v0, $v0, -0x1
    lui         $at, 0x8008
    sh          $v0, 0x6CA0($at)
    sll         $v0, $v0, 16
    bgez        $v0, .L80097864
    nop
    lui         $at, 0x8008
    sh          $zero, 0x6CA0($at)
.L80097864:
    lui         $v0, 0x8008
    lhu         $v0, 0x76E8($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x76E8($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x3
    beqz        $v0, .L8009789C
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x6CA0($v0)
    lui         $at, 0x8008
    sh          $v0, 0x6CB0($at)
.L8009789C:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x5040($at)
    lbu         $v0, 0x20($v0)
    bnez        $v0, .L80097930
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0xA
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x5
    beqz        $v0, .L80097930
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5040($at)
    lw          $v0, 0x24($a0)
    lw          $v0, 0x14($v0)
    lui         $v1, 0x2
    and         $v0, $v0, $v1
    bnez        $v0, .L80097930
    nop
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x2A
.L80097930:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80097834
