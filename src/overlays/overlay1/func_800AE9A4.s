.text
.align 2
.set noreorder
.globl func_800AE9A4
.ent func_800AE9A4
func_800AE9A4:
    lui         $a1, 0x8007
    lw          $a1, -0x4700($a1)
    jal         func_8000D874
    nop
.end func_800AE9A4
