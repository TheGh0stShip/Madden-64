.text
.align 2
.set noreorder
.globl func_800B9208
.ent func_800B9208
func_800B9208:
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    andi        $v0, $v0, 0xFFFF
    sw          $v0, 0x18($a0)
    lw          $a0, 0x24($s1)
    addu        $v1, $v1, $s0
    lw          $v1, 0x18($v1)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    bnez        $v0, . + 4 + (-0x2B << 2)
    sw          $v1, 0x14($a0)
    addu        $s2, $zero, $zero
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x5098
    sll         $s0, $s2, 16
    sra         $s0, $s0, 16
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s3
    lw          $s1, 0x0($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x7128($a0)
    addiu       $s0, $s0, 0xB
    sll         $s0, $s0, 5
    lw          $v1, 0x24($s1)
.end func_800B9208
