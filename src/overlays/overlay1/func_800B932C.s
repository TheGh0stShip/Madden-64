.text
.align 2
.set noreorder
.globl func_800B932C
.ent func_800B932C
func_800B932C:
    lw          $v1, 0x24($s1)
    lui         $a0, 0x8008
    lw          $a0, 0x7128($a0)
    addiu       $s0, $s0, 0x16
    sll         $s0, $s0, 5
    addu        $a0, $a0, $s0
    lw          $v0, 0x0($a0)
    sw          $v0, 0x1C($v1)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x4($a0)
    sw          $v0, 0x20($v1)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x8($a0)
    sw          $v0, 0x24($v1)
    lh          $a1, 0x10($a0)
    jal         func_800C16A0
    addu        $a0, $s1, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x7128($v0)
    lw          $a0, 0x24($s1)
    addu        $v0, $v0, $s0
    lhu         $a1, 0x12($v0)
    lhu         $a2, 0x14($v0)
    jal         func_800B4988
    nop
    lw          $v1, 0x24($s1)
    lui         $a1, 0x8008
    lw          $a1, 0x7128($a1)
    andi        $v0, $v0, 0xFFFF
    sw          $v0, 0x18($v1)
    lw          $a0, 0x24($s1)
    addu        $s0, $a1, $s0
    lw          $v1, 0x18($s0)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, . + 4 + (-0x2F << 2)
    sw          $v1, 0x14($a0)
    lui         $a3, 0x8008
.end func_800B932C
