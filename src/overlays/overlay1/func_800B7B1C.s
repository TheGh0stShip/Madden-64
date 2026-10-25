.text
.align 2
.set noreorder
.globl func_800B7B1C
.ent func_800B7B1C
func_800B7B1C:
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x5DE8
    bnel        $s1, $zero, .L800B7B34
    sw          $zero, 0x0($v1)
    addiu       $v0, $zero, 0x800
    sw          $v0, 0x0($v1)
.L800B7B34:
    addiu       $v0, $zero, 0x5
    lui         $at, 0x8008
    sw          $v0, -0x5DD8($at)
    j           func_800B3448
    addiu       $s1, $zero, 0xA
.end func_800B7B1C
