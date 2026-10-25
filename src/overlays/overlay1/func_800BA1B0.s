.text
.align 2
.set noreorder
.globl func_800BA1B0
.ent func_800BA1B0
func_800BA1B0:
    lui         $v1, 0x8007
    lw          $v1, 0x18E8($v1)
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lhu         $v0, 0xA($v1)
    bne         $a0, $v0, .L800BA1E8
    sll         $v0, $a0, 4
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    j           func_800B5B2C
    nop
.L800BA1E8:
    addu        $v0, $v1, $v0
    lw          $v1, 0x48($v0)
    lui         $v0, 0x8009
    lhu         $v0, -0x502E($v0)
    srl         $v1, $v1, 7
    andi        $v1, $v1, 0xF
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x502E($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x6
    bnez        $v0, .L800BA250
    nop
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
    jal         func_800B5028
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    jal         func_800B5D88
    nop
    lui         $at, 0x8008
    sh          $v0, 0x7AC4($at)
    jal         func_800B74FC
    nop
.L800BA250:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BA1B0
