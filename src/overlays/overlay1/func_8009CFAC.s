.text
.align 2
.set noreorder
.globl func_8009CFAC
.ent func_8009CFAC
func_8009CFAC:
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    addiu       $v0, $a0, 0x8
    addiu       $a0, $a0, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $at, 0x8008
    sw          $a0, 0x4F5C($at)
    sra         $v1, $v1, 1
    j           func_800988CC
    addu        $s3, $s3, $v1
.end func_8009CFAC
