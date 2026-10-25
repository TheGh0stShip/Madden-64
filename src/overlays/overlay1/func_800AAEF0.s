.text
.align 2
.set noreorder
.globl func_800AAEF0
.ent func_800AAEF0
func_800AAEF0:
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $s2, 0x44($s0)
    beqz        $v0, . + 4 + (0x72 << 2)
    addu        $s3, $zero, $zero
    lui         $s4, 0x8000
    addiu       $s4, $s4, 0xE28
    lw          $a0, 0x3C($s0)
    bltz        $a0, . + 4 + (0x70 << 2)
    nop
    lw          $a2, 0x18($s0)
    sll         $v0, $a2, 2
    addu        $v0, $s2, $v0
    lbu         $v1, 0x18($v0)
    lw          $v0, 0x40($s0)
    addu        $v0, $v0, $v1
    bne         $a0, $v0, . + 4 + (0x54 << 2)
    nop
    sll         $v0, $a2, 2
    addu        $v0, $s2, $v0
    lhu         $a0, 0x1A($v0)
    jal         func_8001A958
    addu        $s1, $zero, $zero
    lw          $v1, 0x18($s0)
    sll         $v1, $v1, 2
    addu        $v1, $s2, $v1
    lbu         $v1, 0x19($v1)
    addu        $a0, $v0, $zero
    sltiu       $v0, $v1, 0x8
    beqz        $v0, . + 4 + (0x32 << 2)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s4
    lw          $v0, 0x0($v0)
    jr          $v0
    nop
.end func_800AAEF0
