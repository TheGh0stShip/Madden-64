.text
.align 2
.set noreorder
.globl func_80096A00
.ent func_80096A00
func_80096A00:
    sll         $a0, $s3, 16
    sll         $v0, $v0, 2
    sll         $v1, $a3, 5
    addu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D98($at)
    lui         $a0, 0x8009
    lw          $a0, -0x6A24($a0)
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    andi        $v0, $v0, 0x1FFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lw          $v0, 0x4($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, 0x2DBC($at)
    j           func_80092630
    addiu       $v0, $zero, -0x1
.end func_80096A00
