.text
.align 2
.set noreorder
.globl func_800C6814
.ent func_800C6814
func_800C6814:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x6AE0($v1)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lw          $a1, 0x2C($a0)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x49D6($at)
    lui         $at, 0x8008
    sw          $v1, 0x4F50($at)
    lui         $at, 0x8008
    sw          $a1, 0x57EC($at)
    jal         func_800C157C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sw          $v0, 0x57F4($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C6814
