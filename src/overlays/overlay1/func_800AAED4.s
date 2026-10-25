.text
.align 2
.set noreorder
.globl func_800AAED4
.ent func_800AAED4
func_800AAED4:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s3, 0x1C($sp)
    sw          $ra, 0x24($sp)
.end func_800AAED4
