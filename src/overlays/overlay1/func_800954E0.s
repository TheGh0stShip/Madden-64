.text
.align 2
.set noreorder
.globl func_800954E0
.ent func_800954E0
func_800954E0:
    beqz        $v0, . + 4 + (0x2E << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x5B8($at)
    jr          $v0
    nop
.end func_800954E0
