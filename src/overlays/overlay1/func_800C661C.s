.text
.align 2
.set noreorder
.globl func_800C661C
.ent func_800C661C
func_800C661C:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_800A29C0
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F50($v1)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800C6658
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x49D6($v1)
    bne         $v1, $v0, .L800C6684
    nop
.L800C6658:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    lw          $v0, 0x2C($a0)
    lui         $at, 0x8008
    sw          $v0, 0x57EC($at)
    jal         func_800C157C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sw          $v0, 0x57F4($at)
.L800C6684:
    lui         $at, 0x8009
    sh          $zero, -0x49D6($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C661C
