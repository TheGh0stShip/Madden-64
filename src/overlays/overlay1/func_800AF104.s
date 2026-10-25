.text
.align 2
.set noreorder
.globl func_800AF104
.ent func_800AF104
func_800AF104:
    sll         $v0, $s1, 16
    sra         $v1, $v0, 16
    sll         $v0, $v1, 2
    addu        $a1, $v0, $s2
    lw          $v0, 0x0($a1)
    beql        $a0, $v0, . + 4 + (0x81 << 2)
    addiu       $v0, $s1, 0x1
    bgtz        $a0, .L800AF150
    sw          $a0, 0x0($a1)
    sll         $v0, $v1, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $s4, 0x5818($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x5819($at)
    j           func_800AABF0
    addiu       $a0, $zero, 0xE
.L800AF150:
    sll         $a1, $v1, 3
    addu        $a1, $a1, $v1
    jal         func_800167FC
    addu        $a1, $a1, $s3
    j           func_800AABF0
    addiu       $a0, $zero, 0xE
.end func_800AF104
