.text
.align 2
.set noreorder
.globl func_800AF250
.ent func_800AF250
func_800AF250:
    or          $v1, $v1, $v0
    beql        $v1, $a0, . + 4 + (0x32 << 2)
    addiu       $v0, $s1, 0x1
    bgtz        $a3, .L800AF28C
    sw          $v1, 0x0($a2)
    sll         $v0, $a1, 3
    addu        $v0, $v0, $a1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $s4, 0x5818($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x5819($at)
    j           func_800AABF0
    addiu       $a0, $zero, 0xF
.L800AF28C:
    sll         $v0, $a1, 3
    addu        $v0, $v0, $a1
    addiu       $v1, $zero, 0x47
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x5818($at)
    addiu       $v1, $zero, 0x4C
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x5819($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x581A($at)
    j           func_800AABF0
    addiu       $a0, $zero, 0xF
.end func_800AF250
