.text
.align 2
.set noreorder
.globl func_8009EDB0
.ent func_8009EDB0
func_8009EDB0:
    lui         $at, 0x8006
    sh          $v1, 0x5700($at)
    slti        $v1, $v1, -0x132
    bnez        $v1, .L8009EDF4
    addiu       $a1, $zero, 0x4
    addiu       $a1, $zero, 0x2
    addiu       $v0, $zero, -0x26
    lui         $at, 0x8006
    sh          $v0, 0x56E2($at)
    addiu       $v0, $zero, 0x26
    lui         $at, 0x8006
    sh          $v0, 0x56F2($at)
    addiu       $v0, $zero, -0x133
    lui         $at, 0x8006
    sh          $v0, 0x56F0($at)
    lui         $at, 0x8006
    sh          $v0, 0x56E0($at)
.L8009EDF4:
    slti        $v0, $s2, 0x133
    beqz        $v0, .L8009EE44
    addiu       $v0, $zero, -0x26
    addiu       $a1, $a1, -0x2
    sll         $a0, $a1, 4
    lui         $at, 0x8006
    addu        $at, $at, $a0
    sh          $v0, 0x56C2($at)
    addiu       $v0, $a1, 0x1
    sll         $v0, $v0, 4
    addiu       $v1, $zero, 0x26
    lui         $at, 0x8006
    addu        $at, $at, $v0
    sh          $v1, 0x56C2($at)
    addu        $v0, $v0, $a2
    addiu       $v1, $zero, 0x133
    sh          $v1, 0x0($v0)
    lui         $at, 0x8006
    addu        $at, $at, $a0
    sh          $v1, 0x56C0($at)
.L8009EE44:
    sll         $v0, $a1, 4
    addu        $v0, $v0, $a2
    srl         $v1, $a1, 31
    addu        $v1, $a1, $v1
    sra         $v1, $v1, 1
    sw          $v0, 0x4($s4)
    addiu       $v0, $zero, 0x17E
    subu        $v0, $v0, $v1
    sw          $v0, 0x8($s4)
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009EDB0
