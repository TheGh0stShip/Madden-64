.text
.align 2
.set noreorder
.globl func_800B96C0
.ent func_800B96C0
func_800B96C0:
    beqz        $v0, .L800B9700
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8CC
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x49E0($v1)
    lw          $v0, 0x20($v1)
    negu        $v0, $v0
    sw          $v0, 0x20($v1)
    lui         $v1, 0x8009
    lw          $v1, -0x49DC($v1)
    lw          $v0, 0x20($v1)
    negu        $v0, $v0
    sw          $v0, 0x20($v1)
.L800B9700:
    lui         $v1, 0x8008
    lw          $v1, 0x7950($v1)
    beqz        $v1, . + 4 + (0x4 << 2)
.end func_800B96C0
