.text
.align 2
.set noreorder
.globl func_800AF858
.ent func_800AF858
func_800AF858:
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s1, $v0
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0xEE4
    lb          $v1, 0x0($a2)
    lb          $a0, 0x1($a2)
    lb          $a1, 0x2($a2)
    sb          $v1, 0x0($v0)
    sb          $a0, 0x1($v0)
    sb          $a1, 0x2($v0)
    jal         func_8004DF94
    addu        $a0, $s1, $zero
    sll         $v1, $s2, 16
    sra         $s0, $v1, 16
    addu        $a0, $s0, $zero
    sll         $v1, $v0, 16
    sra         $v1, $v1, 16
    addu        $v1, $s1, $v1
    addiu       $a2, $zero, 0x20
    sb          $a2, 0x0($v1)
    addiu       $v1, $v0, 0x1
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    addu        $v1, $s1, $v1
    addiu       $a1, $zero, 0x4F
    sb          $a1, 0x0($v1)
    addiu       $v1, $v0, 0x2
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    addu        $v1, $s1, $v1
    addiu       $a1, $zero, 0x4E
    sb          $a1, 0x0($v1)
    addiu       $v1, $v0, 0x3
.end func_800AF858
