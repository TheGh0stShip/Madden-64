.text
.align 2
.set noreorder
.globl func_800B7AB8
.ent func_800B7AB8
func_800B7AB8:
    addiu       $s1, $zero, 0x32
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sw          $v0, -0x5DD8($at)
    j           func_800B3448
    addu        $s2, $s3, $zero
.end func_800B7AB8
