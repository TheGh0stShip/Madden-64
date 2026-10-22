#include "os_internal.h"

extern void __osResetGlobalIntMask(u32 mask);
extern void __osSetGlobalIntMask(u32 mask);
extern void osYieldThread(void);

void __osDevMgrMain(void* argument) {
    OSIoMesg* message;
    OSMesg eventMessage;
    OSMesg accessMessage;
    s32 result;
    OSDevMgr* manager;
    s32 sendSecondMessage = 0;

    manager = (OSDevMgr*)argument;
    message = 0;
    result = 0;

    while (1) {
        osRecvMesg(manager->cmdQueue, (OSMesg*)&message, 1);
        if (message->piHandle != 0 && message->piHandle->type == 2 &&
            (message->piHandle->transferInfo.cmdType == 0 ||
             message->piHandle->transferInfo.cmdType == 1)) {
            OSBlockInfo* block;
            OSTranxInfo* transfer;

            transfer = &message->piHandle->transferInfo;
            block = &transfer->block[transfer->blockNum];
            transfer->sectorNum = -1;
            if (transfer->transferMode != 3) {
                block->dramAddr =
                    (void*)((u32)block->dramAddr - block->sectorSize);
            }
            if (transfer->transferMode == 2 &&
                message->piHandle->transferInfo.cmdType == 0) {
                sendSecondMessage = 1;
            } else {
                sendSecondMessage = 0;
            }
            osRecvMesg(manager->acsQueue, &accessMessage, 1);
            __osResetGlobalIntMask(0x00100401);
            __osEPiRawWriteIo(message->piHandle, 0x05000510,
                              transfer->bmCtlShadow | 0x80000000);

read_block:
            osRecvMesg(manager->evtQueue, &eventMessage, 1);
            transfer = &message->piHandle->transferInfo;
            block = &transfer->block[transfer->blockNum];
            if (block->errStatus == 29) {
                u32 status;

                __osEPiRawWriteIo(message->piHandle, 0x05000510,
                                  transfer->bmCtlShadow | 0x10000000);
                __osEPiRawWriteIo(message->piHandle, 0x05000510,
                                  transfer->bmCtlShadow);
                __osEPiRawReadIo(message->piHandle, 0x05000508, &status);
                if (status & 0x02000000) {
                    __osEPiRawWriteIo(message->piHandle, 0x05000510,
                                      transfer->bmCtlShadow | 0x01000000);
                }
                block->errStatus = 4;
                *(volatile u32*)0xA4600010 = 2;
                __osSetGlobalIntMask(0x00100C01);
            }
            osSendMesg(message->hdr.retQueue, message, 0);
            if (sendSecondMessage == 1 &&
                message->piHandle->transferInfo.block[0].errStatus == 0) {
                sendSecondMessage = 0;
                goto read_block;
            }
            osSendMesg(manager->acsQueue, 0, 0);
            if (message->piHandle->transferInfo.blockNum == 1) {
                osYieldThread();
            }
        } else {
            switch (message->hdr.type) {
            case 11:
                osRecvMesg(manager->acsQueue, &accessMessage, 1);
                result = manager->dma(0, message->devAddr,
                                      message->dramAddr, message->size);
                break;
            case 12:
                osRecvMesg(manager->acsQueue, &accessMessage, 1);
                result = manager->dma(1, message->devAddr,
                                      message->dramAddr, message->size);
                break;
            case 15:
                osRecvMesg(manager->acsQueue, &accessMessage, 1);
                result = manager->edma(message->piHandle, 0,
                                       message->devAddr, message->dramAddr,
                                       message->size);
                break;
            case 16:
                osRecvMesg(manager->acsQueue, &accessMessage, 1);
                result = manager->edma(message->piHandle, 1,
                                       message->devAddr, message->dramAddr,
                                       message->size);
                break;
            case 10:
                osSendMesg(message->hdr.retQueue, message, 0);
                result = -1;
                break;
            default:
                result = -1;
                break;
            }
            if (result == 0) {
                osRecvMesg(manager->evtQueue, &eventMessage, 1);
                osSendMesg(message->hdr.retQueue, message, 0);
                osSendMesg(manager->acsQueue, 0, 0);
            }
        }
    }
}
