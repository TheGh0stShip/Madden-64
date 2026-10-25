.text
.align 2
.set noreorder
.globl func_800BC818
.ent func_800BC818
func_800BC818:
    lui         $at, 0x8008
    sw          $s0, -0x5BB8($at)
    sltiu       $v0, $s1, 0x19
    beqz        $v0, . + 4 + (0x2AD << 2)
    sll         $v0, $s1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x25B8($at)
    jr          $v0
    nop
.end func_800BC818
