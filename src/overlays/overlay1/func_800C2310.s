.text
.align 2
.set noreorder
.globl func_800C2310
.ent func_800C2310
func_800C2310:
    lw          $v0, 0xC10($v0)
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x6B70
    andi        $v0, $v0, 0x100
    beqz        $v0, .L800C2330
    nop
    lui         $at, 0x8009
    sb          $zero, -0x6AE6($at)
.L800C2330:
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, . + 4 + (0x4C << 2)
    addiu       $s4, $zero, -0x1
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x6A68
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x5040
    lw          $v0, 0x0($s1)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s5
    lh          $a0, 0x0($v0)
    bnel        $a0, $s3, . + 4 + (0x3F << 2)
    addiu       $s1, $s1, 0x4
.end func_800C2310
