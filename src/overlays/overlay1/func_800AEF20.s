.text
.align 2
.set noreorder
.globl func_800AEF20
.ent func_800AEF20
func_800AEF20:
    lhu         $a0, 0x0($s6)
    sll         $v0, $s1, 16
    sra         $a2, $v0, 16
    sll         $v0, $a2, 2
    addu        $v1, $v0, $s2
    lw          $v0, 0x0($v1)
    beq         $a0, $v0, . + 4 + (0xF9 << 2)
    addiu       $v0, $s1, 0x1
    sw          $a0, 0x0($v1)
    lh          $a0, 0x0($s6)
    sll         $a1, $a2, 3
    addu        $a1, $a1, $a2
    jal         func_800167FC
    addu        $a1, $a1, $s3
    j           func_800AABF0
    addiu       $a0, $zero, 0xA
.end func_800AEF20
