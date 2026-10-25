.text
.align 2
.set noreorder
.globl func_80098178
.ent func_80098178
func_80098178:
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lw          $a1, 0xB4($v0)
    jal         func_8000D834
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6A2C($v0)
    lw          $a0, 0xB8($v0)
    jal         func_80016FF4
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6A2C($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lw          $a1, 0xB8($v0)
    jal         func_8000D834
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6A2C($v0)
    lw          $a1, 0xBC($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80098178
