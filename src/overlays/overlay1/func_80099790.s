.text
.align 2
.set noreorder
.globl func_80099790
.ent func_80099790
func_80099790:
    lui         $a1, 0x8008
    lw          $a1, -0x7BA8($a1)
    addiu       $sp, $sp, -0x18
    beqz        $a1, .L800997B4
    sw          $ra, 0x10($sp)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $zero, -0x7BA8($at)
.L800997B4:
    lui         $a1, 0x8006
    lw          $a1, 0x5428($a1)
    beqz        $a1, .L800997D4
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8006
    sw          $zero, 0x5428($at)
.L800997D4:
    lui         $at, 0x8006
    sw          $zero, 0x542C($at)
    jal         func_80034978
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x6D04($a0)
    jal         func_80035A7C
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80099790
