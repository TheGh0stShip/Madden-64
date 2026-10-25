.text
.align 2
.set noreorder
.globl func_800B18DC
.ent func_800B18DC
func_800B18DC:
    nop
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x205C
    jal         func_8004DF94
    addu        $a0, $s0, $zero
    sll         $a2, $v0, 16
    sra         $a2, $a2, 16
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x6DB0
    addu        $s1, $a2, $s3
    addu        $a0, $s3, $zero
    jal         func_8004DF68
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    jal         func_800B932C
    addu        $a1, $s2, $zero
    negu        $v0, $v0
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    jal         func_800167FC
    addu        $a1, $s1, $zero
    jal         func_8004DF94
    addu        $a0, $s3, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x201C
    jal         func_8002E65C
    addu        $a0, $v0, $s3
    addu        $a0, $zero, $zero
    jal         func_800B932C
    addu        $a1, $s2, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    j           func_800AD328
    addiu       $v1, $zero, -0x1
.end func_800B18DC
