.text
.align 2
.set noreorder
.globl func_800A00A4
.ent func_800A00A4
func_800A00A4:
    lui         $v1, 0x8008
    lw          $v1, 0x741C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC40($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    sw          $v0, 0x1C($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x741C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC44($v0)
    sw          $v0, 0x20($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x74CC($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC50($v0)
    sw          $v0, 0x1C($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x74CC($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC54($v0)
    sw          $v0, 0x20($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x757C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC60($v0)
    sw          $v0, 0x1C($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x757C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC64($v0)
    sw          $v0, 0x20($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x762C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC70($v0)
    sw          $v0, 0x1C($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x762C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC74($v0)
    jal         func_8009BA3C
    sw          $v0, 0x20($v1)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A00A4
