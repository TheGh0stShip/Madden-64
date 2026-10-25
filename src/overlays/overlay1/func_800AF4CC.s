.text
.align 2
.set noreorder
.globl func_800AF4CC
.ent func_800AF4CC
func_800AF4CC:
    addiu       $sp, $sp, -0x18
    sll         $v0, $a0, 16
    sw          $s0, 0x10($sp)
    sra         $s0, $v0, 13
    sw          $ra, 0x14($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lhu         $v1, 0x6DE8($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0x6DEA($at)
    andi        $v0, $v1, 0x2
    beqz        $v0, .L800AF52C
    addu        $a1, $a0, $zero
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, .L800AF52C
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7AA8($a0)
    j           func_800AAE18
    nop
.L800AF52C:
    lui         $a0, 0x8007
    lw          $a0, -0x4704($a0)
    sll         $s0, $a1, 16
    sra         $s0, $s0, 13
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $a1, 0x6DEC($at)
    jal         func_8000D874
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $a1, 0x6DEC($at)
    jal         func_8000D834
    nop
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AF4CC
