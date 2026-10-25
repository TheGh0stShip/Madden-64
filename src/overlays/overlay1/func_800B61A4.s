.text
.align 2
.set noreorder
.globl func_800B61A4
.ent func_800B61A4
func_800B61A4:
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    jal         func_8000C8A0
    sw          $s0, 0x10($sp)
    lui         $a1, 0x8008
    lw          $a1, -0x5E54($a1)
    jal         func_8000D874
    addu        $a0, $v0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8008
    lw          $a1, -0x5E54($a1)
    jal         func_8000D834
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x800A
    addiu       $a1, $a1, 0x3164
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6CE8
    jal         func_8000CB78
    addu        $a2, $s0, $zero
    lui         $a0, 0x8008
    lw          $a0, -0x5E50($a0)
    jal         func_800A2DB8
    nop
    jal         func_800A2D44
    addu        $a0, $s0, $zero
    lui         $a1, 0x8008
    lw          $a1, -0x5E50($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lui         $v0, 0x8008
    lw          $v0, -0x5E4C($v0)
    sw          $v0, 0x1C($v1)
    lui         $v0, 0x8008
    lw          $v0, -0x5E48($v0)
    sw          $v0, 0x20($v1)
    lui         $v0, 0x8008
    lw          $v0, -0x5E44($v0)
    sw          $v0, 0x24($v1)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B61A4
