.text
.align 2
.set noreorder
.globl func_800BA260
.ent func_800BA260
func_800BA260:
    lui         $v0, 0x8007
    lw          $v0, 0x18E8($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x7AC4($v1)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lhu         $v0, 0xA($v0)
    bne         $v1, $v0, .L800BA294
    addiu       $v0, $zero, 0x1
.L800BA284:
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    j           func_800B5C14
    nop
.L800BA294:
    lui         $v0, 0x8007
    lw          $v0, 0x18E8($v0)
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    lhu         $v0, 0xA($v0)
    beq         $a0, $v0, .L800BA284
    addiu       $v0, $zero, 0x1
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
    lui         $v0, 0x8008
    lhu         $v0, 0x7AC4($v0)
    lui         $v1, 0x8007
    lw          $v1, 0x18E8($v1)
    sll         $v0, $v0, 4
    addu        $v1, $v1, $v0
    lw          $v0, 0x48($v1)
    lui         $v1, 0x8009
    lhu         $v1, -0x502E($v1)
    srl         $v0, $v0, 7
    andi        $v0, $v0, 0xF
    addu        $v1, $v1, $v0
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $at, 0x8009
    sh          $v1, -0x502E($at)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    sll         $v0, $v0, 1
    slt         $v0, $v0, $v1
    beqz        $v0, .L800BA294
    nop
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BA260
