.text
.align 2
.set noreorder
.globl func_800BCFAC
.ent func_800BCFAC
func_800BCFAC:
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sw          $v0, -0x5BE0($at)
    addiu       $v0, $zero, -0x1
.end func_800BCFAC
