.text
.align 2
.set noreorder
.globl shifted_call_800B51EC
.ent shifted_call_800B51EC
shifted_call_800B51EC:
    srl $a0,$a0,3
    j func_800B51EC
     nop
.end shifted_call_800B51EC
