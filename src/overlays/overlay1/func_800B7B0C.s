.text
.align 2
.set noreorder
.globl func_800B7B0C
.ent func_800B7B0C
func_800B7B0C:
    lui         $at, 0x8008
    sw          $v1, -0x5DC4($at)
    j           func_800B3448
    addiu       $s1, $zero, 0xA
.end func_800B7B0C
