.text
.align 2
.set noreorder
.globl func_800B7B48
.ent func_800B7B48
func_800B7B48:
    addiu       $s1, $zero, 0xA
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sw          $v0, -0x5DD8($at)
    j           func_800B3448
    addu        $s2, $s3, $zero
.end func_800B7B48
