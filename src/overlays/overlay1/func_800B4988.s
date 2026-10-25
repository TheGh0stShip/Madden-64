.text
.align 2
.set noreorder
.globl func_800B4988
.ent func_800B4988
func_800B4988:
    lw          $v1, -0x158C($v1)
    addu        $v1, $v1, $s2
    .word       0x00004810  # mfhi        $t1
    srl         $v0, $t1, 1
    sh          $v0, 0x30($v1)
    lbu         $v0, 0xF2($sp)
    sb          $v0, 0x32($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $v1, 0xF3($sp)
    addu        $v0, $v0, $s2
    sb          $v1, 0x33($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lhu         $v1, 0x24($s0)
    addu        $v0, $v0, $s2
    sh          $v1, 0x34($v0)
.end func_800B4988
