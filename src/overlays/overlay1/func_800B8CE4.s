.text
.align 2
.set noreorder
.globl func_800B8CE4
.ent func_800B8CE4
func_800B8CE4:
    lw          $v0, 0x24($s1)
    lw          $v0, 0x18($v0)
    sh          $v0, 0x12($v1)
    lw          $v0, 0x24($s1)
    lw          $v0, 0x8($v0)
    lhu         $v0, 0x14($v0)
    srl         $v0, $v0, 8
    sh          $v0, 0x14($v1)
    lw          $v0, 0x24($s1)
    lw          $a0, 0x14($v0)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    bnez        $v0, . + 4 + (-0x29 << 2)
    sw          $a0, 0x18($v1)
    addu        $s2, $zero, $zero
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x7138
    sll         $s0, $s2, 16
    sra         $s0, $s0, 16
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 4
    addu        $s1, $v0, $s3
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    addiu       $s0, $s0, 0x16
    lw          $v0, 0x1C($v0)
    sll         $s0, $s0, 5
    addu        $v1, $v1, $s0
    sw          $v0, 0x0($v1)
    lw          $v0, 0x24($s1)
    lw          $v0, 0x20($v0)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x24($s1)
    lw          $v0, 0x24($v0)
    addu        $a0, $s1, $zero
    jal         func_800C157C
    sw          $v0, 0x8($v1)
    lui         $a1, 0x8008
    lw          $a1, 0x7128($a1)
    addu        $s0, $a1, $s0
    sh          $v0, 0x10($s0)
    lw          $v0, 0x24($s1)
    lw          $v0, 0x18($v0)
    sh          $v0, 0x12($s0)
    lw          $v0, 0x24($s1)
    lw          $v0, 0x8($v0)
    lhu         $v0, 0x14($v0)
    srl         $v0, $v0, 8
    sh          $v0, 0x14($s0)
    lw          $v0, 0x24($s1)
    lw          $v1, 0x14($v0)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
.end func_800B8CE4
