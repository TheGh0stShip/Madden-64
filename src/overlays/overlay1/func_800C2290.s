.text
.align 2
.set noreorder
.globl func_800C2290
.ent func_800C2290
func_800C2290:
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s3
    sll         $v0, $v0, 3
    addu        $s1, $v0, $v1
    sll         $v0, $s0, 16
.L800C22A8:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s1
    lw          $a0, 0x0($v0)
    jal         func_800BFF60
    nop
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srl         $v1, $v1, 1
    slt         $v0, $v0, $v1
    bnez        $v0, .L800C22A8
    sll         $v0, $s0, 16
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $s3, $v0, .L800C230C
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x6178($a1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2E4C
    nop
.L800C230C:
    lui         $v0, 0x8008
.end func_800C2290
