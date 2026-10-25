.text
.align 2
.set noreorder
.globl runtime_command_process
.ent runtime_command_process
runtime_command_process:
    addiu       $sp, $sp, -0x48
    sw          $s1, 0x3C($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x40($sp)
    addu        $s2, $a1, $zero
    sw          $ra, 0x44($sp)
    jal         func_8002FE58
    sw          $s0, 0x38($sp)
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x65D0
    jal         func_8000B2E0
    addiu       $s0, $zero, 0x1
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4C30
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000C930
    addu        $a3, $zero, $zero
    addiu       $a0, $zero, 0x4
    jal         func_8000B6F8
    addiu       $a1, $zero, 0x5
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    lui         $at, 0x8009
    sw          $a0, -0x7F70($at)
    jal         func_8000C940
    addu        $a2, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addiu       $a1, $zero, 0x140
    jal         func_8000C964
    addiu       $a2, $zero, 0xF0
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x6910
    jal         func_8000D2C0
    nop
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    jal         func_8000D5BC
    addu        $a2, $zero, $zero
    addiu       $a0, $zero, 0x6
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x404
    lui         $at, 0x8008
    sw          $v0, 0x7A64($at)
    jal         func_80016E80
    addiu       $a2, $zero, 0x720
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7A64($a1)
    jal         func_8000C898
    nop
    jal         func_800334B8
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addu        $a1, $zero, $zero
    addiu       $a2, $sp, 0x10
    addiu       $v0, $zero, 0x8
    sh          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x3
    sw          $s0, 0x1C($sp)
    sh          $zero, 0x16($sp)
    sh          $zero, 0x18($sp)
    sw          $zero, 0x20($sp)
    sw          $s1, 0x10($sp)
    jal         func_8000D740
    sh          $v0, 0x14($sp)
    addu        $s1, $v0, $zero
    jal         func_80016FE4
    addu        $a0, $s1, $zero
    bne         $s2, $s0, .L8002EFAC
    nop
    jal         func_80031A78
    nop
.L8002EFAC:
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_80031A98
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BE80
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000D998
    addu        $a1, $s1, $zero
    jal         func_80016EE4
    nop
    jal         func_8000D4AC
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000B7E4
    nop
    jal         func_8000B614
    nop
    jal         func_800334B8
    nop
    lw          $ra, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end runtime_command_process
