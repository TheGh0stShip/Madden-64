.text
.align 2
.set noreorder
.globl func_800BF714
.ent func_800BF714
func_800BF714:
    lw          $v0, 0x8($s1)
    and         $v0, $s2, $v0
    beqz        $v0, .L800BF73C
    nop
    jal         func_800BC5C8
    nop
    jal         func_800A365C
    addiu       $a0, $zero, 0x2
    j           func_800BB094
    addu        $v0, $zero, $zero
.L800BF73C:
    lw          $v0, 0x0($s1)
    and         $v0, $s2, $v0
    beqz        $v0, .L800BF75C
    nop
    jal         func_800C9418
    addu        $a0, $s0, $zero
    j           func_800BB094
    addu        $v0, $zero, $zero
.L800BF75C:
    lw          $v0, 0x4($s1)
    and         $v0, $s2, $v0
    beqz        $v0, .L800BF77C
    nop
    jal         func_800C93D8
    addu        $a0, $s0, $zero
    j           func_800BB094
    addu        $v0, $zero, $zero
.L800BF77C:
    lw          $v0, 0xC($s1)
    and         $v0, $s2, $v0
    beqz        $v0, .L800BF79C
    nop
    jal         func_800C945C
    addu        $a0, $s0, $zero
    j           func_800BB094
    addu        $v0, $zero, $zero
.L800BF79C:
    lw          $v0, 0x10($s1)
    and         $v0, $s2, $v0
    beqz        $v0, .L800BF7B8
    addu        $v0, $zero, $zero
    jal         func_800BB7E4
    addu        $a0, $s0, $zero
    addu        $v0, $zero, $zero
.L800BF7B8:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800BF714
