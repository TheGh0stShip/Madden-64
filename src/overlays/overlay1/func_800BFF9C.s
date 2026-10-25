.text
.align 2
.set noreorder
.globl func_800BFF9C
.ent func_800BFF9C
func_800BFF9C:
    beq         $v1, $s0, . + 4 + (0x34 << 2)
    addiu       $v0, $t0, 0x1
    lh          $v0, 0x36($v1)
    beqz        $v0, . + 4 + (0x31 << 2)
    addiu       $v0, $t0, 0x1
    lw          $a1, 0x24($v1)
    lw          $a3, 0x1C($a1)
    bgez        $a3, .L800BFFC4
    addu        $v0, $a3, $zero
    negu        $v0, $v0
.L800BFFC4:
    slt         $v0, $t4, $v0
    bnez        $v0, . + 4 + (0x29 << 2)
    addiu       $v0, $t0, 0x1
    lw          $v1, 0x20($a1)
    slt         $v0, $t5, $v1
    beqz        $v0, . + 4 + (0x25 << 2)
    addiu       $v0, $t0, 0x1
    lw          $a2, 0x24($s0)
    lw          $v0, 0x20($a2)
    lw          $a0, 0x30($a1)
    subu        $v0, $v1, $v0
    sll         $v1, $a0, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $a0, $v0, $v1
    bgtz        $a0, . + 4 + (0x1B << 2)
    addiu       $v0, $t0, 0x1
    lw          $v1, 0x1C($a2)
    lw          $v0, 0x2C($a1)
    subu        $v1, $a3, $v1
    sll         $v0, $v0, 4
.end func_800BFF9C
