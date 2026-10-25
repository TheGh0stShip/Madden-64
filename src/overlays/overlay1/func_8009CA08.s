.text
.align 2
.set noreorder
.globl func_8009CA08
.ent func_8009CA08
func_8009CA08:
    bne         $a0, $at, .L8009CA14
    nop
    break       6
.L8009CA14:
    .word       0x00002012  # mflo        $a0
    .word       0x00009010  # mfhi        $s2
    lw          $a1, 0x20($s1)
    lhu         $a2, 0x16($s1)
    lw          $a3, 0x4($s1)
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x24($s1)
    .word       0x00A30018  # mult        $a1, $v1
    .word       0x00002812  # mflo        $a1
    sw          $s3, 0x44($s1)
    sltu        $v0, $zero, $s2
    addu        $a0, $a0, $v0
    addiu       $v1, $a0, 0x1
    sll         $v1, $v1, 1
    andi        $v0, $v1, 0xFFFE
    sll         $s0, $v0, 4
    sw          $a0, 0x28($s1)
    .word       0x00A6001A  # div         $zero, $a1, $a2
.end func_8009CA08
