.text
.align 2
.set noreorder
.globl func_800BCE5C
.ent func_800BCE5C
func_800BCE5C:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0xD9
.end func_800BCE5C
