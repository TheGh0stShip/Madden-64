.text
.align 2
.set noreorder
.globl func_80097940
.ent func_80097940
func_80097940:
    addu        $a1, $zero, $zero
    addu        $v1, $zero, $zero
    lui         $t0, 0x8009
    addiu       $t0, $t0, -0x6B70
    addiu       $a3, $zero, -0x1
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x6A68
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    sll         $v0, $v1, 16
.L80097968:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $t0
    lw          $v0, 0x0($v0)
    beq         $v0, $a3, .L800979B0
    nop
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a2
    lh          $v0, 0x0($v0)
    bnel        $v0, $a0, .L80097998
    addiu       $v0, $v1, 0x1
    j           func_8009328C
    addiu       $a1, $zero, 0x1
.L80097998:
    addu        $v1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnel        $v0, $zero, .L80097968
    sll         $v0, $v1, 16
.L800979B0:
    jr          $ra
    addu        $v0, $a1, $zero
.end func_80097940
