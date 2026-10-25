.text
.align 2
.set noreorder
.globl func_800C2150
.ent func_800C2150
func_800C2150:
    lw          $a1, 0x0($v0)
    lbu         $v0, 0x21($a1)
    andi        $v0, $v0, 0xC0
    beq         $v0, $t5, . + 4 + (0x1D << 2)
    addiu       $v0, $a3, 0x1
    lh          $v0, 0x36($a1)
    beqz        $v0, . + 4 + (0x1A << 2)
    addiu       $v0, $a3, 0x1
    lw          $v1, 0x24($a1)
    lw          $v0, 0x1C($v1)
    lw          $v1, 0x20($v1)
    subu        $v0, $v0, $t3
    sra         $v0, $v0, 4
    sra         $t6, $v0, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
.end func_800C2150
