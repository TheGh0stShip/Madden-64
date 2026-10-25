.text
.align 2
.set noreorder
.globl func_800A2E24
.ent func_800A2E24
func_800A2E24:
    lw          $v1, 0xC10($v1)
    sll         $v0, $s1, 16
    slt         $v0, $zero, $v0
    andi        $v1, $v1, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, . + 4 + (0x8 << 2)
    sll         $v0, $s1, 16
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
    bnez        $v0, . + 4 + (0x4 << 2)
.end func_800A2E24
