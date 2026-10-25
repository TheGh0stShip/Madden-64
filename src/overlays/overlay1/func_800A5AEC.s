.text
.align 2
.set noreorder
.globl func_800A5AEC
.ent func_800A5AEC
func_800A5AEC:
    addu        $s0, $a0, $zero
    sw          $ra, 0x48($sp)
    sw          $s1, 0x44($sp)
    lbu         $v0, 0x1F($s0)
    lw          $v1, 0x24($s0)
    addiu       $v0, $v0, -0x4
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0xC40($at)
    lw          $v0, 0x1C($v1)
    subu        $a0, $a0, $v0
    sw          $a0, 0x20($sp)
    lbu         $v0, 0x1F($s0)
    lw          $v1, 0x24($s0)
    addiu       $v0, $v0, -0x4
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0xC44($at)
    lw          $v1, 0x20($v1)
    subu        $v0, $v0, $v1
    or          $a0, $a0, $v0
    bnez        $a0, .L800A5C28
    sw          $v0, 0x24($sp)
    lw          $v1, 0x2C($s0)
    addiu       $v0, $zero, 0x200
    beq         $v1, $v0, . + 4 + (0x8A << 2)
    addu        $a0, $s0, $zero
    lw          $v0, 0x24($s0)
    lw          $a1, 0x1C($v0)
    lui         $s1, 0xFE70
    slt         $a1, $a1, $s1
    xori        $a1, $a1, 0x1
    negu        $a1, $a1
    andi        $a1, $a1, 0xC00
    jal         func_800C16A0
    ori         $a1, $a1, 0x400
    lw          $v1, 0x2C($s0)
    addiu       $v0, $zero, 0x201
    bne         $v1, $v0, .L800A5B9C
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x200
.L800A5B9C:
    lui         $v0, 0x8008
    lw          $v0, 0x741C($v0)
    lw          $v1, 0x1C($v0)
    slt         $v0, $v1, $s1
    beqz        $v0, .L800A5BDC
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x7950($a1)
    beqz        $a1, .L800A5C28
    lui         $v0, 0x18F
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A5BF8
    nop
    j           func_800A1504
    nop
.L800A5BDC:
    lui         $a1, 0x8008
    lw          $a1, 0x7950($a1)
    beqz        $a1, .L800A5C28
    lui         $v0, 0x190
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A5C28
    nop
.L800A5BF8:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000D874
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7950($a1)
    jal         func_8000D834
    nop
    lui         $at, 0x8008
    sw          $zero, 0x7950($at)
.L800A5C28:
    lw          $v0, 0x20($sp)
    bnez        $v0, .L800A5C40
    nop
    lw          $v0, 0x24($sp)
    beqz        $v0, . + 4 + (0x32 << 2)
    nop
.L800A5C40:
    jal         func_800B9208
    addiu       $a0, $sp, 0x20
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    jal         func_800C0018
    addu        $a2, $zero, $zero
    lw          $v1, 0x2C($s0)
    addiu       $v0, $zero, 0x200
    bne         $v1, $v0, .L800A5C74
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x201
.L800A5C74:
    lw          $v0, 0x20($sp)
.end func_800A5AEC
