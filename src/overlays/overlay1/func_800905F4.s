.text
.align 2
.set noreorder
.globl func_800905F4
.ent func_800905F4
func_800905F4:
    jal         func_80031A1C
    sh          $v1, 0x0($s1)
    addiu       $a0, $zero, 0x4
    jal         func_80031A1C
    addu        $s0, $v0, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xD
    addiu       $v0, $v0, 0x8
    addu        $s0, $s0, $v0
    lui         $at, 0x8007
    sb          $s0, -0x641D($at)
    jal         func_8000D740
    addu        $a2, $s1, $zero
    lui         $at, 0x8009
    sw          $v0, -0x5C18($at)
    addiu       $v0, $zero, 0x5
    lui         $at, 0x8007
    sb          $v0, -0x641D($at)
    addiu       $v0, $zero, 0x81
    lui         $at, 0x8007
    sb          $v0, -0x641E($at)
    j           func_8008BFE0
    nop
.end func_800905F4
