.text
.align 2
.set noreorder
.globl func_800AB010
.ent func_800AB010
func_800AB010:
    lw          $v1, 0x40($s0)
    sll         $v0, $a0, 16
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    j           func_800A6910
    sw          $v1, 0x40($s0)
.end func_800AB010
