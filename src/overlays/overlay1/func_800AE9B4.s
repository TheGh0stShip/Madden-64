.text
.align 2
.set noreorder
.globl func_800AE9B4
.ent func_800AE9B4
func_800AE9B4:
    jal         func_800AE700
    nop
    lui         $a0, 0x800B
    addiu       $a0, $a0, -0x188C
    jal         func_8002FFEC
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8007
    lw          $a1, -0x4700($a1)
    jal         func_8000D834
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x46B8
    jal         func_8003E23C
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CBC($a0)
    lui         $at, 0x8007
    sw          $zero, -0x4704($at)
    lui         $at, 0x8007
    sw          $zero, -0x4700($at)
    lui         $at, 0x8007
    sw          $zero, -0x4708($at)
    jal         func_80033360
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x4DF4($a0)
    jal         func_80033360
    nop
    lui         $a1, 0x8007
    lw          $a1, -0x462C($a1)
    beqz        $a1, .L800AEA44
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
.L800AEA44:
    lui         $at, 0x8007
.end func_800AE9B4
