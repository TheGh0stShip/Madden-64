.text
.align 2
.set noreorder
.globl func_800BB764
.ent func_800BB764
func_800BB764:
    addu        $s3, $a2, $zero
    lui         $a0, 0x8007
    lw          $a0, 0x1934($a0)
    jal         func_80033298
    nop
    addu        $s0, $v0, $zero
    sw          $s0, 0x0($s2)
    sw          $zero, 0x0($s0)
    j           func_800B7188
    sw          $zero, 0x4($s0)
.end func_800BB764
