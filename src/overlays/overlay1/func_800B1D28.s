.text
.align 2
.set noreorder
.globl func_800B1D28
.ent func_800B1D28
func_800B1D28:
    sw          $ra, 0x20($sp)
    sll         $v0, $a0, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xFB8($at)
    jr          $v0
    nop
.end func_800B1D28
