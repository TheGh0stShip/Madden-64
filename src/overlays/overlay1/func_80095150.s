.text
.align 2
.set noreorder
.globl func_80095150
.ent func_80095150
func_80095150:
    addu        $s1, $zero, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8009
    sh          $v0, -0x6D38($at)
    srl         $v1, $v1, 1
    beql        $v1, $zero, . + 4 + (0x15 << 2)
    addu        $s1, $zero, $zero
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x5040
    addiu       $s3, $s2, 0x58
    andi        $s0, $s1, 0xFFFF
    sll         $s0, $s0, 2
    addu        $v0, $s0, $s2
.end func_80095150
