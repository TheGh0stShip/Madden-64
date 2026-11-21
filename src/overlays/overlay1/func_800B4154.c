#include "types.h"

typedef struct {
    u8 pad00[0x28];
} RecordD3C24;

typedef struct {
    RecordD3C24 records[213];
    u8 pad[4];
} RecordTable;

typedef struct {
    s16 value;
    u8 low;
    u8 high;
} RangeStat;

typedef struct {
    u8 pad00[8];
    RangeStat stats[2][18];
} RangeRoot;

typedef struct {
    u8 count;
    u8 keys[11];
    u16 values[11];
    u8 low;
    u8 high;
    u16 sum;
} RangeRequest;

extern RangeRoot *D_8006EA74;
extern RecordTable D_80080D6A[];

u16 func_80022538(u16 index, s32 lower, s32 upper, s32 mode);
s32 func_800D20A0(char *, s32, u8);
void range_statistics_update(RangeRequest *);
void func_800B0548(void);

void func_800AFA30(void) {
    u16 keys[2][23];
    u16 values[2][23];
    RangeRequest req;
    u32 i;
    u32 j;
    u16 id;
    RecordTable *table;
    RecordD3C24 *records = 0;

    table = D_80080D6A;
    for (i = 0; i < 2; i++) {
        j = 0;
        records = table[i].records;
        for (; j < 23; j++) {
            if (j == 3) {
                id = func_80022538(i, 0, 3, 0);
            } else if (j == 21) {
                id = func_80022538(i, 0, 3, 1);
            } else if (j == 12) {
                id = func_80022538(i, 3, 12, 0);
            } else if (j == 22) {
                id = func_80022538(i, 3, 12, 1);
            } else if (j == 15) {
                id = func_80022538(i, 15, 15, 0);
            } else if (j < 10) {
                id = func_80022538(i, 0, (s16)j, 0);
            } else {
                id = func_80022538(i, 3, (s16)j, 0);
            }
            keys[i][j] = id;
            values[i][j] = func_800D20A0((char *)&records[(s16)id], 0, 0xFF);
        }
    }

    for (i = 0; i < 2; i++) {
        req.count = 3;
        req.keys[0] = keys[i][5];
        req.keys[1] = keys[i][6];
        req.keys[2] = keys[i][7];
        req.values[0] = values[i][5];
        req.values[1] = values[i][6];
        req.values[2] = values[i][7];
        range_statistics_update(&req);
        D_8006EA74->stats[i][0].value = req.sum / 3;
        D_8006EA74->stats[i][0].low = req.low;
        D_8006EA74->stats[i][0].high = req.high;

        req.count = 3;
        req.keys[0] = keys[i][6];
        req.keys[1] = keys[i][7];
        req.keys[2] = keys[i][8];
        req.values[0] = values[i][6];
        req.values[1] = values[i][7];
        req.values[2] = values[i][8];
        range_statistics_update(&req);
        D_8006EA74->stats[i][1].value = req.sum / 3;
        D_8006EA74->stats[i][1].low = req.low;
        D_8006EA74->stats[i][1].high = req.high;

        req.count = 3;
        req.keys[0] = keys[i][8];
        req.keys[1] = keys[i][9];
        req.keys[2] = keys[i][7];
        req.values[0] = values[i][8];
        req.values[1] = values[i][9];
        req.values[2] = values[i][7];
        range_statistics_update(&req);
        D_8006EA74->stats[i][2].value = req.sum / 3;
        D_8006EA74->stats[i][2].low = req.low;
        D_8006EA74->stats[i][2].high = req.high;

        D_8006EA74->stats[i][3].value = values[i][21];
        D_8006EA74->stats[i][3].low = keys[i][21];
        D_8006EA74->stats[i][3].high = keys[i][21];

        D_8006EA74->stats[i][4].value = values[i][3];
        D_8006EA74->stats[i][4].low = keys[i][3];
        D_8006EA74->stats[i][4].high = keys[i][3];

        D_8006EA74->stats[i][5].value =
            ((values[i][5] + values[i][6] + values[i][7] + values[i][8] + values[i][9] + values[i][4]) / 6 +
             values[i][1] + values[i][2]) / 3;

        req.count = 8;
        req.keys[0] = keys[i][5];
        req.keys[1] = keys[i][6];
        req.keys[2] = keys[i][7];
        req.keys[3] = keys[i][8];
        req.keys[4] = keys[i][9];
        req.keys[5] = keys[i][4];
        req.keys[6] = keys[i][1];
        req.keys[7] = keys[i][2];
        req.values[0] = values[i][5];
        req.values[1] = values[i][6];
        req.values[2] = values[i][7];
        req.values[3] = values[i][8];
        req.values[4] = values[i][9];
        req.values[5] = values[i][4];
        req.values[6] = values[i][1];
        req.values[7] = values[i][2];
        range_statistics_update(&req);
        D_8006EA74->stats[i][5].low = req.low;
        D_8006EA74->stats[i][5].high = req.high;

        req.count = 1;
        req.keys[0] = keys[i][1];
        req.values[0] = values[i][1];
        range_statistics_update(&req);
        D_8006EA74->stats[i][16].low = req.low;
        D_8006EA74->stats[i][16].high = req.high;

        req.count = 1;
        req.keys[0] = keys[i][0];
        req.values[0] = values[i][0];
        range_statistics_update(&req);
        D_8006EA74->stats[i][17].low = req.low;
        D_8006EA74->stats[i][17].high = req.high;

        D_8006EA74->stats[i][6].value =
            ((values[i][5] + values[i][6] + values[i][7] + values[i][8] + values[i][9]) / 5 + values[i][4] +
             values[i][1] + values[i][2] + values[i][3] + values[i][21] + values[i][0] * 2) / 8;

        req.count = 11;
        req.keys[0] = keys[i][5];
        req.keys[1] = keys[i][6];
        req.keys[2] = keys[i][7];
        req.keys[3] = keys[i][8];
        req.keys[4] = keys[i][9];
        req.keys[5] = keys[i][4];
        req.keys[6] = keys[i][1];
        req.keys[7] = keys[i][2];
        req.keys[8] = keys[i][3];
        req.keys[9] = keys[i][21];
        req.keys[10] = keys[i][0];
        req.values[0] = values[i][5];
        req.values[1] = values[i][6];
        req.values[2] = values[i][7];
        req.values[3] = values[i][8];
        req.values[4] = values[i][9];
        req.values[5] = values[i][4];
        req.values[6] = values[i][1];
        req.values[7] = values[i][2];
        req.values[8] = values[i][3];
        req.values[9] = values[i][21];
        req.values[10] = values[i][0];
        range_statistics_update(&req);
        D_8006EA74->stats[i][6].low = req.low;
        D_8006EA74->stats[i][6].high = req.high;

        req.count = 3;
        req.keys[0] = keys[i][22];
        req.keys[1] = keys[i][11];
        req.keys[2] = keys[i][16];
        req.values[0] = values[i][22];
        req.values[1] = values[i][11];
        req.values[2] = values[i][16];
        range_statistics_update(&req);
        D_8006EA74->stats[i][7].value = req.sum / 3;
        D_8006EA74->stats[i][7].low = req.low;
        D_8006EA74->stats[i][7].high = req.high;

        req.count = 3;
        req.keys[0] = keys[i][12];
        req.keys[1] = keys[i][22];
        req.keys[2] = keys[i][14];
        req.values[0] = values[i][12];
        req.values[1] = values[i][22];
        req.values[2] = values[i][14];
        range_statistics_update(&req);
        D_8006EA74->stats[i][8].value = req.sum / 3;
        D_8006EA74->stats[i][8].low = req.low;
        D_8006EA74->stats[i][8].high = req.high;

        req.count = 3;
        req.keys[0] = keys[i][12];
        req.keys[1] = keys[i][10];
        req.keys[2] = keys[i][13];
        req.values[0] = values[i][12];
        req.values[1] = values[i][10];
        req.values[2] = values[i][13];
        range_statistics_update(&req);
        D_8006EA74->stats[i][9].value = req.sum / 3;
        D_8006EA74->stats[i][9].low = req.low;
        D_8006EA74->stats[i][9].high = req.high;

        req.count = 3;
        req.keys[0] = keys[i][16];
        req.keys[1] = keys[i][14];
        req.keys[2] = keys[i][13];
        req.values[0] = values[i][16];
        req.values[1] = values[i][14];
        req.values[2] = values[i][13];
        range_statistics_update(&req);
        D_8006EA74->stats[i][10].value = req.sum / 3;
        D_8006EA74->stats[i][10].low = req.low;
        D_8006EA74->stats[i][10].high = req.high;

        D_8006EA74->stats[i][11].value = values[i][18];
        D_8006EA74->stats[i][11].low = D_8006EA74->stats[i][11].high = keys[i][18];

        D_8006EA74->stats[i][12].value = values[i][17];
        D_8006EA74->stats[i][12].low = D_8006EA74->stats[i][12].high = keys[i][17];

        req.count = 2;
        req.keys[0] = keys[i][19];
        req.keys[1] = keys[i][20];
        req.values[0] = values[i][19];
        req.values[1] = values[i][20];
        range_statistics_update(&req);
        D_8006EA74->stats[i][13].value = req.sum / 2;
        D_8006EA74->stats[i][13].low = req.low;
        D_8006EA74->stats[i][13].high = req.high;

        req.count = 7;
        req.keys[0] = keys[i][12];
        req.keys[1] = keys[i][22];
        req.keys[2] = keys[i][10];
        req.keys[3] = keys[i][11];
        req.keys[4] = keys[i][16];
        req.keys[5] = keys[i][13];
        req.keys[6] = keys[i][14];
        req.values[0] = values[i][12];
        req.values[1] = values[i][22];
        req.values[2] = values[i][10];
        req.values[3] = values[i][11];
        req.values[4] = values[i][16];
        req.values[5] = values[i][13];
        req.values[6] = values[i][14];
        range_statistics_update(&req);
        D_8006EA74->stats[i][14].value = req.sum / 7;
        D_8006EA74->stats[i][14].low = req.low;
        D_8006EA74->stats[i][14].high = req.high;

        D_8006EA74->stats[i][15].value =
            (D_8006EA74->stats[i][10].value + values[i][18] + values[i][17] + values[i][19] + values[i][20]) / 5;

        req.count = 7;
        req.keys[0] = keys[i][16];
        req.keys[1] = keys[i][13];
        req.keys[2] = keys[i][14];
        req.keys[3] = keys[i][18];
        req.keys[4] = keys[i][17];
        req.keys[5] = keys[i][20];
        req.keys[6] = keys[i][19];
        req.values[0] = values[i][16];
        req.values[1] = values[i][13];
        req.values[2] = values[i][14];
        req.values[3] = values[i][18];
        req.values[4] = values[i][17];
        req.values[5] = values[i][20];
        req.values[6] = values[i][19];
        range_statistics_update(&req);
        D_8006EA74->stats[i][15].low = req.low;
        D_8006EA74->stats[i][15].high = req.high;
    }
    func_800B0548();
}
