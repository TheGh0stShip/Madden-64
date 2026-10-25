.text
.align 2
.set noreorder
.globl func_80096AF8
.ent func_80096AF8
func_80096AF8:
    sll         $a0, $s3, 16
    sra         $a0, $a0, 16
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lui         $v1, 0x8007
    lhu         $v1, -0x4856($v1)
    sll         $v0, $v0, 2
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    lw          $v1, 0x4($v1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    j           func_8009263C
    sll         $a0, $s3, 16
.end func_80096AF8
