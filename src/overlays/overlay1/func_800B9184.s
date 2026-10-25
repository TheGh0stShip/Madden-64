.text
.align 2
.set noreorder
.globl func_800B9184
.ent func_800B9184
func_800B9184:
    addu        $s2, $zero, $zero
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x5040
    sll         $s0, $s2, 16
    sra         $s0, $s0, 16
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s3
    lw          $s1, 0x0($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x7128($a0)
    sll         $s0, $s0, 5
    lw          $v1, 0x24($s1)
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
    lw          $a0, 0x24($s1)
.end func_800B9184
