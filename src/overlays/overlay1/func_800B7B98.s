.text
.align 2
.set noreorder
.globl func_800B7B98
.ent func_800B7B98
func_800B7B98:
    addu        $s2, $s3, $zero
    lui         $at, 0x8007
    sw          $s3, -0x564C($at)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x5A20
    jal         func_800A6590
    addiu       $a1, $zero, 0x7
    jal         func_800B6378
.end func_800B7B98
