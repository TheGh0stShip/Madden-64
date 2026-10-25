.text
.align 2
.set noreorder
.globl func_80090678
.ent func_80090678
func_80090678:
    addiu       $a1, $zero, 0xD
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $v1, 0x8009
    lhu         $v1, -0x7904($v1)
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x641C
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8007
    sb          $v0, -0x6415($at)
    jal         func_8000D740
    sh          $v1, 0x0($a2)
    lui         $at, 0x8009
    sw          $v0, -0x5C18($at)
    j           func_8008BFE0
    nop
.end func_80090678
