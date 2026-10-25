.text
.align 2
.set noreorder
.globl func_800C0188
.ent func_800C0188
func_800C0188:
    addiu       $sp, $sp, -0x28
    sw          $ra, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lbu         $v0, 0x21($a0)
    andi        $v0, $v0, 0xBF
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x78A8($at)
    andi        $v0, $v0, 0xF00
    srl         $v0, $v0, 7
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lh          $v1, -0x6414($at)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800C01F8
    addu        $s0, $v1, $zero
    lui         $v0, 0x8008
    lhu         $v0, 0x6D48($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x6CFC($a0)
    addu        $s1, $s0, $v0
    jal         func_8000C8EC
    addu        $s0, $s1, $zero
    bnel        $v0, $zero, .L800C01F4
    addiu       $s0, $s1, -0x7FF
.L800C01F4:
    andi        $s0, $s0, 0xFFF
.L800C01F8:
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C0188
