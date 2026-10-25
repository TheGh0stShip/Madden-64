.text
.align 2
.set noreorder
.globl func_8004192C
.ent func_8004192C
func_8004192C:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    andi        $a0, $a0, 0xFFFF
    addiu       $v0, $zero, 0x1
    beq         $a0, $v0, .L8004198C
    sw          $ra, 0x18($sp)
    slti        $v0, $a0, 0x2
    beql        $v0, $zero, .L8004196C
    addiu       $v0, $zero, 0x2
    beql        $a0, $zero, .L80041984
    addiu       $s1, $zero, 0x9
    j .L8004199C
    nop
.L8004196C:
    beq         $a0, $v0, .L80041994
    addiu       $v0, $zero, 0x3
    beql        $a0, $v0, .L80041998
    addiu       $s1, $zero, 0x8
    j .L8004199C
    nop
.L80041984:
    j .L8004199C
    addiu       $s0, $zero, 0xB
.L8004198C:
    j .L80041998
    addiu       $s1, $zero, 0x9
.L80041994:
    addiu       $s1, $zero, 0x9
.L80041998:
    addiu       $s0, $zero, 0xD
.L8004199C:
    jal         func_8003CBB8
    nop
    addiu       $v1, $s0, 0x1
    sll         $a1, $v1, 1
    addu        $a1, $a1, $v1
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    addu        $a1, $a1, $v1
    addiu       $a1, $a1, 0x3C
    sll         $a1, $a1, 16
    addu        $a0, $s1, $zero
    sra         $a1, $a1, 16
    jal         func_8003CE88
    addiu       $a2, $zero, 0x10
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8004192C
