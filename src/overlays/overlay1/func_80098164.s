.text
.align 2
.set noreorder
.globl func_80098164
.ent func_80098164
func_80098164:
    lw          $a1, 0xB4($v1)
    jal         func_8000D874
    addu        $a0, $v0, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x6A2C($v0)
.end func_80098164
