.text
.align 2
.set noreorder
.globl func_80008CBC
.ent func_80008CBC
func_80008CBC:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x76C0
    addu        $a0, $s0, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x76D8
    sw          $ra, 0x14($sp)
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    addiu       $a0, $zero, 0x6
    addu        $a1, $s0, $zero
    jal         func_8004D098
    addu        $a2, $zero, $zero
.L80008CF4:
    lui         $a0, 0x8007
    addiu       $a0, $a0, 0x76C0
    addu        $a1, $zero, $zero
    jal         func_8004CDA8
    addu        $a2, $zero, $zero
    beqz        $v0, .L80008CF4
    nop
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    lw          $v0, 0x4($v1)
    lw          $a1, 0x8($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $a0, 0xC($v0)
    jal         func_8004F158
    sll         $a1, $a1, 2
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    lw          $v0, 0x4($v1)
    lw          $a1, 0x8($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $a0, 0xC($v0)
    jal         func_80045A88
    sll         $a1, $a1, 2
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    lw          $a0, 0x0($v0)
    jal         func_80045928
    nop
.L80008D6C:
    lui         $a0, 0x8006
    lw          $a0, 0x4A00($a0)
    jal         func_80004D34
    nop
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    lw          $v0, 0x4($v1)
    lw          $a1, 0x8($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $a0, 0xC($v0)
    jal         func_8004F158
    sll         $a1, $a1, 2
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    lw          $v0, 0x4($v1)
    lw          $a1, 0x8($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $a0, 0xC($v0)
    jal         func_80045A88
    sll         $a1, $a1, 2
    lui         $a0, 0x8007
    addiu       $a0, $a0, 0x76C0
    addu        $a1, $zero, $zero
    jal         func_8004CDA8
    addiu       $a2, $zero, 0x1
    j .L80008D6C
    nop
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80008CBC
