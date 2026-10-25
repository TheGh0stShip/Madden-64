.text
.align 2
.set noreorder
.globl func_800BBB18
.ent func_800BBB18
func_800BBB18:
    bne         $v1, $at, .L800BBB2C
    lui         $at, 0x8000
    bne         $v0, $at, .L800BBB2C
    nop
    break       6
.L800BBB2C:
    .word       0x00004012  # mflo        $t0
    bnez        $a1, .L800BBB3C
    addu        $v0, $a0, $t0
    subu        $v0, $a0, $t0
.L800BBB3C:
    jr          $ra
    nop
.end func_800BBB18
