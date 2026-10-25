.text
.align 2
.set noreorder
.globl func_800C46C0
.ent func_800C46C0
func_800C46C0:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $s0, 0x10($sp)
    andi        $s0, $s2, 0xFFFF
    sw          $ra, 0x1C($sp)
    jal         func_800BDAE8
    addu        $a0, $s0, $zero
    beqz        $v0, .L800C4720
    sll         $s0, $s0, 2
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x7F10
    addu        $s0, $s0, $v0
    lw          $a0, 0x0($s0)
    jal         func_800BFF60
    nop
    addiu       $v0, $s2, 0x40
    sb          $v0, 0x21($s1)
    sw          $s1, 0x0($s0)
    lhu         $v0, 0x28($s1)
    andi        $v0, $v0, 0xFFFE
    sh          $v0, 0x28($s1)
.L800C4720:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C46C0
