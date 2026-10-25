.text
.align 2
.set noreorder
.globl func_800B8C4C
.ent func_800B8C4C
func_800B8C4C:
    sh          $v0, 0x14($v1)
    lw          $v0, 0x24($s1)
    lw          $a0, 0x14($v0)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    bnez        $v0, . + 4 + (-0x28 << 2)
    sw          $a0, 0x18($v1)
    addu        $s2, $zero, $zero
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x5098
    sll         $s0, $s2, 16
    sra         $s0, $s0, 16
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s3
.end func_800B8C4C
