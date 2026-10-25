.text
.align 2
.set noreorder
.globl func_800AE700
.ent func_800AE700
func_800AE700:
    bnez        $v0, . + 4 + (-0xA << 2)
    sll         $v0, $a1, 16
    addiu       $a0, $zero, 0x3
    lui         $at, 0x8009
    sh          $zero, -0x58E4($at)
    jal         func_8000D8DC
    addu        $a1, $zero, $zero
    lui         $a0, 0x8007
    lw          $a0, -0x4708($a0)
    lw          $v1, 0x8($v0)
    addu        $a1, $v0, $zero
    lui         $at, 0x8007
    sw          $a1, -0x4700($at)
    lui         $at, 0x8007
    sw          $v1, -0x4704($at)
    jal         func_8000D834
    nop
    addu        $a1, $zero, $zero
    lui         $a3, 0x8009
    addiu       $a3, $a3, -0x6AD0
    lui         $a2, 0x8000
.L800AE754:
    sll         $v0, $a1, 16
    addiu       $a0, $a1, 0x1
    addu        $a1, $a0, $zero
    sra         $v0, $v0, 16
    sll         $v1, $v0, 3
    addu        $v1, $v1, $v0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a3
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    slti        $a0, $a0, 0x8
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, 0x5818($at)
    bnez        $a0, .L800AE754
    sw          $a2, 0x0($v0)
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x46FC
    jal         func_8001AD78
    addiu       $s0, $zero, -0x1
    addiu       $a0, $zero, 0x80
    jal         func_8003332C
    addiu       $a1, $zero, 0x60
    addiu       $a0, $zero, 0x80
    lui         $at, 0x8009
    sw          $v0, -0x6CBC($at)
    jal         func_8003332C
    addiu       $a1, $zero, 0x60
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x4DF4($at)
    lui         $at, 0x8007
    sh          $s0, -0x4644($at)
    lui         $at, 0x8007
    sh          $s0, -0x4642($at)
    lui         $at, 0x8007
    sh          $s0, -0x4640($at)
.end func_800AE700
