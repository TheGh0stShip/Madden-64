.text
.align 2
.set noreorder
.globl func_800B6654
.ent func_800B6654
func_800B6654:
    lui         $a1, 0x8007
    lw          $a1, 0x18E8($a1)
    addiu       $sp, $sp, -0x18
    beqz        $a1, .L800B6698
    sw          $ra, 0x10($sp)
    lui         $at, 0x8007
    sw          $zero, 0x18F0($at)
    lui         $at, 0x8007
    sh          $zero, 0x18E0($at)
    lui         $at, 0x8007
    sh          $zero, 0x18E4($at)
    lui         $at, 0x8006
    sh          $zero, 0x4A72($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sw          $zero, 0x18E8($at)
.L800B6698:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B6654
