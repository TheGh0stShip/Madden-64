.text
.align 2
.set noreorder
.globl func_800B92FC
.ent func_800B92FC
func_800B92FC:
    sw          $v1, 0x14($a0)
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
.end func_800B92FC
