.text
.align 2
.set noreorder
.globl func_800A1C78
.ent func_800A1C78
func_800A1C78:
    addiu       $v0, $zero, 0x4
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x4($s2)
    lbu         $a1, 0x1($s0)
    lh          $a2, 0xA($s0)
    addu        $a0, $s2, $zero
    jal         func_800A0F60
    addu        $s1, $s3, $zero
    j           func_8009D7A0
    addiu       $s1, $s1, 0x1
.end func_800A1C78
