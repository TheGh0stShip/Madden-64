.text
.align 2
.set noreorder
.globl func_800971DC
.ent func_800971DC
func_800971DC:
    lhu         $v1, 0x0($s5)
    addu        $v0, $s0, $v0
    lhu         $v0, 0x0($v0)
    andi        $v1, $v1, 0x2000
    or          $v0, $v0, $v1
    lui         $v1, 0x8009
    lw          $v1, -0x6A24($v1)
    j           func_80092B04
    sh          $v0, 0x0($s5)
.end func_800971DC
