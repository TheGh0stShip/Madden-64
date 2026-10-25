.text
.align 2
.set noreorder
.globl func_800AFBB0
.ent func_800AFBB0
func_800AFBB0:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sll         $a0, $a1, 16
    sra         $a0, $a0, 16
    sw          $ra, 0x14($sp)
    jal         func_800167FC
    addu        $a1, $s0, $zero
    jal         func_8004DF94
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $s0, $s0, $v0
    addiu       $v0, $zero, 0x25
    sb          $v0, 0x0($s0)
    sb          $zero, 0x1($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AFBB0
