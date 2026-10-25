.text
.align 2
.set noreorder
.globl func_800A1DB0
.ent func_800A1DB0
func_800A1DB0:
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    addu        $s1, $s3, $zero
    sll         $v0, $v0, 16
    j           func_8009D79C
    sw          $v0, 0x4($s2)
.end func_800A1DB0
