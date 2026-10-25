.text
.align 2
.set noreorder
.globl func_80096B5C
.ent func_80096B5C
func_80096B5C:
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v1, 0x2D9A($at)
    lui         $a0, 0x8009
    lw          $a0, -0x6A24($a0)
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4856
    sh          $v1, 0x0($a1)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    lw          $v1, 0x4($v1)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    lh          $v1, 0x0($a1)
    addiu       $v0, $zero, 0x59
    bne         $v1, $v0, .L80096BE4
    addiu       $v0, $zero, 0x9
    addiu       $v0, $zero, 0x27
    lui         $at, 0x8007
    sh          $v0, -0x4844($at)
    j           func_8009263C
    sll         $a0, $s3, 16
.L80096BE4:
    lui         $at, 0x8007
    sh          $v0, -0x4844($at)
    j           func_8009263C
    sll         $a0, $s3, 16
.end func_80096B5C
