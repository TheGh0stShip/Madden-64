/* resident data 0x800649FC..0x80075D00: generated from results/data-ledger.tsv by tools/gen.py */
#include "types.h"

/* Vtx_t: N64 GBI vertex (position, flag, texture coordinates, RGBA or normal+alpha). */
typedef struct { s16 ob[3]; u16 flag; s16 tc[2]; u8 cn[4]; } Vtx_t;

extern u8 D_800021CC[];
extern u8 D_80002220[];
extern u8 D_80002244[];
extern u8 D_80002368[];
extern u8 D_800023E4[];
extern u8 D_80002570[];
extern u8 D_80002574[];
extern u8 D_80002578[];
extern u8 D_8000257C[];
extern u8 D_80002580[];
extern u8 D_80002584[];
extern u8 D_80002588[];
extern u8 D_8000258C[];
extern u8 D_80002590[];
extern u8 D_80002594[];
extern u8 D_80002598[];
extern u8 D_8000259C[];
extern u8 D_80002690[];
extern u8 D_80002704[];
extern u8 D_80002774[];
extern u8 D_80002784[];
extern u8 D_80002798[];
extern u8 D_800027A4[];
extern u8 D_800027B4[];
extern u8 D_80002CB8[];
extern u8 D_80002CC0[];
extern u8 D_80002CCC[];
extern u8 D_80002CD8[];
extern u8 D_80002CE4[];
extern u8 D_80002CF0[];
extern u8 D_80002CFC[];
extern u8 D_80002D04[];
extern u8 D_80002D08[];
extern u8 D_8000DCC8[];
extern u8 D_8000DD1C[];
extern u8 D_8000DD64[];
extern u8 D_8000DD6C[];
extern u8 D_8000E5F8[];
extern u8 D_8000E788[];
extern u8 D_8000E7EC[];
extern u8 D_8000F2CC[];
extern u8 D_8000F450[];
extern u8 D_8000F814[];
extern u8 D_8000F8B8[];
extern u8 D_8000F8EC[];
extern u8 D_800116B8[];
extern u8 D_800118FC[];
extern u8 D_80011B5C[];
extern u8 D_80011B64[];
extern u8 D_800127B8[];
extern u8 D_800139E8[];
extern u8 D_80013B54[];
extern u8 D_80013B5C[];
extern u8 D_80017CEC[];
extern u8 D_80017EAC[];
extern u8 D_80018048[];
extern u8 D_80018050[];
extern u8 D_8001B138[];
extern u8 D_8001B44C[];
extern u8 D_8001B544[];
extern u8 D_8001B54C[];
extern u8 D_8001B590[];
extern u8 D_8001B5B8[];
extern u8 D_8001BC04[];
extern u8 D_800404C8[];
extern u8 D_80041050[];
extern u8 D_80041438[];
extern u8 D_80041504[];
extern u8 D_800420A0[];
extern u8 D_800420A8[];
extern u8 D_80043D7C[];
extern u8 D_80044364[];
extern u8 D_80044424[];
extern u8 D_80044454[];
extern u8 D_8007A0C4[];
extern u8 D_8007A0C7[];
extern u8 D_8007BD08[];
extern u8 D_8007D1D8[];
extern u8 D_8007E588[];
extern u8 D_80080C91[];
extern u8 D_80080CA6[];
extern u8 D_80080CBB[];
extern u8 D_80080CE5[];
extern u8 D_80082DDD[];
extern u8 D_80082DF2[];
extern u8 D_80082E07[];
extern u8 D_80082E31[];
extern u8 D_80085818[];
extern u8 D_80085821[];
extern u8 D_8008582A[];
extern u8 D_80085833[];
extern u8 D_8008583C[];
extern u8 D_80085845[];
extern u8 D_8008584E[];
extern u8 D_80085857[];
extern u8 D_800951AC[];
extern u8 D_80095664[];
extern u8 D_800956A8[];
extern u8 D_80095874[];
extern u8 D_80095F98[];
extern u8 D_80097150[];
extern u8 D_800971E4[];
extern u8 D_800971EC[];
extern u8 D_800971F4[];
extern u8 D_80097888[];
extern u8 D_800978CC[];
extern u8 D_80097930[];
extern u8 D_80097938[];
extern u8 D_80098E58[];
extern u8 D_800992AC[];
extern u8 D_80099370[];
extern u8 D_80099378[];
extern u8 D_8009A768[];
extern u8 D_8009A9EC[];
extern u8 D_8009AF9C[];
extern u8 D_8009AFD8[];
extern u8 D_8009AFE0[];
extern u8 D_8009B0E4[];
extern u8 D_8009B10C[];
extern u8 D_8009B114[];
extern u8 D_8009E3EC[];
extern u8 D_8009E528[];
extern u8 D_8009E68C[];
extern u8 D_8009E764[];
extern u8 D_8009E78C[];
extern u8 D_8009EA50[];
extern u8 D_8009ECD8[];
extern u8 D_8009EFB8[];
extern u8 D_8009F350[];
extern u8 D_8009F360[];
extern u8 D_8009F37C[];
extern u8 D_8009F388[];
extern u8 D_8009F3C8[];
extern u8 D_8009F454[];
extern u8 D_8009F4E8[];
extern u8 D_8009F5EC[];
extern u8 D_8009F698[];
extern u8 D_8009FC00[];
extern u8 D_8009FC44[];
extern u8 D_8009FD98[];
extern u8 D_800A0144[];
extern u8 D_800A03E4[];
extern u8 D_800A03F0[];
extern u8 D_800A0720[];
extern u8 D_800A0DA4[];
extern u8 D_800A0FD4[];
extern u8 D_800A10D8[];
extern u8 D_800A10E4[];
extern u8 D_800A125C[];
extern u8 D_800A12A4[];
extern u8 D_800A13B8[];
extern u8 D_800A13C0[];
extern u8 D_800A167C[];
extern u8 D_800A16AC[];
extern u8 D_800A382C[];
extern u8 D_800A39FC[];
extern u8 D_800A3BFC[];
extern u8 D_800A3DDC[];
extern u8 D_800A4484[];
extern u8 D_800A46C8[];
extern u8 D_800A4790[];
extern u8 D_800A48B0[];
extern u8 D_800A4AD0[];
extern u8 D_800A4D44[];
extern u8 D_800A4FF8[];
extern u8 D_800A521C[];
extern u8 D_800A5738[];
extern u8 D_800A58F8[];
extern u8 D_800A5970[];
extern u8 D_800A5A00[];
extern u8 D_800A5A58[];
extern u8 D_800A5A60[];
extern u8 D_800A5A84[];
extern u8 D_800A5ACC[];
extern u8 D_800A67B0[];
extern u8 D_800A8500[];
extern u8 D_800A8528[];
extern u8 D_800B28F8[];
extern u8 D_800B59C0[];
extern u8 D_800B5A84[];
extern u8 D_800B5A8C[];
extern u8 D_800B5B3C[];
extern u8 D_800B5C24[];
extern u8 D_800B9BE0[];
extern u8 D_800B9C38[];
extern u8 D_800B9C70[];
extern u8 D_800B9CC4[];
extern u8 D_800B9CD8[];
extern u8 D_800B9CF8[];
extern u8 D_800B9D18[];
extern u8 D_800B9D88[];
extern u8 D_800B9DE0[];
extern u8 D_800B9E90[];
extern u8 D_800BAC0C[];
extern u8 D_800BAE4C[];
extern u8 D_800BAE7C[];
extern u8 D_800BB0B4[];
extern u8 D_800BB170[];
extern u8 D_800BB610[];
extern u8 D_800BB644[];
extern u8 D_800BB684[];
extern u8 D_800BB6EC[];
extern u8 D_800BB728[];
extern u8 D_800BECE4[];
extern u8 D_800C197C[];
extern u8 D_800C19C0[];
extern u8 D_800C1A14[];
extern u8 D_800C2258[];
extern u8 D_800C5808[];
extern u8 D_800C5834[];
extern u8 D_800C5860[];
extern u8 D_800C588C[];
extern u8 D_800C58B8[];
extern u8 D_800C58E4[];
extern u8 D_800C6A94[];
extern u8 D_800C6AD4[];
extern u8 D_800C6FB4[];
extern u8 D_800C81E0[];
extern u8 D_800C82F0[];
extern u8 D_800C841C[];
extern u8 D_800C8508[];
extern u8 D_800C86D8[];
extern u8 D_800C8E3C[];
extern u8 D_800C8F64[];
extern u8 D_800C90C0[];
extern u8 D_800C9120[];
extern u8 D_800C9158[];
extern u8 D_800C9190[];
extern u8 D_800C9220[];
extern u8 D_800C9228[];
extern u8 D_800C9254[];
extern u8 D_800CAC58[];
extern u8 D_800CB434[];
extern u8 D_800CBC98[];
extern u8 D_800CD03C[];
extern u8 D_800CD7E0[];
extern u8 D_800CDB88[];
extern u8 D_800CDBD0[];
extern u8 D_800CDDD8[];
extern u8 D_800CE508[];
extern u8 D_800CE6BC[];
extern u8 D_800CE7B4[];
extern u8 D_800CE804[];
extern u8 D_800CE844[];
extern u8 D_800CEA34[];
extern u8 D_800CECC4[];
extern u8 D_800CED70[];
extern u8 D_800CED94[];
extern u8 D_800CF674[];
extern u8 D_800CF7F0[];
extern u8 D_800CFBF8[];
extern u8 D_800CFE28[];
extern u8 D_800D0158[];
extern u8 D_800D0188[];
extern u8 D_800D01E0[];
extern u8 D_800D0218[];
extern u8 D_800D03DC[];
extern u8 D_800D0598[];
extern u8 D_800D0AB0[];
extern u8 D_800D0AD8[];
extern u8 D_800D0D28[];
extern u8 D_800D0E60[];
extern u8 D_800D196C[];
extern u8 D_800D1A18[];
extern u8 D_800D1B08[];
extern u8 D_800D1BBC[];
extern u8 D_800D1C68[];
extern u8 D_800D1CD4[];
extern u8 D_800D1D84[];
extern u8 D_800D1E3C[];
extern u8 D_800D2260[];
extern u8 D_800D24F4[];
extern u8 D_800D2BF4[];
extern u8 D_800D2C70[];
extern u8 D_800D2EB4[];
extern u8 D_800D2F68[];
extern u8 D_800D306C[];
extern u8 D_800D31A0[];
extern u8 D_800D331C[];
extern u8 D_800D3374[];
extern u8 D_800D33F4[];
extern u8 D_800D350C[];
extern u8 D_800D3618[];
extern u8 D_800D3784[];
extern u8 D_800D632C[];
extern u8 D_800D636C[];
extern u8 D_800D6BA4[];
extern u8 D_800D72AC[];
extern u8 D_800D733C[];
extern u8 D_800D779C[];
extern u8 D_800D77E4[];
extern u8 D_800D785C[];
extern u8 D_800D7A48[];
extern u8 D_800D80F8[];
extern u8 D_800D8108[];
extern u8 D_800D82F4[];
extern u8 D_800D83BC[];
extern u8 D_800D83F8[];
extern u8 D_800D847C[];
extern u8 D_800D8484[];
extern u8 D_800D8538[];
extern u8 D_800D856C[];
extern u8 D_800D85D8[];
extern u8 D_800D872C[];
extern u8 D_800D89E8[];
extern u8 D_800D8A60[];
extern u8 D_800D8A98[];
extern u8 D_800D8B10[];
extern u8 D_800D8B18[];
extern u8 D_800D8B68[];
extern u8 D_800D8B74[];
extern u8 D_800D8C58[];
extern u8 D_800D8E1C[];
extern u8 D_800D8E90[];
extern u8 D_800D8F64[];
extern u8 D_800D902C[];
extern u8 D_800D90C4[];
extern u8 D_800D9600[];
extern u8 D_800D9694[];
extern u8 D_800D96E4[];
extern u8 D_800D9824[];
extern u8 D_800D9B5C[];
extern u8 D_800D9BF0[];
extern u8 D_800D9C10[];
extern u8 D_800D9D58[];
extern u8 D_800D9DD0[];
extern u8 D_800DA048[];
extern u8 D_800DA180[];
extern u8 D_800DA1B8[];
extern u8 D_800DA200[];
extern u8 D_800DA3AC[];
extern u8 D_800DA3D0[];
extern u8 D_800DA408[];
extern u8 D_800DA598[];
extern u8 D_800DA624[];
extern u8 D_800DA668[];
extern u8 D_800DA8C0[];
extern u8 D_800DA8C8[];
extern u8 D_800DA9A0[];
extern u8 D_800DAA58[];
extern u8 D_800DAA78[];
extern u8 D_800DAB68[];
extern u8 D_800DAB78[];
extern u8 D_800DAC50[];
extern u8 D_800DAC54[];
extern u8 D_800DAC70[];
extern u8 D_800DAD5C[];
extern u8 D_800DAE44[];
extern u8 D_800DAF30[];
extern u8 D_800DAFCC[];
extern u8 D_800DB050[];
extern u8 D_800DB058[];
extern u8 D_800DB1F8[];
extern u8 D_800DB220[];
extern u8 D_800DDC88[];
extern u8 D_800DDC98[];
extern u8 D_800DDCB0[];
extern u8 D_800DDCC8[];
extern u8 D_800DDCE4[];
extern u8 D_800DDD00[];
extern u8 D_800DE370[];
extern u8 D_800DE900[];
extern u8 D_800DE998[];
extern u8 D_800DED00[];
extern u8 D_800DED64[];
extern u8 D_800DF394[];
extern u8 D_800DF508[];
extern u8 D_800DF5B0[];
extern u8 D_800DF6E4[];
extern u8 D_800E1188[];
extern u8 D_800E1474[];
extern u8 D_800E2474[];
extern u8 D_800E247C[];
extern u8 D_800E2484[];
extern u8 D_800E24C4[];
extern u8 D_800E24FC[];
extern u8 D_800E25EC[];
extern u8 D_800E2734[];
extern u8 D_800E2824[];
extern u8 D_800E2A58[];
extern u8 D_800E2A70[];
extern u8 D_800E2C08[];
extern u8 D_800E2D0C[];
extern u8 D_800E32BC[];
extern u8 D_800E33E4[];
extern u8 D_800E344C[];
extern u8 D_800E3560[];
extern u8 D_800E3630[];
extern u8 D_800E37A8[];
extern u8 D_800E3840[];
extern u8 D_800E384C[];
extern u8 D_800E39BC[];
extern u8 D_800E3E30[];
extern u8 D_800E3F18[];
extern u8 D_800E42BC[];
extern u8 D_800E5E18[];
extern u8 D_800E620C[];
extern u8 D_800E6318[];
extern u8 D_800E6424[];
extern u8 D_800E663C[];
extern u8 D_800E6748[];
extern u8 D_800E6854[];
extern u8 D_800E6960[];
extern u8 D_800E6A6C[];

extern s32 D_80069C2C[];
extern s32 D_80069C40[];
extern s32 D_80069C54[];
extern s32 D_80069C68[];
extern s32 D_80069FD0[];
extern s32 D_80069FD8[];
extern s32 D_8006A0A0[];
extern s32 D_8006A0AC[];
extern s32 D_8006A0C4[];
extern s32 D_8006A114[];
extern s32 D_8006A144[];
extern s32 D_8006A178[];
extern s32 D_8006A1DC[];
extern s32 D_8006A208[];
extern s32 D_8006A258[];
extern s32 D_8006A27C[];
extern s32 D_8006A290[];
extern s32 D_8006A298[];
extern s32 D_8006A9C0;
extern s32 D_8006A9C4;
extern s32 D_8006A9C8;
extern s32 D_8006A9CC[];
extern s32 D_8006A9D4;
extern s32 D_8006A9D8[];
extern s32 D_8006A9E0[];
extern s32 D_8006A9E8[];
extern s32 D_8006A9F0[];
extern s32 D_8006A9F8[];
extern s32 D_8006AA00[];
extern s32 D_8006AA08[];
extern s32 D_8006AA10[];
extern s32 D_8006AA18;
extern s32 D_8006AA1C;
extern s32 D_8006AA20;
extern s32 D_8006AA24;
extern s32 D_8006AA28[];
extern s32 D_8006AA30[];
extern s32 D_8006AA38[];
extern s32 D_8006AA40[];
extern s32 D_8006AA48;
extern s32 D_8006AA4C;
extern s32 D_8006AA50;
extern s32 D_8006AA54;
extern s32 D_8006AFA8[];
extern s32 D_8006AFB4[];
extern s32 D_8006AFC0[];
extern s32 D_8006AFCC[];
extern s32 D_8006AFD8[];
extern s32 D_8006AFE4[];
extern s32 D_8006AFFC[];
extern s32 D_8006B008[];
extern s32 D_8006B018[];
extern s32 D_8006B024[];
extern s32 D_8006B030[];
extern s32 D_8006B03C[];
extern s32 D_8006B048[];
extern s32 D_8006B054[];
extern s32 D_8006B060[];
extern s32 D_8006B06C[];
extern s32 D_8006B078[];
extern s32 D_8006B084[];
extern s32 D_8006B090[];
extern s32 D_8006B09C[];
extern s32 D_8006B0A8[];
extern s32 D_8006B0C0[];
extern s32 D_8006B0CC[];
extern s32 D_8006B0D8[];
extern s32 D_8006B0E4[];
extern s32 D_8006B0F0[];
extern s32 D_8006B0FC[];
extern s32 D_8006B108[];
extern s32 D_8006B114[];
extern s32 D_8006B120[];
extern s32 D_8006B12C[];
extern s32 D_8006B138[];
extern char D_8006B144[];
extern char D_8006B14C[];
extern char D_8006B154[];
extern char D_8006B15C[];
extern char D_8006B160[];
extern char D_8006B16C[];
extern char D_8006B170[];
extern char D_8006B178[];
extern char D_8006B17C[];
extern char D_8006B180[];
extern char D_8006B188[];
extern char D_8006B190[];
extern char D_8006B19C[];
extern char D_8006B1A4[];
extern char D_8006B1AC[];
extern char D_8006B1B4[];
extern char D_8006B1B8[];
extern char D_8006B1C0[];
extern char D_8006B1C8[];
extern char D_8006B1D0[];
extern char D_8006B1DC[];
extern s32 D_8006B1E4[];
extern s32 D_8006B1EC;
extern s32 D_8006B1F0;
extern s32 D_8006B1F4;
extern s32 D_8006B1F8;
extern s32 D_8006B1FC[];
extern s32 D_8006B204[];
extern s32 D_8006B20C[];
extern s32 D_8006B214;
extern s32 D_8006B218[];
extern s32 D_8006B220;
extern s32 D_8006B224;
extern s32 D_8006B228;
extern s32 D_8006B22C;
extern s32 D_8006B230;
extern s32 D_8006B234[];
extern s32 D_8006B25C[];
extern s32 D_8006B278[];
extern s32 D_8006B28C[];
extern s32 D_8006B2AC[];
extern s32 D_8006B2C8[];
extern s32 D_8006B2D8[];
extern s32 D_8006B2E8[];
extern s32 D_8006B2FC[];
extern s32 D_8006B318[];
extern s32 D_8006B32C[];
extern s32 D_8006B33C[];
extern s32 D_8006B350[];
extern s32 D_8006B378[];
extern s32 D_8006B394[];
extern s32 D_8006B3A8[];
extern s32 D_8006B3C8[];
extern s32 D_8006B3FC[];
extern s32 D_8006B418[];
extern s32 D_8006B42C[];
extern s32 D_8006B458[];
extern s32 D_8006B48C[];
extern s32 D_8006B4E8[];
extern s32 D_8006B4F8[];
extern s32 D_8006B508[];
extern s32 D_8006B518[];
extern s32 D_8006B528[];
extern s32 D_8006B568[];
extern s32 D_8006B578[];
extern s32 D_8006B588[];
extern s32 D_8006B598[];
extern s32 D_8006B5B8[];
extern s32 D_8006B5CC[];
extern s32 D_8006B5E0[];
extern s32 D_8006B5FC[];
extern s32 D_8006B60C[];
extern s32 D_8006B61C[];
extern s32 D_8006B77C[];
extern s32 D_8006B784[];
extern s32 D_8006B78C[];
extern s32 D_8006B794[];
extern s32 D_8006B79C[];
extern u8 D_8006B7C4[];
extern s16 D_8006B890;
extern s16 D_8006B8A0;
extern char D_8006BD24[];
extern char D_8006BD28[];
extern char D_8006BD30[];
extern char D_8006BD5C[];
extern char D_8006BD6C[];
extern char D_8006BD7C[];
extern char D_8006BD8C[];
extern char D_8006BD9C[];
extern char D_8006BDAC[];
extern char D_8006C560[];
extern char D_8006C620[];
extern char D_8006C68C[];
extern char D_8006C928[];
extern char D_8006C9DC[];
extern char D_8006CB14[];
extern char D_8006CCDC[];
extern char D_8006D0E4[];
extern char D_8006D420[];
extern char D_8006D4D8[];
extern char D_8006D4DC[];
extern char D_8006D4E0[];
extern char D_8006D4E4[];
extern char D_8006D4E8[];
extern char D_8006D4EC[];
extern char D_8006D4F0[];
extern s32 D_8006D4F4;
extern char D_8006D4F8[];
extern char D_8006D4FC[];
extern char D_8006D500[];
extern char D_8006D504[];
extern char D_8006D508[];
extern char D_8006D50C[];
extern char D_8006D514[];
extern char D_8006D51C[];
extern char D_8006D524[];
extern char D_8006D52C[];
extern char D_8006D530[];
extern char D_8006D534[];
extern char D_8006D538[];
extern s32 D_8006D53C;
extern s32 D_8006D540;
extern char D_8006D544[];
extern char D_8006D548[];
extern char D_8006DA18[];
extern char D_8006DA28[];
extern char D_8006DA30[];
extern char D_8006DA44[];
extern char D_8006DA58[];
extern char D_8006DA64[];
extern char D_8006DA78[];
extern char D_8006DA8C[];
extern char D_8006DA98[];
extern char D_8006DAAC[];
extern char D_8006DAC0[];
extern char D_8006DAD0[];
extern char D_8006DF70[];
extern char D_8006E0C4[];
extern char D_8006E298[];
extern char D_8006E2A0[];
extern char D_8006E2A4[];
extern char D_8006E2AC[];
extern char D_8006E2B4[];
extern char D_8006E2BC[];
extern char D_8006E2C4[];
extern char D_8006E2C8[];
extern char D_8006E2D0[];
extern char D_8006E2D4[];
extern char D_8006E2DC[];
extern char D_8006E2F8[];
extern char D_8006E31C[];
extern char D_8006E34C[];
extern char D_8006E380[];
extern char D_8006E3B4[];
extern char D_8006E3DC[];
extern char D_8006E40C[];
extern char D_8006E41C[];
extern char D_8006E42C[];
extern char D_8006E470[];
extern char D_8006E924[];
extern char D_8006E934[];
extern char D_8006E944[];
extern char D_8006E950[];
extern char D_8006E960[];
extern char D_8006E974[];
extern char D_8006E988[];
extern char D_8006E998[];
extern char D_8006E9A8[];
extern char D_8006E9B8[];
extern char D_8006E9C4[];
extern char D_8006E9D0[];
extern char D_8006E9DC[];
extern char D_8006E9EC[];
extern s32 D_80071318[];
extern s32 D_80071324[];
extern s32 D_80071330[];
extern s32 D_8007133C[];
extern s32 D_8007134C[];
extern s32 D_80071360[];
extern s32 D_80071374[];
extern s32 D_80071388[];
extern s32 D_80071394[];
extern s32 D_800713A0[];
extern s32 D_800713B8[];
extern s32 D_800713D0[];
extern s32 D_800713E4[];
extern s32 D_800713F8[];
extern s32 D_8007140C[];
extern s32 D_80071420[];
extern s32 D_80071434[];
extern s32 D_80071448[];
extern s32 D_8007145C[];
extern s32 D_80071470[];
extern s32 D_80071484[];
extern s32 D_80071498[];
extern s32 D_800714B0[];
extern s32 D_800714C8[];
extern s32 D_800714E0[];
extern s32 D_800714F8[];
extern s32 D_80071508[];
extern s32 D_8007151C[];
extern s32 D_80071530[];
extern s32 D_80071544[];
extern s32 D_80071558[];
extern s32 D_8007156C[];
extern s32 D_80071580[];
extern s32 D_80071594[];
extern s32 D_800715A8[];
extern s32 D_800715BC[];
extern s32 D_800715C8[];
extern s32 D_800715D4[];
extern s32 D_800715E0[];
extern s32 D_800715EC[];
extern s32 D_80071600[];
extern s32 D_80071614[];
extern s32 D_80071628[];
extern s32 D_8007163C[];
extern s32 D_80071644[];
extern s32 D_8007165C[];
extern s32 D_80071664[];
extern s32 D_80071670[];
extern s32 D_80071678[];
extern s32 D_80071680[];
extern s32 D_80071688[];
extern s32 D_80071690[];
extern s32 D_80071698[];
extern s32 D_800716A0[];
extern s32 D_800716B0[];
extern s32 D_800716B8[];
extern s32 D_800716C0[];
extern s32 D_8007209C;
extern s32 D_800720A0;
extern void *D_800720A4[];
extern s32 D_8007221C;
extern s32 D_80072220;
extern void *D_80072224[];
extern s32 D_800722BC;
extern s32 D_800722C0;
extern void *D_800722C4[];
extern void *D_80072394[];
extern s32 D_800723E0;
extern void *D_800723E4[];
extern s32 D_80072520;
extern s32 D_80072524;
extern void *D_80072528[];
extern void *D_800725AC[];
extern s32 D_80073448;
extern s32 D_8007344C;
extern char D_80073450[];
extern char D_80073458[];
extern char D_80073460[];
extern char D_80073464[];
extern char D_80073468[];
extern s32 D_800740EC[];
extern s32 D_800743EC[];
extern s32 D_80074560[];
extern s32 D_800745B4[];
extern s32 D_800745D8[];
extern s32 D_800745FC[];
extern s32 D_80074698[];
extern s32 D_800746A4[];
extern s32 D_800746B0[];
extern s32 D_800746BC[];
extern s32 D_800746D0[];
extern s32 D_800746DC[];
extern s32 D_800746E8[];
extern s32 D_800746F4[];
extern s32 D_80074704[];
extern s32 D_80074710[];
extern s32 D_80074720[];
extern s32 D_8007472C[];
extern s32 D_8007483C[];
extern s32 D_80074848[];
extern s32 D_80074854[];
extern s32 D_80074860[];
extern s32 D_8007486C[];
extern s32 D_80074878[];
extern s32 D_80074884[];
extern s32 D_80074890[];
extern s32 D_8007489C[];
extern s32 D_80074E20[];
extern Vtx_t D_80074E40[];
extern Vtx_t D_80074E70[];

s32 D_800649FC = 1288138806;
s32 D_80064A00 = 0;
s32 D_80064A04[17] = { 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0 };
s16 D_80064A48 = 0;
s16 D_80064A4A = 1;
s16 D_80064A4C = 512;
s16 D_80064A4E = 0;
s16 D_80064A50[2] = { 0, 0 };
s16 D_80064A54[15] = { 8192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
s16 D_80064A72 = 0;
s32 D_80064A74[10] = { 1181184, 1186816, 1844737, 2303232, 9984, 2566144, 1840641, 2758401, 1054720, 1710848 };
s32 D_80064A9C[5] = { 1, 8, 4, 2, 0 };
s16 D_80064AB0[84] = { 1, 512, 256, 170, 128, 102, 85, 73, 64, 56, 51, 20, 42, 26, 14, 19, 32, 13, 28, 26, 8, 9, 4, 4, 5, 20, 13, 18, 3, 6, 3, 2, 16, 2, 2, 3, 14, 2, 13, 2, 1, 12, 4, 2, 2, 2, 2, 2, 2, 4, 10, 0, 1, 2, 9, 0, 1, 8, 0, 2, 0, 1, 0, 1, 8, 0, 0, 1, 0, 1, 0, 2, 0, 0, 1, 0, 6, 0, 0, 4, 0, 0, 0, 0 };
s32 D_80064B58[4] = { 0, 0, 1, 6 };
s32 D_80064B68 = 0;
s32 D_80064B6C = 0;
s32 D_80064B70[2] = { 0, 4096 };
s32 D_80064B78[2] = { 0, 2048 };
s32 D_80064B80[2] = { 0, 1024 };
s32 D_80064B88 = 0;
s32 D_80064B8C = 0;
s32 D_80064B90 = 0;
s32 D_80064B94[3] = { 0, 0, 0 };
s32 D_80064BA0[2] = { 0, 0 };
s32 D_80064BA8[2] = { 0, 0 };
s32 D_80064BB0 = 0;
u8 D_80064BB4[4] = { 0, 0, 0, 0 };
/* 18 nodes, each with a count and seven 16-byte vector slots. */
struct VectorNodeData { u8 pad00[4]; u32 count; u8 slots[7][16]; };
struct VectorNodeData D_80064BB8[18] = {
    { { 0x00, 0x00, 0x00, 0x00 }, 1, { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x00, 0x00, 0x00, 0x00 }, 1, { { 0x26, 0x26, 0x1C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xB0, 0xB0, 0xB8, 0x00 }, 1, { { 0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x10, 0x10, 0x10, 0x00 }, 0, { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x88, 0x88, 0x88, 0x00 }, 3, { { 0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00, 0xB4, 0x00 }, { 0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x58, 0x00 }, { 0x18, 0x18, 0x20, 0x00, 0xFF, 0xFF, 0x60, 0x00, 0xFF, 0xFF, 0x60, 0x00, 0x00, 0x00, 0x58, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xE0, 0xE0, 0xE0, 0x00 }, 1, { { 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xB0, 0xB0, 0xB8, 0x00 }, 1, { { 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x00, 0x00, 0x00, 0x00 }, 1, { { 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x00, 0x00, 0x00, 0x00 }, 1, { { 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x90, 0x90, 0x90, 0x00 }, 1, { { 0x60, 0x60, 0x60, 0x00, 0xFF, 0xFF, 0x60, 0x00, 0xFF, 0xFF, 0x60, 0x00, 0xFF, 0xFF, 0xA8, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xC0, 0xC0, 0xC0, 0x00 }, 2, { { 0x30, 0x30, 0x30, 0x00, 0xFF, 0xFF, 0x06, 0x00, 0xFF, 0xFF, 0x06, 0x00, 0xFF, 0xFF, 0xA6, 0x00 }, { 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x05, 0x05, 0x05, 0x05 }, 1, { { 0x19, 0x19, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00 }, { 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xC0, 0xC0, 0xC0, 0x00 }, 2, { { 0x60, 0x60, 0x60, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00 }, { 0xC0, 0xC0, 0xC0, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x08, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xC0, 0xC0, 0xC0, 0x00 }, 2, { { 0xC0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00 }, { 0x60, 0x60, 0x60, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x08, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xC0, 0xC0, 0xC0, 0x00 }, 1, { { 0x40, 0x40, 0x40, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00 }, { 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xFB, 0xFB, 0xFB, 0x00 }, 1, { { 0x30, 0x30, 0x30, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0xC0, 0xC0, 0xC0, 0x00 }, 1, { { 0x19, 0x19, 0x19, 0x00, 0x00, 0x80, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00 }, { 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } },
    { { 0x05, 0x05, 0x05, 0x05 }, 1, { { 0x19, 0x19, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00 }, { 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x8C, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 } } }
};
s32 D_80065428 = 0;
s32 D_8006542C = 0;
s32 D_80065430[8] = { 4104, 537931800, 1075859496, 1613787192, -2143252408, -1605324712, -1067397016, -529469320 };
s32 D_80065450 = 0;
s32 D_80065454 = 0;
s16 D_80065458[2] = { 1, 0 };
s32 D_8006545C = 0;
s32 D_80065460 = 0;
f32 D_80065464[1] = { 1.52587891e-05f };
f32 D_80065468[2] = { 1.0f, 0.0f };
f32 D_80065470[1] = { 0.0f };
f32 D_80065474[1] = { 0.0f };
f32 D_80065478[1] = { 0.0f };
f32 D_8006547C[1] = { 0.0f };
s16 D_80065480 = 0;
s16 D_80065482 = 4;
s16 D_80065484[2] = { 6, 0 };
s32 D_80065488 = 16384;
s32 D_8006548C = 16384;
s32 D_80065490 = 0;
s32 D_80065494 = 0;
s32 D_80065498 = 0;
s32 D_8006549C = 0;
s32 D_800654A0[12] = { 64881640, 64881639, 64881638, 64881637, 65143784, 65078247, 65012711, 64947175, 65274856, 65209320, 65143784, 65078248 };
s32 D_800654D0[12] = { 64619493, 64488421, 64357349, 64226277, 64619493, 64488421, 64357349, 64226277, 64881637, 64881637, 64881637, 64881637 };
s16 D_80065500 = 0;
s16 D_80065502 = 0;
s16 D_80065504[2] = { 1, 0 };
s32 D_80065508 = 0;
s16 D_8006550C = 0;
s16 D_8006550E = 0;
s16 D_80065510 = 0;
s16 D_80065512 = 0;
s32 D_80065514 = 0;
s32 D_80065518 = 0;
s32 D_8006551C = 0;
s16 D_80065520[2] = { 0, 0 };
s32 D_80065524 = 0;
s32 D_80065528 = 0;
s16 D_8006552C[8] = { 1, 0, 0, 0, 0, 0, 0, 1 };
s32 D_8006553C = 0;
s32 D_80065540 = 0;
s32 D_80065544 = 0;
s32 D_80065548 = 0;
s32 D_8006554C = 0;
s32 D_80065550 = 0;
s16 D_80065554 = 160;
s16 D_80065556 = 120;
s16 D_80065558 = -120;
s16 D_8006555A = 0;
s16 D_8006555C[2] = { 1, 0 };
f32 D_80065560[1] = { 1.52587891e-05f };
s32 D_80065564 = 0;
s32 D_80065568 = 0;
s32 D_8006556C = 15;
f32 D_80065570[1] = { 0.0f };
s16 D_80065574[6] = { 0, 0, 0, 0, 0, 0 };
Vtx_t D_80065580[20] = {
    { { -1920, -4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 1920, -4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 1920, 4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -1920, 4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -2112, -4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 2112, -4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 2112, 4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -2112, 4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -1920, -4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 1920, -4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 1920, 4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -1920, 4800, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -2112, -4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 2112, -4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 2112, 4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -2112, 4608, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -2112, 0, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 2112, 0, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { -1920, 0, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } },
    { { 1920, 0, 0 }, 0, { 0, 0 }, { 255, 255, 255, 255 } }
};
struct D_800656C0_s { s16 f_800656c0; s16 f_800656c2[15]; } D_800656C0 = { -1920, { 0, 0, 0, 0, 0, -20536, -20481, 1920, 0, 0, 0, 0, 0, -20536, -20481 } }; /* members: D_800656C0, D_800656C2 */
struct D_800656E0_s { s16 f_800656e0; s16 f_800656e2[7]; } D_800656E0 = { -1920, { 0, 0, 0, 0, 0, -20536, -20481 } }; /* members: D_800656E0, D_800656E2 */
struct D_800656F0_s { s16 f_800656f0; s16 f_800656f2[7]; } D_800656F0 = { 1920, { 0, 0, 0, 0, 0, -20536, -20481 } }; /* members: D_800656F0, D_800656F2 */
struct D_80065700_s { s16 f_80065700; s16 f_80065702[7]; } D_80065700 = { -307, { -38, 0, 0, 0, 0, -20536, -20481 } }; /* members: D_80065700, D_80065702 */
struct D_80065710_s { s16 f_80065710; s16 f_80065712[7]; } D_80065710 = { -307, { 38, 0, 0, 0, 0, -20536, -20481 } }; /* members: D_80065710, D_80065712 */
struct D_80065720_s { s16 f_80065720; s16 f_80065722[7]; } D_80065720 = { 307, { -38, 0, 0, 0, 0, -20536, -20481 } }; /* members: D_80065720, D_80065722 */
/* N64 GBI vertex mesh: position, flag, texture coordinates and color/normal. */
Vtx_t D_80065730[757] = {
    { { 307, 38, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3840, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3840, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3456, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3456, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3072, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3072, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2688, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2688, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2304, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2304, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1920, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1920, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1536, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1536, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1152, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1152, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -768, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -768, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -384, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -384, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 384, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 384, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 768, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 768, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1152, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1152, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1536, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1536, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1920, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1920, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2304, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2304, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2688, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2688, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3072, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3072, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3456, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3456, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3840, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3840, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1920, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -1843, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1920, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 1843, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -384, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -76, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -153, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -230, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -307, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -460, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -537, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -614, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -691, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -844, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -921, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1228, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1305, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1382, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1459, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1612, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1689, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1996, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2073, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2150, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2227, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2380, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2457, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2764, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2841, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2918, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2995, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3148, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3225, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3532, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3609, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3686, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 384, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3763, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 38, -3648, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -38, -3648, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 38, 3648, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -38, 3648, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3494, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3417, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3110, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -3033, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2726, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2649, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2342, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -2265, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1958, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1881, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1574, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1497, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1190, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -1113, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -806, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -729, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -422, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, -345, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 422, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 345, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 806, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 729, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1190, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1113, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1574, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1497, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1958, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 1881, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2342, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2265, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2726, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 2649, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3110, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3033, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3494, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { -307, 3417, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3494, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3417, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3110, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -3033, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2726, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2649, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2342, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -2265, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1958, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1881, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1574, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1497, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1190, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -1113, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -806, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -729, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -422, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, -345, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 422, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 345, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 806, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 729, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1190, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1113, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1574, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1497, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1958, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 1881, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2342, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2265, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2726, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 2649, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3110, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3033, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3494, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } },
    { { 307, 3417, 0 }, 0, { 0, 0 }, { 175, 200, 175, 255 } }
};
Vtx_t D_80068680[144] = {
    { { 1036, -2918, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -2918, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -3033, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -3033, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -3110, 0 }, 0, { 1600, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -3110, 0 }, 0, { 1600, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -3225, 0 }, 0, { 832, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -3225, 0 }, 0, { 832, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -2150, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -2150, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -2265, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -2265, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -2342, 0 }, 0, { 2432, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -2342, 0 }, 0, { 2432, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -2457, 0 }, 0, { 1664, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -2457, 0 }, 0, { 1664, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -1382, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -1382, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -1497, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -1497, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -1574, 0 }, 0, { 3264, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -1574, 0 }, 0, { 3264, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -1689, 0 }, 0, { 2496, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -1689, 0 }, 0, { 2496, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -614, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -614, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -729, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -729, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -806, 0 }, 0, { 4096, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -806, 0 }, 0, { 4096, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -921, 0 }, 0, { 3328, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -921, 0 }, 0, { 3328, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 153, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 153, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 38, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 38, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -38, 0 }, 0, { 4928, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -38, 0 }, 0, { 4928, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, -153, 0 }, 0, { 4160, 64 }, { 255, 255, 255, 128 } },
    { { 1267, -153, 0 }, 0, { 4160, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 921, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 921, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 806, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 806, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 729, 0 }, 0, { 4096, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 729, 0 }, 0, { 4096, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 614, 0 }, 0, { 3328, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 614, 0 }, 0, { 3328, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 1689, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 1689, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 1574, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 1574, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 1497, 0 }, 0, { 3264, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 1497, 0 }, 0, { 3264, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 1382, 0 }, 0, { 2496, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 1382, 0 }, 0, { 2496, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 2457, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 2457, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 2342, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 2342, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 2265, 0 }, 0, { 2432, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 2265, 0 }, 0, { 2432, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 2150, 0 }, 0, { 1664, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 2150, 0 }, 0, { 1664, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 3225, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 3225, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 3110, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 3110, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 3033, 0 }, 0, { 1600, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 3033, 0 }, 0, { 1600, 1024 }, { 255, 255, 255, 128 } },
    { { 1036, 2918, 0 }, 0, { 832, 64 }, { 255, 255, 255, 128 } },
    { { 1267, 2918, 0 }, 0, { 832, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -2918, 0 }, 0, { 832, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -2918, 0 }, 0, { 832, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -3033, 0 }, 0, { 1600, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -3033, 0 }, 0, { 1600, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -3110, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -3110, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -3225, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -3225, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -2150, 0 }, 0, { 1664, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -2150, 0 }, 0, { 1664, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -2265, 0 }, 0, { 2432, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -2265, 0 }, 0, { 2432, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -2342, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -2342, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -2457, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -2457, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -1382, 0 }, 0, { 2496, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -1382, 0 }, 0, { 2496, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -1497, 0 }, 0, { 3264, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -1497, 0 }, 0, { 3264, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -1574, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -1574, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -1689, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -1689, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -614, 0 }, 0, { 3328, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -614, 0 }, 0, { 3328, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -729, 0 }, 0, { 4096, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -729, 0 }, 0, { 4096, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -806, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -806, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -921, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -921, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 153, 0 }, 0, { 4160, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 153, 0 }, 0, { 4160, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 38, 0 }, 0, { 4928, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 38, 0 }, 0, { 4928, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -38, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -38, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, -153, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, -153, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 921, 0 }, 0, { 3328, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 921, 0 }, 0, { 3328, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 806, 0 }, 0, { 4096, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 806, 0 }, 0, { 4096, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 729, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 729, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 614, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 614, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 1689, 0 }, 0, { 2496, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 1689, 0 }, 0, { 2496, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 1574, 0 }, 0, { 3264, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 1574, 0 }, 0, { 3264, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 1497, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 1497, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 1382, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 1382, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 2457, 0 }, 0, { 1664, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 2457, 0 }, 0, { 1664, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 2342, 0 }, 0, { 2432, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 2342, 0 }, 0, { 2432, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 2265, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 2265, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 2150, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 2150, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 3225, 0 }, 0, { 832, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 3225, 0 }, 0, { 832, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 3110, 0 }, 0, { 1600, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 3110, 0 }, 0, { 1600, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 3033, 0 }, 0, { 0, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 3033, 0 }, 0, { 0, 1024 }, { 255, 255, 255, 128 } },
    { { -1036, 2918, 0 }, 0, { 768, 64 }, { 255, 255, 255, 128 } },
    { { -1267, 2918, 0 }, 0, { 768, 1024 }, { 255, 255, 255, 128 } }
};
Vtx_t D_80068F80[48] = {
    { { 1152, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, 3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, 3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1152, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, 2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, 2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1152, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, 1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, 1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1152, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, 1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, 998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1152, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, -1075, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, -998, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1152, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, -1843, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, -1766, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1152, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, -2611, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, -2534, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1152, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1171, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { 1132, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1152, -3379, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1171, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } },
    { { -1132, -3302, 0 }, 0, { 0, 0 }, { 175, 200, 175, 128 } }
};
s16 D_80069280[4] = { 1, 0, 0, 0 };
s32 D_80069288 = 0;
s16 D_8006928C = 0;
s16 D_8006928E = 0;
s32 D_80069290 = 0;
s32 D_80069294 = 0;
s32 D_80069298 = 0;
s32 D_8006929C = 0;
s16 D_800692A0 = 0;
s16 D_800692A2 = 0;
struct D_800692A4_s { s16 f_800692a4; s16 f_800692a6[3]; } D_800692A4 = { 0, { 0, 0, 0 } }; /* members: D_800692A4, D_800692A6 */
s32 D_800692AC = 0;
s16 D_800692B0 = 0;
s16 D_800692B2 = 0;
s16 D_800692B4[4] = { -1, 0, 0, 0 };
s16 D_800692BC = 0;
s16 D_800692BE = 0;
s16 D_800692C0[10] = { 0, 0, 0, 4, 0, 0, 0, 0, 0, 0 };
s32 D_800692D4 = 0;
s16 D_800692D8[4] = { 0, 0, 0, 0 };
s32 D_800692E0[10] = { 559677440, 0, 2, 16711680, 0, 0, 0, 0, 0, 0 };
s32 D_80069308[186] = { 393285, 393286, 393287, 393288, 393216, 393224, 393289, 393290, 57, 2, 46, 3014659, 3080233, 3014731, 3014732, 5, 851972, 22, 917527, 720902, 983041, 2883591, 2818129, 2883666, 2818131, 2883668, 2818133, 2949141, 9, 10, 11, 12, 17, 18, 458767, 458768, 458765, 458766, 25, 24, 37, 38, 56, 19, 20, 3145754, 3211291, 28, 1703965, 30, 31, 3145760, 3211297, 786466, 35, 1376292, 2687015, 2752552, 42, 43, 44, 45, 47, 48, 50, 49, 51, 52, 54, 53, 58, 86, 720955, 99, 80, 2162775, 2228312, 589913, 2687066, 2752603, 3211356, 3211357, 3276894, 1048673, 98, 96, 95, 55, 1449216, 1449472, 1449728, 8192, 1450240, 8704, 8960, 1451008, 1455872, 14592, 1521152, 1520128, 1520384, 1520385, 1520640, 1520896, 1517824, 1519104, 1518080, 1518081, 1518336, 1518337, 1518592, 1518848, 1518849, 1519360, 1519616, 1519872, 1521664, 6400, 131840, 769, 770, 262915, 66560, 263169, 1026, 1181184, 1709568, 1709570, 1840641, 595712, 2758401, 2692866, 1054720, 2430977, 2496514, 2562051, 2627588, 1710848, 1841921, 2431746, 2497283, 1186816, 1907713, 1973250, 2303232, 2368769, 2041090, 2106627, 2434560, 2500097, 2434562, 2500099, 9984, 1779457, 2172674, 2238211, 2566144, 2631681, 1124354, 2041859, 2107396, 60, 61, 62, 65, 66, 67, 68, 3328, 3584, 3840, 4096, 4352, 4353, 4608, 4864, 5120, 5376, 1280, 1792, 2048, 2304, 2560, 2816, 3072, -1 };
u8 D_800695F0[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
s32 D_800695F8[3] = { 0, -196605, 262144 };
s32 D_80069604[2] = { 0, 0 };
void *D_8006960C[8] = { &D_800C81E0, &D_800C82F0, &D_800C86D8, &D_800C841C, &D_800C86D8, &D_800C8508, &D_800C86D8, &D_800C81E0 };
s32 D_8006962C = 0;
s32 D_80069630[2] = { 33686273, 66306 };
s32 D_80069638[2] = { 770, 16909056 };
s32 D_80069640[2] = { 67240905, -993459454 };
s32 D_80069648[2] = { 67305985, 66051 };
s32 D_80069650[2] = { 100530678, -184745466 };
s32 D_80069658[2] = { 84280061, -185140739 };
s32 D_80069660[10] = { 50523874, -656216574, 82963687, -488176632, 67634407, -488117007, 84202697, -1161178108, 84211426, -656214524 };
s32 D_80069688[10] = { 50523874, -656216574, 82963687, -488176632, 67634407, -488117007, 84202697, -1161178108, 84211426, -656214524 };
s32 D_800696B0[10] = { 50523874, -656216574, 82305757, -656604152, 67634397, -656547097, 84202697, -1161178108, 134543596, -487786492 };
s32 D_800696D8 = 0;
s32 D_800696DC[3] = { -2146534376, -2143289344, 85196808 };
s32 D_800696E8[2] = { 1, -2147436244 };
s32 D_800696F0[4] = { 440, 36, 440, 72 };
void *D_80069700[4] = { &D_80017CEC, &D_80017EAC, &D_80018048, &D_80018050 };
s32 D_80069710[2] = { 32, 60 };
void *D_80069718[4] = { &D_8001B138, &D_8001B44C, &D_8001B544, &D_8001BC04 };
s32 D_80069728[2] = { 2, 12 };
void *D_80069730[4] = { &D_8001B590, &D_8001B5B8, &D_8001B544, &D_8001B54C };
s32 D_80069740[2] = { 2, 16 };
void *D_80069748[4] = { &D_8000DCC8, &D_8000DD1C, &D_8000DD64, &D_8000DD6C };
s32 D_80069758[2] = { 1, 16 };
void *D_80069760[4] = { &D_80097150, &D_800971E4, &D_800971EC, &D_800971F4 };
s32 D_80069770[2] = { 1, 20 };
void *D_80069778[4] = { &D_80097888, &D_800978CC, &D_80097930, &D_80097938 };
s32 D_80069788[2] = { 1, 132 };
void *D_80069790[4] = { &D_800951AC, &D_80095664, &D_800956A8, &D_80095874 };
s32 D_800697A0[2] = { 1, 88 };
void *D_800697A8[4] = { &D_80044364, &D_80044424, &D_80044454, &D_80043D7C };
s32 D_800697B8[2] = { 50, 256 };
void *D_800697C0[4] = { &D_8000E5F8, &D_8000E788, &D_8000E7EC, &D_8000F2CC };
s32 D_800697D0[2] = { 1, 4 };
void *D_800697D8[4] = { &D_8009AFE0, &D_8009B0E4, &D_8009B10C, &D_8009B114 };
s32 D_800697E8[2] = { 1, 24 };
void *D_800697F0[4] = { &D_8009A768, &D_8009AF9C, &D_8009AFD8, &D_8009A9EC };
s32 D_80069800[2] = { 1, 132 };
void *D_80069808[4] = { &D_800951AC, &D_80095664, &D_800956A8, &D_80095F98 };
s32 D_80069818[2] = { 1, 72 };
void *D_80069820[4] = { &D_80098E58, &D_800992AC, &D_80099370, &D_80099378 };
s32 D_80069830[2] = { 1, 24 };
void *D_80069838[4] = { &D_8000F450, &D_8000F814, &D_8000F8B8, &D_8000F8EC };
s32 D_80069848[2] = { 4, 2 };
void *D_80069850[4] = { &D_800116B8, &D_800118FC, &D_80011B5C, &D_80011B64 };
s32 D_80069860[2] = { 4, 24 };
void *D_80069868[4] = { &D_800127B8, &D_800139E8, &D_80013B54, &D_80013B5C };
s32 D_80069878[2] = { 4, 28 };
void *D_80069880[4] = { &D_800404C8, &D_80041438, &D_80041504, &D_80041050 };
s32 D_80069890[4] = { 350, 40, 167, 72 };
void *D_800698A0[4] = { &D_80017CEC, &D_80017EAC, &D_80018048, &D_80018050 };
s32 D_800698B0[2] = { 41, 60 };
void *D_800698B8[4] = { &D_8001B138, &D_8001B44C, &D_8001B544, &D_8001BC04 };
s32 D_800698C8[2] = { 3, 12 };
void *D_800698D0[4] = { &D_8001B590, &D_8001B5B8, &D_8001B544, &D_8001B54C };
s32 D_800698E0[2] = { 4, 16 };
void *D_800698E8[4] = { &D_8000DCC8, &D_8000DD1C, &D_8000DD64, &D_8000DD6C };
s32 D_800698F8[2] = { 8, 16 };
void *D_80069900[4] = { &D_80097150, &D_800971E4, &D_800971EC, &D_800971F4 };
s32 D_80069910[2] = { 35, 20 };
void *D_80069918[4] = { &D_80097888, &D_800978CC, &D_80097930, &D_80097938 };
s32 D_80069928[2] = { 21, 132 };
void *D_80069930[4] = { &D_800951AC, &D_80095664, &D_800956A8, &D_80095874 };
s32 D_80069940[2] = { 28, 88 };
void *D_80069948[4] = { &D_80044364, &D_80044424, &D_80044454, &D_80043D7C };
s32 D_80069958[2] = { 50, 256 };
void *D_80069960[4] = { &D_8000E5F8, &D_8000E788, &D_8000E7EC, &D_8000F2CC };
s32 D_80069970[2] = { 30, 4 };
void *D_80069978[4] = { &D_8009AFE0, &D_8009B0E4, &D_8009B10C, &D_8009B114 };
s32 D_80069988[2] = { 1, 24 };
void *D_80069990[4] = { &D_8009A768, &D_8009AF9C, &D_8009AFD8, &D_8009A9EC };
s32 D_800699A0[2] = { 42, 132 };
void *D_800699A8[4] = { &D_800951AC, &D_80095664, &D_800956A8, &D_80095F98 };
s32 D_800699B8[2] = { 18, 72 };
void *D_800699C0[4] = { &D_80098E58, &D_800992AC, &D_80099370, &D_80099378 };
s32 D_800699D0[2] = { 4, 24 };
void *D_800699D8[4] = { &D_8000F450, &D_8000F814, &D_8000F8B8, &D_8000F8EC };
s32 D_800699E8[2] = { 4, 2 };
void *D_800699F0[4] = { &D_800116B8, &D_800118FC, &D_80011B5C, &D_80011B64 };
s32 D_80069A00[2] = { 4, 24 };
void *D_80069A08[4] = { &D_800127B8, &D_800139E8, &D_80013B54, &D_80013B5C };
s32 D_80069A18[2] = { 4, 28 };
void *D_80069A20[4] = { &D_800404C8, &D_80041438, &D_80041504, &D_80041050 };
s32 D_80069A30[6] = { 458808, 4718892, 196863, 16711935, 0, 14336 };
Vtx_t D_80069A48[2] = {
    { { 0, 0, 6 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
s32 D_80069A68[8] = { 0, 60, 0, 0, 0, 0, 0, 0 };
s32 D_80069A88[12] = { 0, 512, 24, 3866624, 0, 0, 0, 0, 0, 0, 0, 0 };
s32 D_80069AB8[10] = { 0, 256, 32, 4194304, 0, 0, 0, 0, 0, 0 };
s32 D_80069AE0[2] = { 0, 0 };
s32 D_80069AE8[12] = { 0, 267, 16, 1048576, 0, 0, 0, 0, 0, 0, 0, 0 };
s32 D_80069B18[10] = { 0, 268, 16, 2097152, 0, 0, 0, 0, 0, 0 };
s32 D_80069B40 = 0;
s32 D_80069B44 = 0;
s32 D_80069B48[12] = { 0, 263, 24, 2621440, 0, 0, 0, 0, 0, 0, 0, 0 };
s32 D_80069B78[12] = { 0, 269, 16, 655360, 0, 0, 0, 0, 0, 0, 0, 0 };
struct D_80069BA8_s { s16 f_80069ba8; s16 f_80069baa[9]; } D_80069BA8 = { 0, { 5, 0, 0, 0, 0, 0, 0, 0, 0 } }; /* members: D_80069BA8, D_80069BAA */
s16 D_80069BBC = 0;
s16 D_80069BBE = 8000;
s16 D_80069BC0 = 10000;
s16 D_80069BC2 = 0;
struct D_80069BC4_s { s16 f_80069bc4; s16 f_80069bc6[2]; } D_80069BC4 = { 0, { 0, 0 } }; /* members: D_80069BC4, D_80069BC6 */
s16 D_80069BCA = 0;
s32 D_80069BCC = 0;
s16 D_80069BD0 = -14336;
s16 D_80069BD2 = -24576;
s16 D_80069BD4 = 0;
s16 D_80069BD6 = 19;
s16 D_80069BD8[2] = { 20, 0 };
s16 D_80069BDC = 0;
s16 D_80069BDE = 29;
s16 D_80069BE0 = 30;
u8 D_80069BE2 = 1;
u8 D_80069BE3 = 16;
u8 D_80069BE4[7] = { 0, 0, 0, 29, 0, 30, 2 };
u8 D_80069BEB = 4;
s16 D_80069BEC[16] = { -1, 1024, 3072, 3072, 2048, 1536, 2560, 2560, 0, 512, 3584, 3584, 0, 512, 3584, 512 };
s32 D_80069C0C[8] = { 16384, 32768, 4, 2, 8192, 16, 8, 1 };
s32 D_80069C2C[5] = { 16384, 4, 32768, 2, 1 }; /* UNRESOLVED: size-only typing */
s32 D_80069C40[5] = { 4, 32768, 2, 16384, 1 }; /* UNRESOLVED: size-only typing */
s32 D_80069C54[5] = { 2, 16384, 4, 32768, 8 }; /* UNRESOLVED: size-only typing */
s32 D_80069C68[5] = { 32768, 2, 16384, 4, 1 }; /* UNRESOLVED: size-only typing */
s32 D_80069C7C[25] = { 559677440, 0, 2, 16711680, 0, 559677440, 0, 2, 16711680, 0, 559677440, 0, 2, 16711680, 0, 559677440, 0, 2, 16711680, 0, 0, 0, 0, 0, 0 };
s32 D_80069CE0[5] = { 0, 26215360, 16973823, 0, 0 };
s32 D_80069CF4[47] = { 0, 5242880, 16908287, 0, 0, 31457440, 15728899, 25100466, -65536, 65056, 10486000, 16974207, 11730943, 0, 320, 57671939, 8323506, -65536, 0, 26215360, 16908441, -65536, 0, 0, 5242880, 16908287, 0, 0, 31457440, 15728899, 25100466, -65536, 65056, 10486000, 16974207, 11730943, 0, 320, 57671939, 8323506, -65536, 0, 26215360, 16908441, -65536, 0, 0 };
s32 D_80069DB0 = 536870912;
s32 D_80069DB4 = 536870912;
struct D_80069DB8_s { s16 f_80069db8; s16 f_80069dba[43]; } D_80069DB8 = { -400, { -200, -200, 0, 0, 200, 200, 400, -400, 0, 0, 400, -400, -133, -133, 133, 133, 400, -400, -200, -200, 0, 0, 200, 200, 400, -400, 0, 0, 400, -400, -133, -133, 133, 133, 400, -400, -200, -200, 0, 0, 200, 200, 400 } }; /* members: D_80069DB8, D_80069DBA */
s32 D_80069E10[3] = { 30, 100, 102 };
s32 D_80069E1C[3] = { 31, 101, 103 };
void *D_80069E28[6] = { &D_800D8108, &D_800D8108, &D_800D8108, &D_800D82F4, &D_800D83BC, &D_800D80F8 };
void *D_80069E40[5] = { &D_800DA8C0, &D_800DA8C8, &D_800DA9A0, &D_800DAA78, &D_800DAB78 };
s32 D_80069E54[7] = { 67568131, 393481, 134873088, 66051, 67504137, 118095872, 0 };
u8 D_80069E70[4] = { 0, 1, 2, 3 };
u8 D_80069E74[4] = { 0, 0, 0, 0 };
s32 D_80069E78[4] = { 4864, 5376, 5120, 0 };
s32 D_80069E88[19] = { 3584, 4096, 3584, 2304, 3840, 3840, 2560, 2816, 1792, 3072, 2048, 3328, 3328, 2304, 3584, 4096, 3584, 3584, 2816 };
u8 D_80069ED4 = 15;
u8 D_80069ED5 = 6;
u8 D_80069ED6 = 2;
u8 D_80069ED7 = 50;
void *D_80069ED8[1] = { &D_8006E0C4 };
struct D_80069EDC_s { s16 f_80069edc; u8 f_80069ede[218]; } D_80069EDC = { 2, { 0, 0, 15, 6, 2, 100, 128, 6, 224, 152, 0, 1, 0, 0, 15, 2, 0, 70, 128, 6, 224, 136, 0, 3, 1, 0, 5, 3, 0, 50, 128, 6, 224, 72, 0, 4, 1, 0, 0, 4, 2, 80, 128, 6, 224, 40, 0, 5, 1, 0, 10, 2, 2, 30, 128, 6, 224, 40, 0, 6, 1, 0, 10, 2, 2, 40, 128, 6, 224, 128, 0, 7, 1, 0, 5, 2, 3, 100, 128, 6, 224, 116, 0, 8, 2, 0, 15, 2, 2, 60, 128, 6, 224, 60, 0, 9, 0, 0, 10, 5, 0, 100, 128, 6, 224, 216, 0, 10, 0, 0, 5, 2, 3, 100, 128, 6, 224, 240, 0, 11, 1, 0, 5, 2, 2, 100, 128, 6, 225, 0, 0, 12, 3, 0, 5, 2, 3, 100, 128, 6, 225, 12, 0, 13, 3, 0, 15, 4, 0, 50, 128, 6, 224, 92, 0, 14, 1, 0, 15, 0, 0, 70, 128, 6, 224, 136, 0, 0, 1, 0, 5, 2, 2, 100, 128, 6, 224, 172, 0, 16, 0, 0, 15, 0, 4, 100, 128, 6, 225, 28, 0, 18, 1, 0, 15, 4, 4, 100, 128, 6, 225, 52, 0, 18, 1, 0, 0, 7, 0, 100, 128, 6, 225, 80, 0, 24, 1, 0 } }; /* members: D_80069EDC, D_80069EDE */
u8 D_80069FB8[24] = { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 7, 7, 7, 3, 3, 3, 3, 3, 7, 0, 0, 0, 0, 0 };
s32 D_80069FD0[2] = { 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80069FD8[4] = { 327684, 589830, 524295, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80069FE8[8] = { 1966111, 2097185, 2228259, 2359333, 2490407, 2621481, 2752555, 2883584 }; /* UNRESOLVED: size-only typing */
s32 D_8006A008[38] = { 1, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A0A0[3] = { 6291549, 6226014, 6029312 }; /* UNRESOLVED: size-only typing */
s32 D_8006A0AC[6] = { 1280, 1280, 8650752, 8716288, 1280, 1280 }; /* UNRESOLVED: size-only typing */
s32 D_8006A0C4[7] = { 6881386, 6815846, 6619243, 7077988, 6488162, 6357101, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A0E0[13] = { 0, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A114[12] = { 1280, 1280, 1280, 1280, 1280, 1280, 8454144, 8585216, 0, 8716288, 8650752, 8585216 }; /* UNRESOLVED: size-only typing */
s32 D_8006A144[13] = { 3932226, 4194365, 3670071, 3539002, 3735617, 4128830, 3866677, 4522034, 3080238, 3211309, 3145782, 3407923, 4587520 }; /* UNRESOLVED: size-only typing */
s32 D_8006A178[25] = { 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 0, 7798784, 0, 0, 0, 0, 0, 0, 7864320, 7929856, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A1DC[11] = { 8519680, 1280, 1280, 1280, 1280, 1280, 1280, 8192000, 8257536, 1280, 1280 }; /* UNRESOLVED: size-only typing */
s32 D_8006A208[6] = { 5177415, 65616, 5046348, 4915274, 4784200, 5111808 }; /* UNRESOLVED: size-only typing */
s32 D_8006A220[14] = { 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A258[3] = { 1703961, 1835035, 1900544 }; /* UNRESOLVED: size-only typing */
s32 D_8006A264[6] = { 0, 0, 0, 0, 13, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A27C[5] = { 8454144, 8455424, 1280, 1280, 8389888 }; /* UNRESOLVED: size-only typing */
s32 D_8006A290[2] = { 196610, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A298[2] = { 8454144, 8323072 }; /* UNRESOLVED: size-only typing */
s32 D_8006A2A0[3] = { 0, 12, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A2AC[6] = { 5963866, 5832792, 5701714, 5308500, 5570646, 5439488 }; /* UNRESOLVED: size-only typing */
s32 D_8006A2C4[13] = { 0, 0, 16, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A2F8[54] = { 28, 41, 6881296, 540, 37, 6881296, 588, 37, 6881296, 640, 37, 6881296, 712, 38, 6881296, 764, 40, 6881296, 772, 40, 6881296, 824, 39, 6881296, 1424, 39, 6881296, 1484, 40, 6881296, 1504, 38, 6881296, 1508, 37, 6881296, 1556, 37, 6881296, 1608, 37, 6881296, 1640, 40, 6881296, 1656, 39, 6881296, 1716, 37, 6881296, 1800, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A3D0[18] = { 48, 51, 6881296, 112, 52, 6881296, 160, 51, 6881296, 240, 52, 6881296, 260, 51, 6881296, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A418[6] = { 16, 53, 6881296, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A430[9] = { 90, 53, 6881296, 120, 54, 6881296, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A454[24] = { 20, 43, 6881296, 84, 52, 6881296, 120, 43, 6881296, 140, 51, 6881296, 184, 52, 6881296, 224, 51, 6881296, 244, 51, 6881296, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A4B4[9] = { 20, 55, 6881296, 148, 56, 6881296, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A4D8[9] = { 128, 28, 6881296, 224, 36, 6881296, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006A4FC[9] = { 28, 42, 6881296, 1008, 54, 6881296, 1800, 65536, 0 }; /* UNRESOLVED: size-only typing */
s16 D_8006A520[3] = { 0, 112, 0 };
s16 D_8006A526 = 90;
void *D_8006A528[1] = { &D_80069FD8 };
void *D_8006A52C[2] = { 0, &D_80069FD0 };
s32 D_8006A534 = 64;
s32 D_8006A538 = 0;
s16 D_8006A53C = 5;
s16 D_8006A53E = 82;
struct D_8006A540_s { u8 f_8006a540[3]; u8 f_8006a543[2]; u8 f_8006a545[3]; } D_8006A540 = { { 0, 2, 0 }, { 8, 255 }, { 248, 0, 0 } }; /* members: D_8006A540, D_8006A543, D_8006A545 */
s32 D_8006A548 = 0;
s16 D_8006A54C[54] = { 0, 0, 0, 112, 0, 90, -32762, -24616, 0, 0, -32762, -24624, 0, 64, 0, 0, 5, 82, 2, 8, -8, 0, 0, 0, 0, 0, 0, 122, 0, 451, -32762, -24600, 0, 0, -32762, -24624, 0, 66, -32762, -23300, 4, 442, 3, 8, -8, 0, -32762, -24568, 0, 0, 0, 123, 0, 450 };
void *D_8006A5B8[3] = { &D_8006A144, &D_8006A178, &D_80069FD0 };
s32 D_8006A5C4[9] = { 66, -2147048712, 197050, 196616, -524288, 0, 0, 113, 75 };
void *D_8006A5E8[2] = { &D_8006A0A0, &D_8006A0AC };
s32 D_8006A5F0[10] = { 0, 0, -2147048496, 70, 65552, -851968, 0, 50331648, 114, 75 };
void *D_8006A618[2] = { &D_8006A290, &D_8006A298 };
s32 D_8006A620[10] = { 0, 0, -2147048424, 65, 131080, -655360, -2147048800, 33554432, 115, 75 };
void *D_8006A648[2] = { &D_8006A258, &D_8006A27C };
s32 D_8006A650[10] = { 0, 0, -2147048400, 70, 8, -851968, -2147048860, 33554432, 116, 75 };
void *D_8006A678[2] = { &D_8006A0C4, &D_8006A114 };
s32 D_8006A680[10] = { 0, 0, -2147048364, 70, 16, -1048576, -2147049248, 1342177280, 117, 75 };
void *D_8006A6A8[2] = { &D_8006A208, &D_8006A1DC };
s32 D_8006A6B0[20] = { 0, 0, -2147048268, 70, 8, -524288, -2147048928, 33554432, 118, 210, -2147048788, 0, 0, 0, -2147048232, 202, 131080, -524288, -2147048764, 33554432 };
void *D_8006A700[16] = { &D_800A5A60, &D_800A5A84, &D_800A5A84, &D_800A5A84, &D_800A5A58, &D_800A5A60, &D_800A5A60, &D_800A5ACC, &D_800A521C, &D_800A5A60, &D_800A5A60, &D_800A5A60, &D_800A5ACC, &D_800A5A58, &D_800E1188, &D_800A5A84 };
void *D_8006A740[16] = { &D_800A382C, &D_800A4AD0, &D_800A4D44, &D_800A4FF8, &D_800A67B0, &D_800A4790, &D_800A48B0, &D_800B28F8, &D_800A521C, &D_800A4484, &D_800A39FC, &D_800A3BFC, &D_800A46C8, &D_800A3DDC, &D_800E1474, &D_800A5738 };
void *D_8006A780[16] = { &D_800A58F8, &D_800A5970, &D_800A5970, &D_800A5970, &D_800A5A58, &D_800A58F8, &D_800A5970, &D_800A5A58, &D_800A5A58, &D_800A58F8, &D_800A58F8, &D_800A58F8, &D_800A5A58, &D_800A5A00, &D_800A5A58, &D_800A5970 };
u16 D_8006A7C0[16] = { 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 284, 210, 300, 180, 300, 300 };
s32 D_8006A7E0 = 12582912;
s32 D_8006A7E4 = 9371648;
s16 D_8006A7E8[74] = { 1430, 0, 192, 0, 143, 0, 1400, 0, 224, 0, 200, 0, 1320, 0, 304, 0, 156, 0, 1250, 0, 152, 0, 143, 0, 1400, 0, 304, 0, 156, 0, 1160, 0, 192, 0, 143, 0, 1430, 0, 128, 0, 143, 0, 1450, 0, 128, 0, 143, 0, 1450, 0, 304, 0, 156, 0, 1250, 0, 128, 0, 143, 0, 1450, 0, 224, 0, 143, 0, 1400, 0, 192, 0, 143, 0, 1430, 0 };
s32 D_8006A87C = 11534336;
s32 D_8006A880 = 7340032;
s16 D_8006A884[74] = { 1376, 0, 176, 0, 112, 0, 1376, 0, 192, 0, 136, 0, 1320, 0, 272, 0, 140, 0, 1250, 0, 96, 0, 96, 0, 1376, 0, 272, 0, 140, 0, 1160, 0, 192, 0, 110, 0, 1400, 0, 128, 0, 143, 0, 1450, 0, 128, 0, 143, 0, 1450, 0, 304, 0, 156, 0, 1250, 0, 128, 0, 143, 0, 1450, 0, 224, 0, 143, 0, 1400, 0, 176, 0, 112, 0, 1376, 0 };
s32 D_8006A918 = 6291456;
s32 D_8006A91C = 3932160;
s16 D_8006A920[74] = { 1240, 0, 96, 0, 60, 0, 1240, 0, 128, 0, 60, 0, 1200, 0, 192, 0, 60, 0, 1200, 0, 64, 0, 50, 0, 1220, 0, 192, 0, 60, 0, 1200, 0, 96, 0, 60, 0, 1240, 0, 128, 0, 143, 0, 1250, 0, 128, 0, 143, 0, 1250, 0, 304, 0, 156, 0, 1200, 0, 128, 0, 143, 0, 1250, 0, 224, 0, 143, 0, 1200, 0, 192, 0, 112, 0, 1376, 0 };
s32 D_8006A9B4 = 0;
u8 D_8006A9B8[8] = { 1, 1, 0, 0, 0, 0, 0, 0 };
s32 D_8006A9C0 = 130816; /* UNRESOLVED: size-only typing */
s32 D_8006A9C4 = 50266112; /* UNRESOLVED: size-only typing */
s32 D_8006A9C8 = 83820544; /* UNRESOLVED: size-only typing */
s32 D_8006A9CC[2] = { 67174930, 301924352 }; /* UNRESOLVED: size-only typing */
s32 D_8006A9D4 = 50266112; /* UNRESOLVED: size-only typing */
s32 D_8006A9D8[2] = { 151390215, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006A9E0[2] = { 134547719, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006A9E8[2] = { 134613253, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006A9F0[2] = { 101254407, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006A9F8[2] = { 84411911, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA00[2] = { 185339918, 252575488 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA08[2] = { 168562702, 252575488 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA10[2] = { 185208846, 252575488 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA18 = 269357055; /* UNRESOLVED: size-only typing */
s32 D_8006AA1C = 252514559; /* UNRESOLVED: size-only typing */
s32 D_8006AA20 = 235933183; /* UNRESOLVED: size-only typing */
s32 D_8006AA24 = 235867647; /* UNRESOLVED: size-only typing */
s32 D_8006AA28[2] = { 303240195, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA30[2] = { 286462979, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA38[2] = { 336663043, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA40[2] = { 319951107, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006AA48 = 385810432; /* UNRESOLVED: size-only typing */
s32 D_8006AA4C = 369033216; /* UNRESOLVED: size-only typing */
s32 D_8006AA50 = 67043328; /* UNRESOLVED: size-only typing */
s32 D_8006AA54 = 67043328; /* UNRESOLVED: size-only typing */
void *D_8006AA58[25] = { &D_8006A9C0, &D_8006A9C4, &D_8006A9C8, &D_8006A9CC, &D_8006A9D4, &D_8006A9D8, &D_8006A9E0, &D_8006A9E8, &D_8006A9F0, &D_8006A9F8, &D_8006AA00, &D_8006AA08, &D_8006AA10, &D_8006AA18, &D_8006AA1C, &D_8006AA20, &D_8006AA24, &D_8006AA28, &D_8006AA30, &D_8006AA38, &D_8006AA40, &D_8006AA48, &D_8006AA4C, &D_8006AA50, &D_8006AA54 };
u8 D_8006AABC[28] = { 8, 6, 6, 5, 15, 14, 15, 15, 15, 14, 12, 12, 12, 12, 12, 12, 12, 3, 3, 4, 4, 10, 9, 3, 3, 0, 0, 0 };
u8 D_8006AAD8[880] = { 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 1, 21, 0, 3, 4, 3, 5, 4, 2, 2, 1, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 22, 0, 3, 4, 3, 5, 2, 1, 4, 1, 4, 2, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 14, 0, 12, 1, 16, 0, 13, 0, 18, 0, 19, 0, 20, 0, 17, 0, 11, 0, 12, 0, 10, 0, 20, 0, 12, 1, 19, 0, 13, 0, 18, 0, 14, 0, 16, 0, 17, 0, 11, 0, 12, 0, 10, 0, 14, 1, 12, 1, 2, 1, 19, 1, 18, 1, 24, 0, 20, 0, 17, 1, 10, 0, 12, 0, 11, 0, 21, 0, 17, 1, 3, 5, 13, 1, 19, 1, 14, 1, 2, 1, 20, 1, 16, 1, 3, 4, 18, 1, 22, 0, 3, 3, 17, 1, 13, 1, 19, 1, 1, 1, 2, 1, 20, 1, 16, 1, 18, 1, 3, 2, 0, 0, 4, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 23, 0, 23, 1, 13, 1, 16, 1, 4, 1, 2, 1, 4, 2, 15, 0, 6, 1, 7, 1, 14, 1, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 3, 2, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 3, 2, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 14, 0, 12, 1, 16, 0, 13, 0, 18, 0, 15, 0, 19, 0, 17, 0, 11, 0, 12, 0, 10, 0, 14, 0, 15, 0, 16, 0, 13, 0, 18, 0, 19, 0, 20, 0, 17, 0, 11, 0, 12, 0, 10, 0, 14, 0, 12, 1, 16, 0, 17, 1, 18, 0, 19, 0, 20, 0, 17, 0, 11, 0, 12, 0, 10, 0, 16, 0, 12, 1, 18, 1, 20, 0, 18, 0, 19, 0, 19, 1, 17, 0, 11, 0, 12, 0, 10, 0, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 3, 2, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 2, 1, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 3, 2, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 2, 1, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 3, 2, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 2, 1, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 2, 0, 3, 2, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 3, 0, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 4, 1, 2, 1, 1, 0, 2, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 3, 2, 3, 3, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 3, 2, 3, 3, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 3, 0, 1, 0, 4, 1, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 3, 1, 2, 1, 1, 0, 4, 1, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
s32 D_8006AE48[33] = { 65472, 3014659, -2147483648, -1900656, 3014659, 536870912, 2031504, 3014659, -536870912, -589944, 3014659, 0, 720776, 3014659, 0, 2686872, 3014659, -1073741824, -2556008, 3014659, 1073741824, -1900632, 3014659, 1073741824, -1245256, 3014659, 1610612736, 1376184, 3014659, -1610612736, 2031528, 3014659, -1073741824 };
s32 D_8006AECC[2] = { 0, 1536 };
void *D_8006AED4[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_8006AEEC[2] = { 0, 0 };
s32 D_8006AEF4[33] = { 36, 3014659, 0, -2621376, 3014659, 1610612736, -1310656, 3014659, -2147483648, 64, 3014659, -2147483648, -1310636, 3014659, -2147483648, 2621504, 3014659, -1610612736, -2621356, 3014659, 1610612736, 1310784, 3014659, -2147483648, 84, 3014659, -2147483648, 1310804, 3014659, -2147483648, 2621524, 3014659, -1610612736 };
s32 D_8006AF78[2] = { 0, 16778752 };
void *D_8006AF80[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_8006AF98[2] = { 0, 0 };
s32 D_8006AFA0[2] = { 33620997, 101257215 };
s32 D_8006AFA8[3] = { 66051, 67438087, 134810112 }; /* UNRESOLVED: size-only typing */
s32 D_8006AFB4[3] = { 134285578, 33882115, 100927232 }; /* UNRESOLVED: size-only typing */
s32 D_8006AFC0[3] = { 134285578, 33555204, 84281088 }; /* UNRESOLVED: size-only typing */
s32 D_8006AFCC[3] = { 134810114, 16777988, 84281088 }; /* UNRESOLVED: size-only typing */
s32 D_8006AFD8[3] = { 134285578, 33555204, 84281088 }; /* UNRESOLVED: size-only typing */
s32 D_8006AFE4[6] = { 134285578, 33555204, 84281088, 33554694, 84149000, 168363776 }; /* UNRESOLVED: size-only typing */
s32 D_8006AFFC[3] = { 134285578, 84017920, 100927232 }; /* UNRESOLVED: size-only typing */
s32 D_8006B008[3] = { 134285578, 33947651, 67438336 }; /* UNRESOLVED: size-only typing */
s32 D_8006B014 = 10420398;
s32 D_8006B018[3] = { 2139062143, 2139062143, 2139029504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B024[3] = { 1277716, 360677247, 2139029504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B030[3] = { 169246487, 411008895, 2139029504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B03C[3] = { 186220314, 461340543, 2139029504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B048[3] = { 203259678, 528449407, 2139029504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B054[3] = { 226435199, 2139062143, 2139029504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B060[3] = { 235807010, 595558271, 2139029504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B06C[3] = { 17172232, 151651586, 197632 }; /* UNRESOLVED: size-only typing */
s32 D_8006B078[3] = { 17172232, 151651586, 197632 }; /* UNRESOLVED: size-only typing */
s32 D_8006B084[3] = { 17172232, 151651586, 262912 }; /* UNRESOLVED: size-only typing */
s32 D_8006B090[3] = { 17172232, 151651586, 262912 }; /* UNRESOLVED: size-only typing */
s32 D_8006B09C[3] = { 17172232, 151651588, 33555200 }; /* UNRESOLVED: size-only typing */
s32 D_8006B0A8[6] = { 17172232, 151651588, 33751040, 17172232, 151651586, 262912 }; /* UNRESOLVED: size-only typing */
s32 D_8006B0C0[3] = { 17172232, 151650820, 84082688 }; /* UNRESOLVED: size-only typing */
s32 D_8006B0CC[3] = { 67503880, 151651587, 33554688 }; /* UNRESOLVED: size-only typing */
s32 D_8006B0D8[3] = { 84279552, 67240711, 134810112 }; /* UNRESOLVED: size-only typing */
s32 D_8006B0E4[3] = { 84279808, 50595592, 17369600 }; /* UNRESOLVED: size-only typing */
s32 D_8006B0F0[3] = { 84279808, 67307272, 17369600 }; /* UNRESOLVED: size-only typing */
s32 D_8006B0FC[3] = { 84279300, 50790920, 17369600 }; /* UNRESOLVED: size-only typing */
s32 D_8006B108[3] = { 83887620, 34078985, 167970560 }; /* UNRESOLVED: size-only typing */
s32 D_8006B114[3] = { 117834248, 17369603, 328704 }; /* UNRESOLVED: size-only typing */
s32 D_8006B120[3] = { 84148742, 134285578, 198400 }; /* UNRESOLVED: size-only typing */
s32 D_8006B12C[3] = { 117967114, 67438082, 50331904 }; /* UNRESOLVED: size-only typing */
s32 D_8006B138[3] = { 16909060, 84281096, 151650304 }; /* UNRESOLVED: size-only typing */
char D_8006B144[8] = "SPECIAL";
char D_8006B14C[8] = "I FORM";
char D_8006B154[8] = "GOAL";
char D_8006B15C[4] = "FAR";
char D_8006B160[12] = "PRO FORM";
char D_8006B16C[4] = "FG";
char D_8006B170[8] = "PUNT";
char D_8006B178[4] = "3-4";
char D_8006B17C[4] = "4-3";
char D_8006B180[8] = "NEAR";
char D_8006B188[8] = "SHOTGUN";
char D_8006B190[12] = "SINGLE BK";
char D_8006B19C[8] = "NICKEL";
char D_8006B1A4[8] = "DIME";
char D_8006B1AC[8] = "NORMAL";
char D_8006B1B4[4] = "BIG";
char D_8006B1B8[8] = "JUMBO";
char D_8006B1C0[8] = "3 WR";
char D_8006B1C8[8] = "4 WR";
char D_8006B1D0[8] = "BROKEN";
char D_8006B1D8[4] = "TE";
char D_8006B1DC[8] = "CLOCK";
s32 D_8006B1E4[2] = { 1250325, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006B1EC = 33488896; /* UNRESOLVED: size-only typing */
s32 D_8006B1F0 = 50266112; /* UNRESOLVED: size-only typing */
s32 D_8006B1F4 = 83820544; /* UNRESOLVED: size-only typing */
s32 D_8006B1F8 = 100597760; /* UNRESOLVED: size-only typing */
s32 D_8006B1FC[2] = { 169219864, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006B204[2] = { 186194459, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006B20C[2] = { 203234847, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006B214 = 220266240; /* UNRESOLVED: size-only typing */
s32 D_8006B218[2] = { 237052451, -16777216 }; /* UNRESOLVED: size-only typing */
s32 D_8006B220 = 268369920; /* UNRESOLVED: size-only typing */
s32 D_8006B224 = 285147136; /* UNRESOLVED: size-only typing */
s32 D_8006B228 = 301924352; /* UNRESOLVED: size-only typing */
s32 D_8006B22C = 318701568; /* UNRESOLVED: size-only typing */
s32 D_8006B230 = 67043328; /* UNRESOLVED: size-only typing */
s32 D_8006B234[10] = { 393218, 393220, 458767, 524291, 327681, 786448, 655371, 589828, 851968, 917504 }; /* UNRESOLVED: size-only typing */
s32 D_8006B25C[7] = { 262146, 262147, 720896, 393221, 65543, 983046, 1048576 }; /* UNRESOLVED: size-only typing */
s32 D_8006B278[5] = { 196609, 393218, 196608, 983044, 458768 }; /* UNRESOLVED: size-only typing */
s32 D_8006B28C[8] = { 327689, 131085, 196613, 65550, 11, 458753, 655372, 983048 }; /* UNRESOLVED: size-only typing */
s32 D_8006B2AC[7] = { 262240, 6029409, 6094942, 6619234, 5898339, 6226011, 6553600 }; /* UNRESOLVED: size-only typing */
s32 D_8006B2C8[4] = { 131166, 6029407, 6094944, 6619136 }; /* UNRESOLVED: size-only typing */
s32 D_8006B2D8[4] = { 131173, 6029405, 5963869, 6029312 }; /* UNRESOLVED: size-only typing */
s32 D_8006B2E8[5] = { 196702, 5963871, 6488157, 6553697, 6029408 }; /* UNRESOLVED: size-only typing */
s32 D_8006B2FC[7] = { 262266, 8323195, 8519804, 8454269, 8585342, 8388740, 8716288 }; /* UNRESOLVED: size-only typing */
s32 D_8006B318[5] = { 196730, 8323196, 8585339, 8716413, 8650878 }; /* UNRESOLVED: size-only typing */
s32 D_8006B32C[4] = { 131194, 8061052, 8192131, 8257536 }; /* UNRESOLVED: size-only typing */
s32 D_8006B33C[5] = { 196735, 8061061, 8519804, 8454272, 8257668 }; /* UNRESOLVED: size-only typing */
s32 D_8006B350[10] = { 393321, 7340136, 7209066, 7405679, 7143538, 7012468, 7078003, 6946933, 7733351, 7274496 }; /* UNRESOLVED: size-only typing */
s32 D_8006B378[7] = { 262249, 7340136, 7667818, 7405679, 7143538, 7012468, 7077888 }; /* UNRESOLVED: size-only typing */
s32 D_8006B394[5] = { 196713, 7340136, 7667821, 7471211, 6946924 }; /* UNRESOLVED: size-only typing */
s32 D_8006B3A8[8] = { 327786, 7340136, 7209068, 7667823, 7143538, 7012468, 7078003, 6750326 }; /* UNRESOLVED: size-only typing */
s32 D_8006B3C8[13] = { 524460, 10617005, 10944673, 11206825, 10682543, 11665573, 11731124, 10879144, 10420398, 10485929, 10551472, 11141284, 11599872 }; /* UNRESOLVED: size-only typing */
s32 D_8006B3FC[7] = { 262308, 10944678, 11665570, 11141283, 11337889, 11600037, 11468800 }; /* UNRESOLVED: size-only typing */
s32 D_8006B418[5] = { 196769, 11141284, 10879149, 10682530, 11731109 }; /* UNRESOLVED: size-only typing */
s32 D_8006B42C[11] = { 458914, 11337891, 10944673, 11206825, 11468978, 11731124, 11010219, 10748080, 10420398, 10485930, 10813612 }; /* UNRESOLVED: size-only typing */
s32 D_8006B458[13] = { 524428, 8913037, 9633930, 9699473, 8978578, 9765003, 9830542, 9371792, 9896073, 9961625, 9044122, 10158219, 10223616 }; /* UNRESOLVED: size-only typing */
s32 D_8006B48C[13] = { 524428, 8913037, 9633930, 9699473, 8978578, 9765003, 9830542, 9371792, 9896073, 9961625, 9044122, 10158219, 10223616 }; /* UNRESOLVED: size-only typing */
s32 D_8006B4C0[4] = { 131153, 5439570, 5505109, 5439488 };
s32 D_8006B4D0[2] = { 65719, 11993271 };
s32 D_8006B4D8[4] = { 131158, 5701720, 5832790, 5701632 };
s32 D_8006B4E8[4] = { 131072, 655372, 720910, 851968 }; /* UNRESOLVED: size-only typing */
s32 D_8006B4F8[4] = { 131092, 1507358, 1703970, 1310720 }; /* UNRESOLVED: size-only typing */
s32 D_8006B508[4] = { 131093, 1572895, 1769507, 1376256 }; /* UNRESOLVED: size-only typing */
s32 D_8006B518[4] = { 131091, 1441821, 1638429, 1245184 }; /* UNRESOLVED: size-only typing */
s32 D_8006B528[4] = { 131105, 2097185, 2097185, 2097152 }; /* UNRESOLVED: size-only typing */
s32 D_8006B538[4] = { 131072, 1245217, 1310741, 131072 };
s32 D_8006B548[4] = { 131072, 1245217, 1310741, 0 };
s32 D_8006B558[4] = { 131075, 1048593, 1179663, 327680 };
s32 D_8006B568[4] = { 131092, 1179667, 1245202, 1310720 }; /* UNRESOLVED: size-only typing */
s32 D_8006B578[4] = { 131097, 1376280, 1441817, 1507328 }; /* UNRESOLVED: size-only typing */
s32 D_8006B588[4] = { 131193, 1114233, 1114233, 1114112 }; /* UNRESOLVED: size-only typing */
s32 D_8006B598[8] = { 327715, 2031650, 1900576, 1966107, 2162714, 2490407, 2621468, 2359333 }; /* UNRESOLVED: size-only typing */
s32 D_8006B5B8[5] = { 196682, 4915276, 5046351, 5242960, 5111885 }; /* UNRESOLVED: size-only typing */
s32 D_8006B5CC[5] = { 196675, 4325441, 4456517, 4587591, 4718665 }; /* UNRESOLVED: size-only typing */
s32 D_8006B5E0[7] = { 262185, 2752555, 2883629, 3014703, 3145777, 3276851, 3407872 }; /* UNRESOLVED: size-only typing */
s32 D_8006B5FC[4] = { 131125, 3538999, 3670073, 3801088 }; /* UNRESOLVED: size-only typing */
s32 D_8006B60C[4] = { 131131, 3932221, 4063295, 4194304 }; /* UNRESOLVED: size-only typing */
s32 D_8006B61C[6] = { 65538, 65544, 65540, 262148, 65541, 327685 }; /* UNRESOLVED: size-only typing */
void *D_8006B634[36] = { &D_8006B234, &D_8006B568, &D_8006B578, &D_8006B598, &D_8006B5B8, &D_8006B5B8, &D_8006B5B8, &D_8006B5B8, &D_8006B588, &D_8006B5B8, &D_8006B2AC, &D_8006B350, &D_8006B2FC, &D_8006B458, &D_8006B3C8, &D_8006B5CC, &D_8006B5E0, &D_8006B5FC, &D_8006B60C, &D_8006B28C, &D_8006B25C, &D_8006B278, &D_8006B2E8, &D_8006B2C8, &D_8006B2D8, &D_8006B3A8, &D_8006B378, &D_8006B394, &D_8006B350, &D_8006B33C, &D_8006B318, &D_8006B32C, &D_8006B48C, &D_8006B42C, &D_8006B3FC, &D_8006B418 };
void *D_8006B6C4[34] = { &D_8006B4E8, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B518, &D_8006B4F8, &D_8006B508, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B61C, &D_8006B528 };
s32 D_8006B74C[2] = { 262160, 458765 }; /* UNRESOLVED: size-only typing */
s32 D_8006B754[2] = { 6619229, 6357087 }; /* UNRESOLVED: size-only typing */
s32 D_8006B75C[2] = { 10616996, 11731115 }; /* UNRESOLVED: size-only typing */
s32 D_8006B764[2] = { 8192124, 8650881 }; /* UNRESOLVED: size-only typing */
s32 D_8006B76C[2] = { 8978568, 9961627 }; /* UNRESOLVED: size-only typing */
s32 D_8006B774[2] = { 6881383, 7471219 }; /* UNRESOLVED: size-only typing */
s32 D_8006B77C[2] = { 2097188, 2031650 }; /* UNRESOLVED: size-only typing */
s32 D_8006B784[2] = { 2949172, 3014697 }; /* UNRESOLVED: size-only typing */
s32 D_8006B78C[2] = { 3670073, 3604533 }; /* UNRESOLVED: size-only typing */
s32 D_8006B794[2] = { 3997755, 3932223 }; /* UNRESOLVED: size-only typing */
s32 D_8006B79C[3] = { 4390977, 4653126, 0 }; /* UNRESOLVED: size-only typing */
s16 D_8006B7A8 = 0;
s16 D_8006B7AA = 0;
s16 D_8006B7AC = 0;
s16 D_8006B7AE = 0;
s16 D_8006B7B0 = 0;
s16 D_8006B7B2 = 0;
s16 D_8006B7B4 = 0;
s16 D_8006B7B6 = 0;
s16 D_8006B7B8 = 0;
s16 D_8006B7BA = 0;
s16 D_8006B7BC = 0;
s16 D_8006B7BE = 0;
s16 D_8006B7C0 = 0;
s16 D_8006B7C2 = 0;
u8 D_8006B7C4[4] = { 53, 0, 0, 0 };
s32 D_8006B7C8 = 8; /* UNRESOLVED: size-only typing */
s32 D_8006B7CC = 0;
void *D_8006B7D0[3] = { 0, &D_8007A0C4, &D_8007A0C7 };
s32 D_8006B7DC = 0;
void *D_8006B7E0[3] = { 0, 0, &D_8006B7C4 };
s32 D_8006B7EC = 32;
s32 D_8006B7F0 = 0;
s32 D_8006B7F4 = 0;
s32 D_8006B7F8[3] = { 0, 0, 0 };
s32 D_8006B804[3] = { 0, 0, 0 };
s32 D_8006B810[3] = { 0, 0, 0 };
s32 D_8006B81C[3] = { 0, 0, 0 };
s32 D_8006B828[6] = { 0, 0, 0, 0, 0, 0 };
s32 D_8006B840 = 0;
s32 D_8006B844 = 0;
s32 D_8006B848 = 0;
s32 D_8006B84C[2] = { 0, 0 };
s32 D_8006B854 = 0;
s32 D_8006B858 = 0;
s32 D_8006B85C = 0;
s32 D_8006B860 = 0;
s32 D_8006B864 = 0;
s32 D_8006B868 = 0;
s32 D_8006B86C = 0;
s32 D_8006B870[5] = { 0, -2147043384, 0, 0, 196608 };
s32 D_8006B884 = 0;
s32 D_8006B888 = 0;
s32 D_8006B88C = 0;
s16 D_8006B890 = 31;
s16 D_8006B892 = 31;
s16 D_8006B894 = 31;
s16 D_8006B896 = 31;
s16 D_8006B898 = 1;
s16 D_8006B89A = 1;
s16 D_8006B89C = 1;
s16 D_8006B89E = 1;
s16 D_8006B8A0 = 31;
s16 D_8006B8A2 = 31;
s16 D_8006B8A4 = 31;
s16 D_8006B8A6 = 31;
s16 D_8006B8A8 = 1;
s16 D_8006B8AA = 1;
s16 D_8006B8AC = 1;
s16 D_8006B8AE = 1;
void *D_8006B8B0[2] = { &D_8006B890, &D_8006B8A0 };
s32 D_8006B8B8 = 0;
s16 D_8006B8BC = 8;
s16 D_8006B8BE = 8;
void *D_8006B8C0[2] = { &D_8006B890, 0 };
void *D_8006B8C8[7] = { &D_800DDC88, &D_800DDC88, &D_800DDC98, &D_800DDCB0, &D_800DDCC8, &D_800DDCE4, &D_800DDD00 };
s32 D_8006B8E4 = 0;
s32 D_8006B8E8 = 3;
s32 D_8006B8EC = 0;
s32 D_8006B8F0 = 0;
s32 D_8006B8F4 = 0;
s32 D_8006B8F8 = 0;
s32 D_8006B8FC = 0;
s32 D_8006B900 = 0;
s32 D_8006B904 = 16;
void *D_8006B908[2] = { &D_80080CA6, &D_80082DF2 };
void *D_8006B910[14] = { &D_80080CE5, &D_80082E31, &D_80080C91, &D_80082DDD, &D_80080CBB, &D_80082E07, &D_80085818, &D_80085821, &D_8008582A, &D_80085833, &D_8008583C, &D_80085845, &D_8008584E, &D_80085857 };
s32 D_8006B948 = 7;
s32 D_8006B94C[7] = { 0, 0, 0, 0, 0, 0, 0 };
s32 D_8006B968 = 8;
s32 D_8006B96C = 0;
s32 D_8006B970 = 0;
s32 D_8006B974 = 0;
s32 D_8006B978 = 0;
s32 D_8006B97C = 0;
s32 D_8006B980 = 0;
s32 D_8006B984 = 0;
s32 D_8006B988 = 0;
s32 D_8006B98C = 11;
s32 D_8006B990 = 0;
s32 D_8006B994 = 0;
s32 D_8006B998 = 0;
s32 D_8006B99C = 0;
s32 D_8006B9A0 = 0;
s32 D_8006B9A4[6] = { 0, 0, 0, 0, 0, 0 };
s16 D_8006B9BC = -1;
s16 D_8006B9BE = -1;
struct D_8006B9C0_s { s16 f_8006b9c0; s16 f_8006b9c2[2]; } D_8006B9C0 = { -1, { -1, 0 } }; /* members: D_8006B9C0, D_8006B9C2 */
s16 D_8006B9C6 = -1;
s16 D_8006B9C8[2] = { -1, 0 };
s32 D_8006B9CC[2] = { 1, -2146921080 };
s32 D_8006B9D4 = 0;
s16 D_8006B9D8 = 3;
s16 D_8006B9DA = 3;
s32 D_8006B9DC = 0;
s16 D_8006B9E0[2] = { 30, 0 };
struct D_8006B9E4_s { s16 f_8006b9e4[29]; s16 f_8006ba1e[2]; } D_8006B9E4 = { { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28 }, { 29, 125 } }; /* members: D_8006B9E4, D_8006BA1E */
s16 D_8006BA22 = 0;
s32 D_8006BA24[39] = { 671093441, 671095842, 1342178883, 1342180484, 1207959877, -1610088394, -2012217273, 704643872, -2113929152, 1375732192, 1912603104, -1979711440, 1241514144, 436207744, 940572752, 1343228256, 1879050599, -2147483488, -1610088432, 1343227456, 1880098368, -2012217312, 1744830560, 1343226176, 1477443904, 1209008448, -2147483568, 1745354880, 1074790464, 2014314528, 1477443616, 806354992, -2146959200, 1209008176, 1745879088, 403701808, 270008816, 672662000, 2097152 };
s32 D_8006BAC0 = 0;
s32 D_8006BAC4 = 0;
s32 D_8006BAC8[7] = { 167837711, 234946590, 620822568, 570490925, 335740929, 671285293, 327680 };
s32 D_8006BAE4[9] = { 262147, 327686, 720905, 655373, 917519, 1048593, 1310742, 2147418112, 0 };
u8 D_8006BB08[24] = { 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 14, 0, 0 };
u8 D_8006BB20[16] = { 31, 7, 14, 21, 28, 5, 12, 12, 26, 2, 9, 16, 23, 23, 30, 7 };
u8 D_8006BB30[16] = { 14, 21, 28, 11, 25, 1, 0, 0, 31, 30, 31, 30, 31, 30, 28, 0 };
char D_8006BB40[40] = "AUG. SEPT.OCT. NOV. DEC. JAN. FEB. ";
s32 D_8006BB68 = 0;
s16 D_8006BB6C = 0;
s16 D_8006BB6E = -200;
s16 D_8006BB70[30] = { -340, 0, 0, -200, -390, 0, 30, -200, -450, 0, 0, -200, -360, 0, 0, -200, -320, 0, 0, -200, -250, 0, 0, -200, -250, 0, 0, -200, -250, 0 };
Vtx_t D_8006BBAC[4] = {
    { { 90, -140, 0 }, 0, { 90, -100 }, { 0, 0, 0, 0 } },
    { { 90, 50, 0 }, 0, { 90, 140 }, { 0, 0, 0, 0 } },
    { { 90, 140, 0 }, 0, { 90, 100 }, { 0, 0, 0, 0 } },
    { { 90, 0, 0 }, 0, { 90, -60 }, { 0, 0, 0, 0 } }
};
s16 D_8006BBEC = -130;
s16 D_8006BBEE = 130;
s16 D_8006BBF0[32] = { 0, 0, -80, 130, 20, 0, 0, 130, 80, 0, 127, 125, -20, 0, 120, 125, -55, 0, 60, 155, -80, 0, -20, 150, -100, 0, -80, 160, 0, 0, 0, 0 };
char D_8006BC30[4] = "HT:";
char D_8006BC34[4] = "WT:";
char D_8006BC38[12] = "YRS. PRO:";
char D_8006BC44[24] = "NO PLAYERS AVAILABLE.";
char D_8006BC5C[12] = "MADDENISMS";
char D_8006BC68[8] = "FRAGT";
char D_8006BC70[8] = "STATS";
char D_8006BC78[8] = "TEAM";
char D_8006BC80[20] = "ARE YOU SURE YOU";
char D_8006BC94[16] = "WANT TO ABORT?";
char D_8006BCA4[4] = "YES";
char D_8006BCA8[4] = "NO";
char D_8006BCAC[24] = "CAN'T DRAFT ANY MORE";
char D_8006BCC4[20] = "PLAYERS FROM THIS";
char D_8006BCD8[12] = "POSITION.";
char D_8006BCE4[8] = "CANCEL";
char D_8006BCEC[12] = "CONTINUE";
char D_8006BCF8[20] = "THERE ARE NO PLAYS";
char D_8006BD0C[24] = "IN THE CURRENT DRIVE.";
char D_8006BD24[4] = "EAS";
char D_8006BD28[8] = "CONF. B";
char D_8006BD30[8] = "CONF. A";
char D_8006BD38[8] = "EAST";
char D_8006BD40[8] = "CENTRAL";
char D_8006BD48[8] = "WEST";
char D_8006BD50[4] = "PF";
char D_8006BD54[4] = "PA";
char D_8006BD58[4] = "PCT";
char D_8006BD5C[16] = "CONF. B EAST";
char D_8006BD6C[16] = "CONF. B CENT.";
char D_8006BD7C[16] = "CONF. B WEST";
char D_8006BD8C[16] = "CONF. A EAST";
char D_8006BD9C[16] = "CONF. A CENT.";
char D_8006BDAC[16] = "CONF. A WEST";
char D_8006BDBC[8] = "OFFENSE";
char D_8006BDC4[8] = "DEFENSE";
char D_8006BDCC[8] = "PENALTY";
char D_8006BDD4[8] = "LEVELS";
char D_8006BDDC[16] = "PENALTY LEVELS";
char D_8006BDEC[12] = "TEAM STATS";
char D_8006BDF8[16] = "PLAYER STATS";
char D_8006BE08[16] = "SEASON STATS";
char D_8006BE18[12] = "GAME STATS";
char D_8006BE24[16] = "DRIVE SUMMARY";
char D_8006BE34[16] = "SCORING SUMMARY";
char D_8006BE44[8] = "EDIT";
char D_8006BE4C[8] = "NONE";
char D_8006BE54[16] = "INSTANT REPLAY";
char D_8006BE64[28] = "NO PLAYERS WITH THIS STAT.";
char D_8006BE80[16] = "INJURY REPORT";
char D_8006BE90[20] = "WILDCARD PLAYOFFS";
char D_8006BEA4[20] = "DIVISION PLAYOFFS";
char D_8006BEB8[16] = "CONF. PLAYOFFS";
char D_8006BEC8[20] = "EAS CHAMPIONSHIP";
char D_8006BEDC[12] = "MADDEN BOWL";
char D_8006BEE8[20] = "WILDCARD playoffs";
char D_8006BEFC[20] = "DIVISION playoffs";
char D_8006BF10[16] = "CONF. playoffs";
char D_8006BF20[20] = "EAS championship";
char D_8006BF34[12] = "MADDEN bowl";
char D_8006BF40[12] = "WEEK    ";
char D_8006BF4C[12] = "ROUND    ";
char D_8006BF58[16] = "PRELIMINARIES";
char D_8006BF68[16] = "CHAMPIONSHIP";
char D_8006BF78[8] = "TREE";
char D_8006BF80[16] = "HALFTIME REPORT";
char D_8006BF90[16] = "NO INJURIES.";
s32 D_8006BFA0 = 536870912;
char D_8006BFA4[20] = "EA SPORTS TICKER";
char D_8006BFB8[16] = "NO OTHER GAMES.";
char D_8006BFC8[12] = " QUARTER";
char D_8006BFD4[12] = "OVERTIME";
char D_8006BFE0[12] = "GAME OVER";
char D_8006BFEC[12] = "END OF HALF";
char D_8006BFF8[8] = "FINAL";
char D_8006C000[28] = "RESET ALL SUBSTITUTIONS?";
char D_8006C01C[24] = "RUN BY ~A FOR ~C YARDS.";
char D_8006C034[32] = "PASS BY ~B TO ~A FOR ~C YARDS.";
char D_8006C054[24] = "INCOMPLETE PASS BY ~B.";
char D_8006C06C[40] = "KICKOFF RETURNED BY ~A FOR ~C YARDS.";
char D_8006C094[36] = "PUNT RETURNED BY ~A FOR ~C YARDS.";
char D_8006C0B8[40] = "FUMBLE RECOVERED BY ~A FOR ~C YARDS.";
char D_8006C0E0[44] = "INTERCEPTION BY ~A RETURNED FOR ~C YARDS.";
char D_8006C10C[32] = "FIELD GOAL BY ~A OF ~C YARDS.";
char D_8006C12C[28] = "PUNT BLOCK RECOVERED BY ~A.";
char D_8006C148[36] = "FIELD GOAL BLOCK RECOVERED BY ~A.";
char D_8006C16C[12] = " ~C YARDS.";
char D_8006C178[28] = "FREE KICK RECOVERED BY ~A.";
char D_8006C194[12] = "PUNT BLOCK";
char D_8006C1A0[20] = "FIELD GOAL BLOCK";
char D_8006C1B4[20] = "FREE KICK RECOVERY";
char D_8006C1C8[48] = "MISSED FIELD GOAL ATTEMPT BY ~A OF ~C YARDS.";
char D_8006C1F8[40] = "~B SACKED BY ~A FOR A LOSS OF ~C YARDS.";
char D_8006C220[12] = "SKILL LEVEL";
char D_8006C22C[4] = "PRO";
char D_8006C230[12] = "ALL MADDEN";
char D_8006C23C[12] = " DEGREES";
char D_8006C248[16] = "EXHIBITION GAME";
char D_8006C258[16] = "TOURNAMENT GAME";
char D_8006C268[8] = " MPH";
char D_8006C270[4] = "N ";
char D_8006C274[4] = "NE ";
char D_8006C278[4] = "E ";
char D_8006C27C[4] = "SE ";
char D_8006C280[4] = "S ";
char D_8006C284[4] = "SW ";
char D_8006C288[4] = "W ";
char D_8006C28C[4] = "NW ";
char D_8006C290[4] = "HOT";
char D_8006C294[8] = "WARM";
char D_8006C29C[8] = "COOL";
char D_8006C2A4[8] = "RAINY";
char D_8006C2AC[8] = "SNOWY";
char D_8006C2B4[8] = "WINDY";
char D_8006C2BC[8] = "CALM";
char D_8006C2C4[120] = "~G ~I = SCROLL TEAMS.|~H ~J = CHANGE TEAM.|~E, ~F = CHANGE DIVISION.|START, ~C = ACCEPT TEAMS.|~B = PREVIOUS SCREEN.";
char D_8006C33C[144] = "~G ~I = CHANGE OPTION|   VERTICALLY.|~H ~J = TOGGLE OPTIONS WHEN|   LEFT AND RIGHT ARROWS|   APPEAR.|~C = SELECT OPTION.|~B = PREVIOUS SCREEN.";
char D_8006C3CC[152] = "~G ~I = CHANGE OPTION|   VERTICALLY.|~H ~J = TOGGLE OPTIONS WHEN|   LEFT AND RIGHT ARROWS|   APPEAR.|~C = SELECT OPTION.|START, ~B = PREVIOUS SCREEN.";
char D_8006C464[100] = "~G ~I = CHANGE OPTION|   VERTICALLY.|~C = SELECT OPTION.|START = PLAY WEEK|~B = PREVIOUS SCREEN.";
char D_8006C4C8[152] = "~G ~I = CHANGE OPTION|   VERTICALLY.|~H ~J = TOGGLE OPTIONS WHEN|   LEFT AND RIGHT ARROWS|   APPEAR.|START, ~C = SELECT OPTION.|~B = PREVIOUS SCREEN.";
char D_8006C560[104] = "~G ~I = CHANGE OPTION|   VERTICALLY.|~C = SELECT OPTION.|START = TOURNAMENT TREE|~B = PREVIOUS SCREEN.";
char D_8006C5C8[88] = "~G ~I = CHANGE OPTION|   VERTICALLY.|START, ~C = SELECT OPTION.|~B = PREVIOUS SCREEN.";
char D_8006C620[108] = "~G ~I = SCROLL LIST VERTICALLY.|~H ~J = SCROLL LIST|   HORIZONTALLY.|START, ~C, ~B = PREVIOUS|   SCREEN.";
char D_8006C68C[76] = "~G ~I = CHANGE OPTION|   VERTICALLY.|START, ~C, ~B = PREVIOUS|   SCREEN.";
char D_8006C6D8[112] = "~G ~I = SCROLL LIST VERTICALLY.|~H ~J = SCROLL LIST|   HORIZONTALLY.|~C = SELECT.|START, ~B = PREVIOUS SCREEN.";
char D_8006C748[80] = "~G ~I = CHANGE OPTION|   VERTICALLY.|START, ~C = SELECT|~B = PREVIOUS SCREEN.";
char D_8006C798[156] = "~G ~I = SCROLL TABLE OR|  LIST VERTICALLY.|~H ~J = SCROLL TABLE OR|  LIST HORIZONTALLY.|~A = CHANGE CONTROL.|START, ~C = MAIN MENU.|~B = PREVIOUS SCREEN.";
char D_8006C834[104] = "~G ~I = CHANGE OPTION|   VERTICALLY.|~H ~J = CHANGE TEAMS|START, ~C = MAIN MENU|~B = PREVIOUS SCREEN.";
char D_8006C89C[68] = "~G ~I = SCROLL OPTIONS.|~C = CHOOSE OPTION.|START, ~B = END GAME.";
char D_8006C8E0[72] = "~G ~I = SCROLL OPTIONS.|~C = CHOOSE OPTION.|START, ~B = RETURN TO GAME.";
char D_8006C928[56] = "~G ~I = SCROLL STATS.|START, ~C, ~B = RETURN TO GAME.";
char D_8006C960[68] = "~G ~I = SCROLL STATS.|START, ~C = MAIN MENU|~B = PREVIOUS SCREEN.";
char D_8006C9A4[56] = "~G ~I = SCROLL.|~C = CHOOSE OPTION.|~B = CANCEL POPUP.";
char D_8006C9DC[100] = "~G ~I = MOVE CURSOR.|~H ~J = MORE/LESS.|~E, ~F = ADJUST ALL.|START, ~C, ~B = PREVIOUS|   SCREEN.";
char D_8006CA40[212] = "~H ~J = SELECT TEAM.|~G ~I = CHANGE CONTROLLER|   COLOR WHEN CONTROLLER IS|   IN THE CENTER.|START, ~B, ~C = PREVIOUS|   SCREEN.|INSERT RUMBLE PAK HERE AND |   THE PAK WILL \"RUMBLE\"|   WHEN INSERTED CORRECTLY.";
char D_8006CB14[224] = "~H ~J = SELECT TEAM.|~G ~I = CHANGE CONTROLLER|   COLOR WHEN CONTROLLER IS|   IN THE CENTER.|START, ~C = NEXT SCREEN.|~B = PREVIOUS SCREEN.|INSERT RUMBLE PAK HERE AND |   THE PAK WILL \"RUMBLE\"|   WHEN INSERTED CORRECTLY.";
char D_8006CBF4[140] = "DURING TOSS--|   ~G ~I = CHOOSE HEADS|   OR TAILS.|   ~C = LOCK CHOICE.|AFTER TOSS--|   ~G ~I = CHOOSE ADVANTAGE.|   ~C = ACCEPT CHOICE.";
char D_8006CC80[92] = "~H ~J = CHANGE USER.|~G ~I = SCROLL VS USER.|START, ~C = MAIN MENU|~B = PREVIOUS SCREEN.";
char D_8006CCDC[92] = "~G ~I = SCROLL LIST VERTICALLY.|~H ~J = CHANGE TEAM.|START, ~C, ~B = PREVIOUS|   SCREEN.";
char D_8006CD38[84] = "~G ~I = SCROLL CATEGORY.|~H ~J = PLAYER/POSITION.|~B = BACK/PREVIOUS.|~C = SELECT.";
char D_8006CD8C[72] = "~G ~I = SCROLL.|~H ~J = CATEGORY.|~B = BACK/PREVIOUS.|~C = SUBSTITUTE.";
char D_8006CDD4[156] = "~G ~I = SCROLL.|~H ~J = CATEGORY.|~B = BACK/PREVIOUS.|~C = SELECT.|RED DOTS = SUB OUT PLAYER'S|   CURRENT SETS|BLUE DOTS = SUB IN PLAYER'S|   CURRENT SETS";
char D_8006CE70[40] = "~G ~I = SCROLL.|~B = PREVIOUS SCREEN.";
char D_8006CE98[96] = "~G ~I = CHANGE SOUND TYPE.|~H ~J = CHANGE SOUND NUMBER.|~C = PLAY SOUND.|~B = PREVIOUS SCREEN.";
char D_8006CEF8[40] = "~G ~I = SCROLL PLAYS.|START,~B = EXIT.";
char D_8006CF20[24] = "a OR ` TO CLOSE HELP";
char D_8006CF38[60] = "~G ~I = SCROLL CAMERA VIEWS.|START, ~C, ~B = SELECT VIEW.";
char D_8006CF74[16] = "PASSING STATS";
char D_8006CF84[16] = "RUSHING STATS";
char D_8006CF94[16] = "RECEIVING STATS";
char D_8006CFA4[16] = "DEFENSIVE STATS";
char D_8006CFB4[12] = "KICK STATS";
char D_8006CFC0[12] = "PUNT STATS";
char D_8006CFCC[16] = "KICK RTN. STATS";
char D_8006CFDC[16] = "PUNT RTN. STATS";
char D_8006CFEC[8] = "PASSING";
char D_8006CFF4[8] = "RUSHING";
char D_8006CFFC[12] = "RECEIVING";
char D_8006D008[12] = "DEFENSIVE";
char D_8006D014[8] = "KICK";
char D_8006D01C[8] = "PUNT";
char D_8006D024[12] = "KICK RTN.";
char D_8006D030[12] = "PUNT RTN.";
char D_8006D03C[8] = "SEASON";
char D_8006D044[8] = "DEFENSE";
char D_8006D04C[16] = "PASSING LEADERS";
char D_8006D05C[16] = "RUSHING LEADERS";
char D_8006D06C[20] = "RECEIVING LEADERS";
char D_8006D080[20] = "DEFENSIVE LEADERS";
char D_8006D094[16] = "KICK LEADERS";
char D_8006D0A4[16] = "PUNT LEADERS";
char D_8006D0B4[20] = "KICK RTN. LEADERS";
char D_8006D0C8[20] = "PUNT RTN. LEADERS";
char D_8006D0DC[8] = "LEADERS";
char D_8006D0E4[12] = "KICK RETURN";
char D_8006D0F0[12] = "PUNT RETURN";
char D_8006D0FC[8] = "SCORE";
char D_8006D104[12] = "TOTAL OFF.";
char D_8006D110[16] = "OFF. PASSING";
char D_8006D120[16] = "OFF. RUSHING";
char D_8006D130[12] = "THIRD DOWNS";
char D_8006D13C[20] = "THIRD DNS. CONV.";
char D_8006D150[16] = "THIRD DOWN PCT.";
char D_8006D160[16] = "FOURTH DOWNS";
char D_8006D170[20] = "FOURTH DNS. CONV.";
char D_8006D184[20] = "FOURTH DOWN PCT.";
char D_8006D198[12] = "PENALTIES";
char D_8006D1A4[16] = "PENALTY YDS.";
char D_8006D1B4[12] = "TOTAL YDS.";
char D_8006D1C0[16] = "SP. TEAMS YDS.";
char D_8006D1D0[12] = "TURNOVERS";
char D_8006D1DC[16] = "TIME OF POSS.";
char D_8006D1EC[12] = "FIRST DOWNS";
char D_8006D1F8[16] = "2 PT. ATTEMPTS";
char D_8006D208[20] = "2 PT. CONV. MADE";
char D_8006D21C[16] = "OFF. REDZONE #";
char D_8006D22C[20] = "OFF. REDZONE TDS";
char D_8006D240[20] = "OFF. REDZONE FGS";
char D_8006D254[20] = "OFF REDZONE TD. %";
char D_8006D268[16] = "DEF. REDZONE #";
char D_8006D278[20] = "DEF. REDZONE TDS";
char D_8006D28C[20] = "DEF. REDZONE FGS";
char D_8006D2A0[20] = "DEF REDZONE TD. %";
char D_8006D2B4[8] = "DELETED";
char D_8006D2BC[16] = "INJURY REPORT";
char D_8006D2CC[12] = "SETTINGS";
char D_8006D2D8[12] = "END GAME";
char D_8006D2E4[12] = "RESUME GAME";
char D_8006D2F0[12] = "ABORT GAME";
char D_8006D2FC[16] = "CALL TIMEOUT";
char D_8006D30C[16] = "DIAGONAL CAM";
char D_8006D31C[12] = "MADDEN CAM";
char D_8006D328[20] = "MADDEN CLASSIC CAM";
char D_8006D33C[20] = "MADDEN 1 PLAYER CAM";
char D_8006D350[20] = "SIDELINE LOW CAM";
char D_8006D364[16] = "CLOSE UP CAM";
char D_8006D374[16] = "SHOULDER CAM";
char D_8006D384[16] = "MADDEN ZOOM CAM";
char D_8006D394[12] = "HELMET CAM";
char D_8006D3A0[8] = "CAMERA";
char D_8006D3A8[4] = "OFF";
char D_8006D3AC[4] = "ON";
char D_8006D3B0[16] = "SUBSTITUTIONS";
char D_8006D3C0[16] = "GLOBAL OFFENSE";
char D_8006D3D0[16] = "GLOBAL DEFENSE";
char D_8006D3E0[16] = "SET AUDIBLES";
char D_8006D3F0[8] = "BY NAME";
char D_8006D3F8[8] = "BY NUM";
char D_8006D400[8] = "BY POS";
char D_8006D408[8] = "NONE";
char D_8006D410[4] = "FOG";
char D_8006D414[12] = "PRO FORM";
char D_8006D420[12] = "FIELD GOAL";
char D_8006D42C[8] = "PUNT";
char D_8006D434[4] = "3-4";
char D_8006D438[8] = "DEFEND";
char D_8006D440[8] = "RETURN";
char D_8006D448[12] = "FG DEFEND";
char D_8006D454[12] = "PUNT RETURN";
char D_8006D460[8] = "3 WR";
char D_8006D468[8] = "2 TE";
char D_8006D470[12] = "TE MOTION";
char D_8006D47C[8] = "H BACK";
char D_8006D484[8] = "NORMAL";
char D_8006D48C[8] = "BROKEN";
char D_8006D494[12] = "GOAL LINE";
char D_8006D4A0[8] = "SHOTGUN";
char D_8006D4A8[12] = "SINGLE BACK";
char D_8006D4B4[4] = "PRO";
char D_8006D4B8[8] = "SGUN";
char D_8006D4C0[8] = "SBCK";
char D_8006D4C8[8] = "GOAL";
char D_8006D4D0[8] = "IFRM";
char D_8006D4D8[4] = "QB";
char D_8006D4DC[4] = "HB";
char D_8006D4E0[4] = "FB";
char D_8006D4E4[4] = "WR";
char D_8006D4E8[4] = "TE";
char D_8006D4EC[4] = "LT";
char D_8006D4F0[4] = "LG";
s32 D_8006D4F4 = 1124073472; /* UNRESOLVED: size-only typing */
char D_8006D4F8[4] = "RG";
char D_8006D4FC[4] = "RT";
char D_8006D500[4] = "LE";
char D_8006D504[4] = "RE";
char D_8006D508[4] = "DT";
char D_8006D50C[8] = "LOLB";
char D_8006D514[8] = "LILB";
char D_8006D51C[8] = "RILB";
char D_8006D524[8] = "ROLB";
char D_8006D52C[4] = "LCB";
char D_8006D530[4] = "RCB";
char D_8006D534[4] = "FS";
char D_8006D538[4] = "SS";
s32 D_8006D53C = 1258291200; /* UNRESOLVED: size-only typing */
s32 D_8006D540 = 1342177280; /* UNRESOLVED: size-only typing */
char D_8006D544[4] = "KR";
char D_8006D548[4] = "PR";
char D_8006D54C[4] = "OL";
char D_8006D550[4] = "DL";
char D_8006D554[8] = "CB/S";
char D_8006D55C[4] = "LB";
void *D_8006D560[25] = { &D_8006D4D8, &D_8006D4DC, &D_8006D4E0, &D_8006D4E4, &D_8006D4E8, &D_8006D4EC, &D_8006D4F0, &D_8006D4F4, &D_8006D4F8, &D_8006D4FC, &D_8006D500, &D_8006D504, &D_8006D508, &D_8006D50C, &D_8006D514, &D_8006D51C, &D_8006D524, &D_8006D52C, &D_8006D530, &D_8006D534, &D_8006D538, &D_8006D53C, &D_8006D540, &D_8006D544, &D_8006D548 };
char D_8006D5C4[4] = "WGT";
char D_8006D5C8[4] = "HGT";
char D_8006D5CC[4] = "AGI";
char D_8006D5D0[4] = "SPD";
char D_8006D5D4[4] = "AWR";
char D_8006D5D8[4] = "CTH";
char D_8006D5DC[4] = "CAR";
char D_8006D5E0[4] = "THP";
char D_8006D5E4[4] = "THA";
char D_8006D5E8[4] = "KPW";
char D_8006D5EC[4] = "KAC";
char D_8006D5F0[4] = "BTK";
char D_8006D5F4[4] = "TAK";
char D_8006D5F8[4] = "IMP";
char D_8006D5FC[4] = "PBK";
char D_8006D600[4] = "RBK";
char D_8006D604[4] = "INJ";
char D_8006D608[4] = "   ";
char D_8006D60C[4] = "HND";
char D_8006D610[4] = "OVR";
s32 D_8006D614[2] = { 1195461957, 1392517120 };
s32 D_8006D61C[3] = { 1229867605, 1381564448, 0 };
char D_8006D628[4] = "INJ";
char D_8006D62C[8] = "TIME";
s32 D_8006D634[3] = { 1346458451, 4281428, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006D640[3] = { 1346458451, 4411213, 1342177280 }; /* UNRESOLVED: size-only typing */
s32 D_8006D64C[3] = { 1346458451, 5850195, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006D658[3] = { 1346458451, 5522515, 0 }; /* UNRESOLVED: size-only typing */
char D_8006D664[4] = "INT";
s32 D_8006D668 = 536870912;
s32 D_8006D66C[3] = { 1414090053, 1392530241, 1129006080 }; /* UNRESOLVED: size-only typing */
s32 D_8006D678[3] = { 1381323592, 4281428, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006D684[3] = { 1381323592, 5850195, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006D690[3] = { 1381323592, 5522515, 0 }; /* UNRESOLVED: size-only typing */
char D_8006D69C[8] = "FUMBLES";
s32 D_8006D6A4 = 536870912;
char D_8006D6A8[4] = "REC";
s32 D_8006D6AC = 536870912;
char D_8006D6B0[4] = "REC";
char D_8006D6B4[4] = "YDS";
char D_8006D6B8[4] = "REC";
char D_8006D6BC[4] = "TDS";
s32 D_8006D6C0[2] = { 1414220883, 2097152 }; /* UNRESOLVED: size-only typing */
s32 D_8006D6C8[2] = { 1396785995, 1392517120 }; /* UNRESOLVED: size-only typing */
char D_8006D6D0[4] = "INT";
s32 D_8006D6D4 = 536870912;
s32 D_8006D6D8[3] = { 1179995458, 1275085633, 1431520256 }; /* UNRESOLVED: size-only typing */
s32 D_8006D6E4[3] = { 1179995458, 1275089477, 1129272832 }; /* UNRESOLVED: size-only typing */
s32 D_8006D6F0[3] = { 1263092555, 4281428, 0 };
s32 D_8006D6FC[3] = { 1263092555, 5850195, 0 };
s32 D_8006D708[2] = { 1414090835, 2097152 };
s32 D_8006D710[2] = { 1179058241, 1414791168 }; /* UNRESOLVED: size-only typing */
s32 D_8006D718[2] = { 1179058253, 1094993152 }; /* UNRESOLVED: size-only typing */
s32 D_8006D720[3] = { 1280265799, 1398014022, 1191182336 };
char D_8006D72C[4] = "FGS";
char D_8006D730[8] = "BLKD";
s32 D_8006D738[2] = { 1481637953, 1414791168 }; /* UNRESOLVED: size-only typing */
s32 D_8006D740[2] = { 1481637965, 1094993152 }; /* UNRESOLVED: size-only typing */
s32 D_8006D748[2] = { 1481637954, 1280001024 }; /* UNRESOLVED: size-only typing */
s32 D_8006D750[2] = { 1347767892, 1392517120 }; /* UNRESOLVED: size-only typing */
s32 D_8006D758[3] = { 1347767892, 5850195, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006D764[3] = { 1347767892, 1392527694, 540160000 }; /* UNRESOLVED: size-only typing */
s32 D_8006D770[3] = { 1347767892, 1392525900, 1262747648 }; /* UNRESOLVED: size-only typing */
s32 D_8006D77C[3] = { 1263092555, 5391700, 0 }; /* UNRESOLVED: size-only typing */
char D_8006D788[4] = "RET";
char D_8006D78C[4] = "YDS";
char D_8006D790[4] = "TDS";
s32 D_8006D794 = 536870912;
s32 D_8006D798[3] = { 1347767892, 5391700, 0 }; /* UNRESOLVED: size-only typing */
char D_8006D7A4[4] = "RET";
char D_8006D7A8[4] = "YDS";
char D_8006D7AC[4] = "TDS";
s32 D_8006D7B0 = 536870912;
s32 D_8006D7B4[3] = { 1381323592, 4281927, 0 }; /* UNRESOLVED: size-only typing */
char D_8006D7C0[4] = "PCT";
s32 D_8006D7C4 = 536870912;
s32 D_8006D7C8[2] = { 1414090835, 2097152 }; /* UNRESOLVED: size-only typing */
s32 D_8006D7D0 = 536879104;
s32 D_8006D7D4[2] = { 1179468364, 2097152 }; /* UNRESOLVED: size-only typing */
s32 D_8006D7DC[2] = { 1363279954, 1413939200 }; /* UNRESOLVED: size-only typing */
s32 D_8006D7E4[3] = { 1263423299, 1258308687, 1464750848 }; /* UNRESOLVED: size-only typing */
s32 D_8006D7F0[3] = { 1213551186, 4801875, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006D7FC[3] = { 1346458451, 4281927, 0 }; /* UNRESOLVED: size-only typing */
char D_8006D808[4] = "REC";
char D_8006D80C[4] = "AVG";
s32 D_8006D810[3] = { 1347767892, 4281927, 0 }; /* UNRESOLVED: size-only typing */
char D_8006D81C[4] = "RET";
char D_8006D820[4] = "AVG";
s32 D_8006D824[3] = { 1346458451, 5260116, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8006D830[2] = { 1179058256, 1129578496 }; /* UNRESOLVED: size-only typing */
s32 D_8006D838[2] = { 1481637968, 1129578496 }; /* UNRESOLVED: size-only typing */
char D_8006D840[8] = "QB RTG";
char D_8006D848[4] = "ATT";
char D_8006D84C[8] = "COMP";
char D_8006D854[4] = "PCT";
char D_8006D858[8] = "YARDS";
char D_8006D860[4] = "TDS";
char D_8006D864[4] = "INT";
char D_8006D868[8] = "SACKS";
char D_8006D870[8] = "LONG";
char D_8006D878[4] = "AVG";
char D_8006D87C[8] = "FUMB";
char D_8006D884[8] = "RECEPT";
char D_8006D88C[8] = "TACKLE";
char D_8006D894[8] = "HURRY";
char D_8006D89C[8] = "K DNS";
char D_8006D8A4[12] = "PASS TIP";
char D_8006D8B0[12] = "FORCE FUM";
char D_8006D8BC[8] = "FUM REC";
char D_8006D8C4[8] = "MADE";
char D_8006D8CC[8] = "BLOCKED";
char D_8006D8D4[8] = "IN 20";
char D_8006D8DC[8] = "HEADS";
char D_8006D8E4[8] = "TAILS";
char D_8006D8EC[16] = "CAPTAIN CALL IT";
char D_8006D8FC[12] = "IN THE AIR";
char D_8006D908[24] = "CHOOSE KICK OR RECEIVE";
char D_8006D920[16] = "CHOOSE END ZONE";
char D_8006D930[12] = "TO DEFEND";
char D_8006D93C[8] = "KICK";
char D_8006D944[8] = "RECEIVE";
char D_8006D94C[12] = "<< DEFEND";
char D_8006D958[12] = "DEFEND >>";
char D_8006D964[12] = "HEADS IT IS";
char D_8006D970[12] = "TAILS IT IS";
char D_8006D97C[8] = "CHOOSE";
char D_8006D984[28] = "DURING TOSS-- UP/DOWN TO";
char D_8006D9A0[28] = "   CHOOSE HEADS OR TAILS,";
char D_8006D9BC[24] = "   '`' TO LOCK CHOICE.";
char D_8006D9D4[24] = "AFTER TOSS-- UP/DOWN TO";
char D_8006D9EC[24] = "   CHOOSE ADVANTAGE,";
char D_8006DA04[20] = "   '`' TO ACCEPT.";
char D_8006DA18[16] = "INTERCEPTION";
char D_8006DA28[8] = "FUMBLE";
char D_8006DA30[20] = "DEFENSE RECOVERS";
char D_8006DA44[20] = "END OF 1ST QUARTER";
char D_8006DA58[12] = "HALFTIME";
char D_8006DA64[20] = "END OF 3RD QUARTER";
char D_8006DA78[20] = "END OF 4TH QUARTER";
char D_8006DA8C[12] = "END OF GAME";
char D_8006DA98[20] = "END OF OT PERIOD";
char D_8006DAAC[20] = "TWO MINUTE WARNING";
char D_8006DAC0[16] = "MEASURING...";
char D_8006DAD0[12] = "FAIR CATCH";
char D_8006DADC[8] = "AUTO";
void *D_8006DAE4[12] = { &D_8006DA18, &D_8006DA28, &D_8006DA30, &D_8006DA44, &D_8006DA58, &D_8006DA64, &D_8006DA78, &D_8006DA98, &D_8006DA8C, &D_8006DAAC, &D_8006DAC0, &D_8006DAD0 };
char D_8006DB14[12] = " RUNS FOR ";
char D_8006DB20[12] = " RUN FOR ";
char D_8006DB2C[16] = " PASSES FOR ";
char D_8006DB3C[12] = " PASS FOR ";
char D_8006DB48[16] = " PENALTY FOR ";
char D_8006DB58[16] = " PENALTIES FOR ";
char D_8006DB68[8] = " YARD";
char D_8006DB70[8] = " YARDS";
char D_8006DB78[20] = "~F~A RUNS FOR ~C.";
char D_8006DB8C[32] = "~F~A IS STOPPED BY ~D FOR ~C.";
char D_8006DBAC[28] = "~F~A PASSES TO ~D FOR ~C.";
char D_8006DBC8[28] = "~FINCOMPLETE PASS BY ~A.";
char D_8006DBE4[44] = "PASS BY ~A INTENDED FOR ~D IS INCOMPLETE.";
char D_8006DC10[32] = "~F~D IS SACKED BY ~A FOR ~C.";
char D_8006DC30[40] = "~F~A DOWNS THE BALL, RUNNING THE CLOCK.";
char D_8006DC58[36] = "~FKICKOFF RETURNED BY ~D FOR ~C.";
char D_8006DC7C[24] = "~FKICKOFF BY ~A. ~E.";
char D_8006DC94[32] = "~FONSIDE KICK RECOVERED BY ~A.";
char D_8006DCB4[32] = "~FFREE KICK RECOVERED BY ~A.";
char D_8006DCD4[52] = "~FA PUNT OF ~B YARDS BY ~A, RETURNED BY ~D FOR ~C.";
char D_8006DD08[32] = "~FA PUNT OF ~B YARDS BY ~A. ~E.";
char D_8006DD28[28] = "THE EXTRA POINT IS GOOD!";
char D_8006DD44[28] = "THE EXTRA POINT IS NO GOOD!";
char D_8006DD60[28] = "THE EXTRA POINT IS BLOCKED!";
char D_8006DD7C[36] = "~FPUNT BLOCKED! RECOVERED BY ~A.";
char D_8006DDA0[40] = "~FFIELD GOAL BLOCKED! RECOVERED BY ~A.";
char D_8006DDC8[16] = "~FPUNT BLOCKED!";
char D_8006DDD8[24] = "~FFIELD GOAL BLOCKED!";
char D_8006DDF0[48] = "A FIELD GOAL ATTEMPT OF ~B YARDS BY ~A IS ~E";
char D_8006DE20[24] = "~FINTERCEPTION BY ~A.";
char D_8006DE38[32] = "~FFUMBLE BY ~A RECOVERED BY ~D.";
char D_8006DE58[32] = "~FFUMBLE BY ~A. OUT OF BOUNDS.";
char D_8006DE78[40] = "PASS INCOMPLETE! PLAY BROKEN UP BY ~A.";
char D_8006DEA0[32] = "THE TWO POINT CONVERSION IS ~E";
char D_8006DEC0[12] = "TOUCHDOWN! ";
char D_8006DECC[12] = "TOUCHBACK! ";
char D_8006DED8[12] = "TOUCHDOWN";
char D_8006DEE4[12] = "SAFETY! ";
char D_8006DEF0[8] = "SAFETY";
char D_8006DEF8[8] = "EP GOOD";
char D_8006DF00[12] = "EP NO GOOD";
char D_8006DF0C[12] = "EXTRA POINT";
char D_8006DF18[12] = "2 PT GOOD";
char D_8006DF24[20] = "REVERSE TURNOVER";
char D_8006DF38[8] = "REPEAT ";
char D_8006DF40[8] = " DOWN";
char D_8006DF48[20] = "TURNOVER ON DOWNS";
char D_8006DF5C[20] = "RETRY EXTRA POINT";
char D_8006DF70[8] = "KICKOFF";
char D_8006DF78[8] = "DOWNED";
char D_8006DF80[16] = "OUT OF BOUNDS";
char D_8006DF90[8] = " QTR";
char D_8006DF98[12] = "OVERTIME";
char D_8006DFA4[12] = "A LOSS OF ";
char D_8006DFB0[16] = "A SHORT LOSS";
char D_8006DFC0[8] = "NO GAIN";
char D_8006DFC8[16] = "A SHORT GAIN";
char D_8006DFD8[12] = "A GAIN OF ";
char D_8006DFE4[8] = " YARDS";
char D_8006DFEC[12] = "NO GOOD!";
char D_8006DFF8[8] = "GOOD!";
char D_8006E000[8] = " AND ";
char D_8006E008[8] = "INCHES";
char D_8006E010[8] = "GOAL";
char D_8006E018[4] = "ST";
char D_8006E01C[4] = "ND";
char D_8006E020[4] = "RD";
char D_8006E024[4] = "TH";
char D_8006E028[20] = "PASS INTERFERENCE";
char D_8006E03C[12] = "CLIPPING";
char D_8006E048[20] = "5 YARD FACE MASKING";
char D_8006E05C[24] = "15 YARD FACE MASKING";
char D_8006E074[12] = "FALSE START";
char D_8006E080[8] = "HOLDING";
char D_8006E088[16] = "PERSONAL FOUL";
char D_8006E098[20] = "ROUGHING THE KICKER";
char D_8006E0AC[24] = "RUNNING INTO THE KICKER";
char D_8006E0C4[20] = "ROUGHING THE PASSER";
char D_8006E0D8[24] = "INTENTIONAL GROUNDING";
char D_8006E0F0[16] = "DELAY OF GAME";
char D_8006E100[12] = "OFFSIDES";
char D_8006E10C[16] = "ENCROACHMENT";
char D_8006E11C[24] = "FAIR CATCH INTERERENCE";
char D_8006E134[28] = "PUNT RETURN INTERFERENCE";
char D_8006E150[20] = "ILLEGAL PROCEDURE";
char D_8006E164[8] = "#~B ~C";
char D_8006E16C[24] = "~F~A ON #~B ~C WAS ~D.";
char D_8006E184[16] = "~F~A ON #~B ~C.";
char D_8006E194[12] = "ACCEPTED";
char D_8006E1A0[12] = "DECLINED";
char D_8006E1AC[60] = "THE PENALTY WAS ACCEPTED NULLIFYING THE RESULT OF THE PLAY.";
char D_8006E1E8[36] = "~A CALL A TIMEOUT. ~B REMAINING.";
char D_8006E20C[36] = "~A CALLS A TIMEOUT. ~B REMAINING.";
char D_8006E230[56] = "INJURY TIMEOUT:|~A ASSESSED A TIMEOUT. ~B REMAINING.";
char D_8006E268[16] = "FIRST DOWN! ";
char D_8006E278[32] = "~A HAS BEEN SUBSTITUTED FOR ~B.";
char D_8006E298[8] = "ANKLE";
char D_8006E2A0[4] = "ARM";
char D_8006E2A4[8] = "BACK";
char D_8006E2AC[8] = "ELBOW";
char D_8006E2B4[8] = "FOOT";
char D_8006E2BC[8] = "HAND";
char D_8006E2C4[4] = "HIP";
char D_8006E2C8[8] = "KNEE";
char D_8006E2D0[4] = "LEG";
char D_8006E2D4[8] = "RIBS";
char D_8006E2DC[12] = "SHOULDER";
char D_8006E2E8[16] = "INJURY REPORT:|";
char D_8006E2F8[36] = "~C~A SEEMS TO BE FAVORING HIS ~B.";
char D_8006E31C[48] = "~C~A APPEARED TO CLUTCH HIS ~B AS HE WENT DOWN.";
char D_8006E34C[52] = "~C~A WENT DOWN HARD AND MAY HAVE INJURED HIS ~B.";
char D_8006E380[52] = "~C~A MAY HAVE AGGRAVATED A PAST INJURY TO HIS ~B.";
char D_8006E3B4[40] = "~C~A MAY HAVE SERIOUSLY INJURED HIS ~B.";
char D_8006E3DC[48] = "~C~A APPEARS TO HAVE SERIOUSLY INJURED HIS ~B.";
char D_8006E40C[16] = "LOOKING AT HIS ";
char D_8006E41C[16] = "EXAMINING HIS ";
char D_8006E42C[16] = "X-RAYING HIS ";
char D_8006E43C[4] = "TBA";
void *D_8006E440[6] = { &D_8006E2F8, &D_8006E31C, &D_8006E34C, &D_8006E380, &D_8006E3B4, &D_8006E3DC };
void *D_8006E458[6] = { &D_8006E40C, &D_8006E41C, &D_8006E41C, &D_8006E41C, &D_8006E42C, &D_8006E42C };
char D_8006E470[24] = "ACHILLES TENDON STRAIN";
char D_8006E488[16] = "BROKEN ANKLE";
char D_8006E498[16] = "ANKLE BRUISE";
char D_8006E4A8[20] = "DISLOCATED ANKLE";
char D_8006E4BC[16] = "ANKLE SPRAIN";
char D_8006E4CC[16] = "ANKLE STRAIN";
char D_8006E4DC[12] = "ARM BRUISE";
char D_8006E4E8[16] = "ARM FRACTURE";
char D_8006E4F8[20] = "UPPER ARM FRACTURE";
char D_8006E50C[16] = "STRAINED BICEP";
char D_8006E51C[12] = "TORN BICEP";
char D_8006E528[16] = "FOREARM STRAIN";
char D_8006E538[16] = "STRAINED TRICEP";
char D_8006E548[16] = "ELBOW BURSITIS";
char D_8006E558[16] = "BRUISED ELBOW";
char D_8006E568[20] = "DISLOCATED ELBOW";
char D_8006E57C[16] = "ELBOW FRACTURE";
char D_8006E58C[16] = "ELBOW SPRAIN";
char D_8006E59C[20] = "DISLOCATED FINGER";
char D_8006E5B0[16] = "BROKEN FINGER";
char D_8006E5C0[12] = "HAND BRUISE";
char D_8006E5CC[16] = "DISLOCATED HAND";
char D_8006E5DC[16] = "HAND FRACTURE";
char D_8006E5EC[16] = "BROKEN THUMB";
char D_8006E5FC[20] = "DISLOCATED WRIST";
char D_8006E610[16] = "WRIST SPRAIN";
char D_8006E620[16] = "KNEE BURSITIS";
char D_8006E630[20] = "KNEE CARTILAGE TEAR";
char D_8006E644[12] = "KNEE BRUISE";
char D_8006E650[16] = "DISLOCATED KNEE";
char D_8006E660[12] = "KNEE STRAIN";
char D_8006E66C[20] = "KNEECAP DISLOCATION";
char D_8006E680[20] = "KNEECAP FRACTURE";
char D_8006E694[12] = "ACL SPRAIN";
char D_8006E6A0[12] = "ACL TEAR";
char D_8006E6AC[12] = "MCL SPRAIN";
char D_8006E6B8[12] = "MCL TEAR";
char D_8006E6C4[12] = "PCL SPRAIN";
char D_8006E6D0[12] = "PCL TEAR";
char D_8006E6DC[16] = "LEG FRACTURE";
char D_8006E6EC[12] = "LEG SPRAIN";
char D_8006E6F8[12] = "CALF STRAIN";
char D_8006E704[16] = "THIGH FRACTURE";
char D_8006E714[16] = "THIGH BRUISE";
char D_8006E724[16] = "HAMSTRING PULL";
char D_8006E734[16] = "HAMSTRING TEAR";
char D_8006E744[16] = "RIB DISLOCATION";
char D_8006E754[16] = "RIB FRACTURE";
char D_8006E764[12] = "RIB SPRAIN";
char D_8006E770[16] = "BRUISED STERNUM";
char D_8006E780[20] = "ABDOMINAL STRAIN";
char D_8006E794[16] = "BRUISED RIBS";
char D_8006E7A4[20] = "WIND KNOCKED OUT";
char D_8006E7B8[16] = "HIP BURSITIS";
char D_8006E7C8[16] = "HIP DISLOCATION";
char D_8006E7D8[16] = "HIP FRACTURE";
char D_8006E7E8[12] = "HIP POINTER";
char D_8006E7F4[16] = "FOOT CONTUSION";
char D_8006E804[12] = "FOOT SPRAIN";
char D_8006E810[16] = "DISLOCATED FOOT";
char D_8006E820[16] = "FOOT FRACTURE";
char D_8006E830[24] = "FOOT STRESS FRACTURE";
char D_8006E848[16] = "RUPTURED DISK";
char D_8006E858[12] = "BACK SPASMS";
char D_8006E864[12] = "BACK SPRAIN";
char D_8006E870[12] = "BACK STRAIN";
char D_8006E87C[20] = "BROKEN COLLARBONE";
char D_8006E890[16] = "SHOULDER BRUISE";
char D_8006E8A0[24] = "SHOULDER DISLOCATION";
char D_8006E8B8[16] = "SHOULDER SPRAIN";
char D_8006E8C8[16] = "SHOULDER STRAIN";
char D_8006E8D8[24] = "SHOULDER BLADE BRUISE";
char D_8006E8F0[24] = "SHOULDER BLADE FRACTURE";
char D_8006E908[12] = " QUARTERS";
char D_8006E914[8] = " WEEKS";
char D_8006E91C[8] = "SEASON";
char D_8006E924[16] = "LONGEST PASS";
char D_8006E934[16] = "LONGEST RUSH";
char D_8006E944[12] = "LONGEST FG";
char D_8006E950[16] = "LONGEST PUNT";
char D_8006E960[20] = "LONGEST PUNT RET";
char D_8006E974[20] = "LONGEST KICK RET";
char D_8006E988[16] = "MOST PASS YDS";
char D_8006E998[16] = "MOST RUSH YDS";
char D_8006E9A8[16] = "MOST REC YDS";
char D_8006E9B8[12] = "MOST INTS";
char D_8006E9C4[12] = "MOST SACKS";
char D_8006E9D0[12] = "MOST FGS";
char D_8006E9DC[16] = "MOST TACKLES";
char D_8006E9EC[16] = "HIGHEST QB RTG";
void *D_8006E9FC[22] = { &D_8006E924, &D_8006E934, &D_8006E944, &D_8006E950, &D_8006E960, &D_8006E974, &D_8006E988, &D_8006E998, &D_8006E9A8, &D_8006E9B8, &D_8006E9C4, &D_8006E9D0, &D_8006E9DC, &D_8006E9EC, &D_8006E9EC, &D_8006E9EC, &D_8006E9EC, &D_8006E9EC, &D_8006E9EC, &D_8006E9EC, &D_8006E9EC, &D_8006E9EC };
char D_8006EA54[8] = "SOUND";
char D_8006EA5C[8] = "TEST";
char D_8006EA64[12] = "SOUND TEST";
struct D_8006EA70_s { u8 f_8006ea70; u8 f_8006ea71[3]; } D_8006EA70 = { 0, { 0, 0, 0 } }; /* members: D_8006EA70, D_8006EA71 */
s32 D_8006EA74 = 0;
s32 D_8006EA78 = 0;
s32 D_8006EA7C[7] = { 5, 6, 3, 4, 0, 1, 2 };
struct D_8006EA98_s { u8 f_8006ea98[3]; u8 f_8006ea9b[25]; } D_8006EA98 = { { 0, 0, 0 }, { 14, 0, 0, 0, 15, 0, 0, 0, 11, 0, 0, 0, 12, 0, 0, 0, 7, 0, 0, 0, 8, 0, 0, 0, 9 } }; /* members: D_8006EA98, D_8006EA9B */
s32 D_8006EAB4[3] = { 65537, 65536, 0 };
s16 D_8006EAC0[1024] = { 0, 50, 100, 150, 201, 251, 301, 352, 402, 452, 503, 553, 603, 654, 704, 754, 804, 855, 905, 955, 1006, 1056, 1106, 1156, 1207, 1257, 1307, 1358, 1408, 1458, 1508, 1559, 1609, 1659, 1709, 1760, 1810, 1860, 1910, 1961, 2011, 2061, 2111, 2161, 2212, 2262, 2312, 2362, 2412, 2463, 2513, 2563, 2613, 2663, 2713, 2763, 2814, 2864, 2914, 2964, 3014, 3064, 3114, 3164, 3214, 3264, 3314, 3365, 3415, 3465, 3515, 3565, 3615, 3665, 3715, 3765, 3815, 3865, 3915, 3964, 4014, 4064, 4114, 4164, 4214, 4264, 4314, 4364, 4414, 4463, 4513, 4563, 4613, 4663, 4713, 4762, 4812, 4862, 4912, 4961, 5011, 5061, 5110, 5160, 5210, 5260, 5309, 5359, 5408, 5458, 5508, 5557, 5607, 5656, 5706, 5755, 5805, 5855, 5904, 5953, 6003, 6052, 6102, 6151, 6201, 6250, 6299, 6349, 6398, 6448, 6497, 6546, 6595, 6645, 6694, 6743, 6792, 6842, 6891, 6940, 6989, 7038, 7087, 7137, 7186, 7235, 7284, 7333, 7382, 7431, 7480, 7529, 7578, 7627, 7676, 7725, 7773, 7822, 7871, 7920, 7969, 8018, 8066, 8115, 8164, 8213, 8261, 8310, 8359, 8407, 8456, 8505, 8553, 8602, 8650, 8699, 8747, 8796, 8844, 8893, 8941, 8989, 9038, 9086, 9134, 9183, 9231, 9279, 9328, 9376, 9424, 9472, 9520, 9568, 9617, 9665, 9713, 9761, 9809, 9857, 9905, 9953, 10001, 10048, 10096, 10144, 10192, 10240, 10288, 10335, 10383, 10431, 10478, 10526, 10574, 10621, 10669, 10717, 10764, 10812, 10859, 10907, 10954, 11001, 11049, 11096, 11143, 11191, 11238, 11285, 11332, 11380, 11427, 11474, 11521, 11568, 11615, 11662, 11709, 11756, 11803, 11850, 11897, 11944, 11991, 12038, 12084, 12131, 12178, 12224, 12271, 12318, 12364, 12411, 12457, 12504, 12551, 12597, 12643, 12690, 12736, 12783, 12829, 12875, 12921, 12968, 13014, 13060, 13106, 13152, 13198, 13244, 13290, 13336, 13382, 13428, 13474, 13520, 13566, 13611, 13657, 13703, 13749, 13794, 13840, 13885, 13931, 13976, 14022, 14067, 14113, 14158, 14204, 14249, 14294, 14339, 14385, 14430, 14475, 14520, 14565, 14610, 14655, 14700, 14745, 14790, 14835, 14880, 14925, 14969, 15014, 15059, 15104, 15148, 15193, 15237, 15282, 15326, 15371, 15415, 15460, 15504, 15548, 15593, 15637, 15681, 15725, 15769, 15813, 15857, 15901, 15945, 15989, 16033, 16077, 16121, 16165, 16208, 16252, 16296, 16339, 16383, 16427, 16470, 16514, 16557, 16600, 16644, 16687, 16730, 16774, 16817, 16860, 16903, 16946, 16989, 17032, 17075, 17118, 17161, 17204, 17247, 17289, 17332, 17375, 17417, 17460, 17503, 17545, 17588, 17630, 17672, 17715, 17757, 17799, 17841, 17884, 17926, 17968, 18010, 18052, 18094, 18136, 18178, 18220, 18261, 18303, 18345, 18386, 18428, 18470, 18511, 18553, 18594, 18636, 18677, 18718, 18760, 18801, 18842, 18883, 18924, 18965, 19006, 19047, 19088, 19129, 19170, 19211, 19251, 19292, 19333, 19373, 19414, 19454, 19495, 19535, 19576, 19616, 19656, 19696, 19737, 19777, 19817, 19857, 19897, 19937, 19977, 20017, 20056, 20096, 20136, 20176, 20215, 20255, 20294, 20334, 20373, 20413, 20452, 20491, 20530, 20570, 20609, 20648, 20687, 20726, 20765, 20804, 20843, 20881, 20920, 20959, 20997, 21036, 21075, 21113, 21152, 21190, 21228, 21267, 21305, 21343, 21381, 21419, 21457, 21495, 21533, 21571, 21609, 21647, 21685, 21722, 21760, 21797, 21835, 21873, 21910, 21947, 21985, 22022, 22059, 22096, 22133, 22171, 22208, 22245, 22281, 22318, 22355, 22392, 22429, 22465, 22502, 22538, 22575, 22611, 22648, 22684, 22720, 22757, 22793, 22829, 22865, 22901, 22937, 22973, 23009, 23044, 23080, 23116, 23151, 23187, 23223, 23258, 23293, 23329, 23364, 23399, 23435, 23470, 23505, 23540, 23575, 23610, 23645, 23679, 23714, 23749, 23783, 23818, 23853, 23887, 23921, 23956, 23990, 24024, 24058, 24093, 24127, 24161, 24195, 24229, 24262, 24296, 24330, 24364, 24397, 24431, 24464, 24498, 24531, 24564, 24598, 24631, 24664, 24697, 24730, 24763, 24796, 24829, 24862, 24894, 24927, 24960, 24992, 25025, 25057, 25090, 25122, 25154, 25187, 25219, 25251, 25283, 25315, 25347, 25379, 25410, 25442, 25474, 25505, 25537, 25568, 25600, 25631, 25663, 25694, 25725, 25756, 25787, 25818, 25849, 25880, 25911, 25942, 25972, 26003, 26034, 26064, 26095, 26125, 26155, 26186, 26216, 26246, 26276, 26306, 26336, 26366, 26396, 26426, 26455, 26485, 26514, 26544, 26573, 26603, 26632, 26661, 26691, 26720, 26749, 26778, 26807, 26836, 26865, 26893, 26922, 26951, 26979, 27008, 27036, 27065, 27093, 27121, 27150, 27178, 27206, 27234, 27262, 27290, 27317, 27345, 27373, 27400, 27428, 27456, 27483, 27510, 27538, 27565, 27592, 27619, 27646, 27673, 27700, 27727, 27754, 27780, 27807, 27834, 27860, 27887, 27913, 27939, 27966, 27992, 28018, 28044, 28070, 28096, 28122, 28147, 28173, 28199, 28224, 28250, 28275, 28301, 28326, 28351, 28377, 28402, 28427, 28452, 28477, 28501, 28526, 28551, 28576, 28600, 28625, 28649, 28674, 28698, 28722, 28746, 28770, 28794, 28818, 28842, 28866, 28890, 28914, 28937, 28961, 28984, 29008, 29031, 29054, 29078, 29101, 29124, 29147, 29170, 29193, 29216, 29238, 29261, 29284, 29306, 29329, 29351, 29373, 29396, 29418, 29440, 29462, 29484, 29506, 29528, 29550, 29571, 29593, 29614, 29636, 29657, 29679, 29700, 29721, 29742, 29763, 29784, 29805, 29826, 29847, 29868, 29888, 29909, 29930, 29950, 29970, 29991, 30011, 30031, 30051, 30071, 30091, 30111, 30131, 30151, 30170, 30190, 30209, 30229, 30248, 30267, 30287, 30306, 30325, 30344, 30363, 30382, 30401, 30419, 30438, 30457, 30475, 30494, 30512, 30530, 30548, 30567, 30585, 30603, 30621, 30639, 30656, 30674, 30692, 30709, 30727, 30744, 30762, 30779, 30796, 30813, 30830, 30847, 30864, 30881, 30898, 30915, 30931, 30948, 30964, 30981, 30997, 31013, 31030, 31046, 31062, 31078, 31094, 31109, 31125, 31141, 31157, 31172, 31188, 31203, 31218, 31234, 31249, 31264, 31279, 31294, 31309, 31323, 31338, 31353, 31367, 31382, 31396, 31411, 31425, 31439, 31453, 31467, 31481, 31495, 31509, 31523, 31537, 31550, 31564, 31577, 31591, 31604, 31617, 31630, 31643, 31656, 31669, 31682, 31695, 31708, 31720, 31733, 31746, 31758, 31770, 31783, 31795, 31807, 31819, 31831, 31843, 31855, 31866, 31878, 31890, 31901, 31913, 31924, 31935, 31947, 31958, 31969, 31980, 31991, 32002, 32012, 32023, 32034, 32044, 32055, 32065, 32075, 32086, 32096, 32106, 32116, 32126, 32136, 32145, 32155, 32165, 32174, 32184, 32193, 32203, 32212, 32221, 32230, 32239, 32248, 32257, 32266, 32275, 32283, 32292, 32300, 32309, 32317, 32325, 32333, 32342, 32350, 32358, 32365, 32373, 32381, 32389, 32396, 32404, 32411, 32419, 32426, 32433, 32440, 32447, 32454, 32461, 32468, 32475, 32481, 32488, 32494, 32501, 32507, 32513, 32520, 32526, 32532, 32538, 32544, 32549, 32555, 32561, 32566, 32572, 32577, 32583, 32588, 32593, 32598, 32603, 32608, 32613, 32618, 32623, 32628, 32632, 32637, 32641, 32645, 32650, 32654, 32658, 32662, 32666, 32670, 32674, 32678, 32681, 32685, 32688, 32692, 32695, 32698, 32702, 32705, 32708, 32711, 32714, 32716, 32719, 32722, 32724, 32727, 32729, 32732, 32734, 32736, 32738, 32740, 32742, 32744, 32746, 32748, 32749, 32751, 32753, 32754, 32755, 32757, 32758, 32759, 32760, 32761, 32762, 32763, 32763, 32764, 32765, 32765, 32766, 32766, 32766, 32766, 32766, 32767 };
/* atan(i / 4096.0), in signed angle units where a quarter turn is 8192. */
struct AtanAndRuntimeState {
    s16 atan[4097];
    u8 alignment[6];
    s32 transition_state; /* D_800712C8 */
    u8 transition_work[44];
    s32 indexed_values[3]; /* D_800712F8 */
    s32 current_index;     /* D_80071304 */
    s32 busy;              /* D_80071308 */
    s16 short_state[2];    /* D_8007130C */
    s32 runtime_offset[2]; /* D_80071310 */
} D_8006F2C0 = {
    { 0, 3, 6, 8, 11, 13, 16, 18, 21, 23, 26, 29, 31, 34, 36, 39, 41, 44, 46, 49, 51, 54, 57, 59, 62, 64, 67, 69, 72, 74, 77, 79, 82, 85, 87, 90, 92, 95, 97, 100, 102, 105, 107, 110, 113, 115, 118, 120, 123, 125, 128, 130, 133, 135, 138, 141, 143, 146, 148, 151, 153, 156, 158, 161, 163, 166, 169, 171, 174, 176, 179, 181, 184, 186, 189, 191, 194, 197, 199, 202, 204, 207, 209, 212, 214, 217, 219, 222, 225, 227, 230, 232, 235, 237, 240, 242, 245, 247, 250, 253, 255, 258, 260, 263, 265, 268, 270, 273, 275, 278, 281, 283, 286, 288, 291, 293, 296, 298, 301, 303, 306, 309, 311, 314, 316, 319, 321, 324, 326, 329, 331, 334, 337, 339, 342, 344, 347, 349, 352, 354, 357, 359, 362, 364, 367, 370, 372, 375, 377, 380, 382, 385, 387, 390, 392, 395, 398, 400, 403, 405, 408, 410, 413, 415, 418, 420, 423, 426, 428, 431, 433, 436, 438, 441, 443, 446, 448, 451, 453, 456, 459, 461, 464, 466, 469, 471, 474, 476, 479, 481, 484, 487, 489, 492, 494, 497, 499, 502, 504, 507, 509, 512, 514, 517, 520, 522, 525, 527, 530, 532, 535, 537, 540, 542, 545, 547, 550, 553, 555, 558, 560, 563, 565, 568, 570, 573, 575, 578, 580, 583, 586, 588, 591, 593, 596, 598, 601, 603, 606, 608, 611, 613, 616, 619, 621, 624, 626, 629, 631, 634, 636, 639, 641, 644, 646, 649, 652, 654, 657, 659, 662, 664, 667, 669, 672, 674, 677, 679, 682, 685, 687, 690, 692, 695, 697, 700, 702, 705, 707, 710, 712, 715, 717, 720, 723, 725, 728, 730, 733, 735, 738, 740, 743, 745, 748, 750, 753, 755, 758, 761, 763, 766, 768, 771, 773, 776, 778, 781, 783, 786, 788, 791, 793, 796, 799, 801, 804, 806, 809, 811, 814, 816, 819, 821, 824, 826, 829, 831, 834, 836, 839, 842, 844, 847, 849, 852, 854, 857, 859, 862, 864, 867, 869, 872, 874, 877, 879, 882, 885, 887, 890, 892, 895, 897, 900, 902, 905, 907, 910, 912, 915, 917, 920, 922, 925, 928, 930, 933, 935, 938, 940, 943, 945, 948, 950, 953, 955, 958, 960, 963, 965, 968, 970, 973, 975, 978, 981, 983, 986, 988, 991, 993, 996, 998, 1001, 1003, 1006, 1008, 1011, 1013, 1016, 1018, 1021, 1023, 1026, 1028, 1031, 1034, 1036, 1039, 1041, 1044, 1046, 1049, 1051, 1054, 1056, 1059, 1061, 1064, 1066, 1069, 1071, 1074, 1076, 1079, 1081, 1084, 1086, 1089, 1091, 1094, 1097, 1099, 1102, 1104, 1107, 1109, 1112, 1114, 1117, 1119, 1122, 1124, 1127, 1129, 1132, 1134, 1137, 1139, 1142, 1144, 1147, 1149, 1152, 1154, 1157, 1159, 1162, 1164, 1167, 1170, 1172, 1175, 1177, 1180, 1182, 1185, 1187, 1190, 1192, 1195, 1197, 1200, 1202, 1205, 1207, 1210, 1212, 1215, 1217, 1220, 1222, 1225, 1227, 1230, 1232, 1235, 1237, 1240, 1242, 1245, 1247, 1250, 1252, 1255, 1257, 1260, 1262, 1265, 1267, 1270, 1272, 1275, 1278, 1280, 1283, 1285, 1288, 1290, 1293, 1295, 1298, 1300, 1303, 1305, 1308, 1310, 1313, 1315, 1318, 1320, 1323, 1325, 1328, 1330, 1333, 1335, 1338, 1340, 1343, 1345, 1348, 1350, 1353, 1355, 1358, 1360, 1363, 1365, 1368, 1370, 1373, 1375, 1378, 1380, 1383, 1385, 1388, 1390, 1393, 1395, 1398, 1400, 1403, 1405, 1408, 1410, 1413, 1415, 1418, 1420, 1423, 1425, 1428, 1430, 1433, 1435, 1438, 1440, 1443, 1445, 1448, 1450, 1453, 1455, 1458, 1460, 1463, 1465, 1468, 1470, 1473, 1475, 1478, 1480, 1483, 1485, 1488, 1490, 1493, 1495, 1498, 1500, 1503, 1505, 1508, 1510, 1513, 1515, 1518, 1520, 1523, 1525, 1528, 1530, 1533, 1535, 1538, 1540, 1543, 1545, 1548, 1550, 1552, 1555, 1557, 1560, 1562, 1565, 1567, 1570, 1572, 1575, 1577, 1580, 1582, 1585, 1587, 1590, 1592, 1595, 1597, 1600, 1602, 1605, 1607, 1610, 1612, 1615, 1617, 1620, 1622, 1625, 1627, 1630, 1632, 1635, 1637, 1640, 1642, 1645, 1647, 1649, 1652, 1654, 1657, 1659, 1662, 1664, 1667, 1669, 1672, 1674, 1677, 1679, 1682, 1684, 1687, 1689, 1692, 1694, 1697, 1699, 1702, 1704, 1707, 1709, 1711, 1714, 1716, 1719, 1721, 1724, 1726, 1729, 1731, 1734, 1736, 1739, 1741, 1744, 1746, 1749, 1751, 1754, 1756, 1759, 1761, 1764, 1766, 1768, 1771, 1773, 1776, 1778, 1781, 1783, 1786, 1788, 1791, 1793, 1796, 1798, 1801, 1803, 1806, 1808, 1810, 1813, 1815, 1818, 1820, 1823, 1825, 1828, 1830, 1833, 1835, 1838, 1840, 1843, 1845, 1848, 1850, 1852, 1855, 1857, 1860, 1862, 1865, 1867, 1870, 1872, 1875, 1877, 1880, 1882, 1885, 1887, 1889, 1892, 1894, 1897, 1899, 1902, 1904, 1907, 1909, 1912, 1914, 1917, 1919, 1921, 1924, 1926, 1929, 1931, 1934, 1936, 1939, 1941, 1944, 1946, 1949, 1951, 1953, 1956, 1958, 1961, 1963, 1966, 1968, 1971, 1973, 1976, 1978, 1980, 1983, 1985, 1988, 1990, 1993, 1995, 1998, 2000, 2003, 2005, 2007, 2010, 2012, 2015, 2017, 2020, 2022, 2025, 2027, 2030, 2032, 2034, 2037, 2039, 2042, 2044, 2047, 2049, 2052, 2054, 2056, 2059, 2061, 2064, 2066, 2069, 2071, 2074, 2076, 2079, 2081, 2083, 2086, 2088, 2091, 2093, 2096, 2098, 2101, 2103, 2105, 2108, 2110, 2113, 2115, 2118, 2120, 2123, 2125, 2127, 2130, 2132, 2135, 2137, 2140, 2142, 2144, 2147, 2149, 2152, 2154, 2157, 2159, 2162, 2164, 2166, 2169, 2171, 2174, 2176, 2179, 2181, 2183, 2186, 2188, 2191, 2193, 2196, 2198, 2201, 2203, 2205, 2208, 2210, 2213, 2215, 2218, 2220, 2222, 2225, 2227, 2230, 2232, 2235, 2237, 2239, 2242, 2244, 2247, 2249, 2252, 2254, 2256, 2259, 2261, 2264, 2266, 2269, 2271, 2273, 2276, 2278, 2281, 2283, 2286, 2288, 2290, 2293, 2295, 2298, 2300, 2303, 2305, 2307, 2310, 2312, 2315, 2317, 2320, 2322, 2324, 2327, 2329, 2332, 2334, 2337, 2339, 2341, 2344, 2346, 2349, 2351, 2353, 2356, 2358, 2361, 2363, 2366, 2368, 2370, 2373, 2375, 2378, 2380, 2382, 2385, 2387, 2390, 2392, 2395, 2397, 2399, 2402, 2404, 2407, 2409, 2411, 2414, 2416, 2419, 2421, 2423, 2426, 2428, 2431, 2433, 2436, 2438, 2440, 2443, 2445, 2448, 2450, 2452, 2455, 2457, 2460, 2462, 2464, 2467, 2469, 2472, 2474, 2476, 2479, 2481, 2484, 2486, 2489, 2491, 2493, 2496, 2498, 2501, 2503, 2505, 2508, 2510, 2513, 2515, 2517, 2520, 2522, 2525, 2527, 2529, 2532, 2534, 2537, 2539, 2541, 2544, 2546, 2549, 2551, 2553, 2556, 2558, 2561, 2563, 2565, 2568, 2570, 2572, 2575, 2577, 2580, 2582, 2584, 2587, 2589, 2592, 2594, 2596, 2599, 2601, 2604, 2606, 2608, 2611, 2613, 2616, 2618, 2620, 2623, 2625, 2627, 2630, 2632, 2635, 2637, 2639, 2642, 2644, 2647, 2649, 2651, 2654, 2656, 2659, 2661, 2663, 2666, 2668, 2670, 2673, 2675, 2678, 2680, 2682, 2685, 2687, 2689, 2692, 2694, 2697, 2699, 2701, 2704, 2706, 2709, 2711, 2713, 2716, 2718, 2720, 2723, 2725, 2728, 2730, 2732, 2735, 2737, 2739, 2742, 2744, 2747, 2749, 2751, 2754, 2756, 2758, 2761, 2763, 2766, 2768, 2770, 2773, 2775, 2777, 2780, 2782, 2785, 2787, 2789, 2792, 2794, 2796, 2799, 2801, 2803, 2806, 2808, 2811, 2813, 2815, 2818, 2820, 2822, 2825, 2827, 2829, 2832, 2834, 2837, 2839, 2841, 2844, 2846, 2848, 2851, 2853, 2855, 2858, 2860, 2863, 2865, 2867, 2870, 2872, 2874, 2877, 2879, 2881, 2884, 2886, 2888, 2891, 2893, 2896, 2898, 2900, 2903, 2905, 2907, 2910, 2912, 2914, 2917, 2919, 2921, 2924, 2926, 2928, 2931, 2933, 2936, 2938, 2940, 2943, 2945, 2947, 2950, 2952, 2954, 2957, 2959, 2961, 2964, 2966, 2968, 2971, 2973, 2975, 2978, 2980, 2982, 2985, 2987, 2990, 2992, 2994, 2997, 2999, 3001, 3004, 3006, 3008, 3011, 3013, 3015, 3018, 3020, 3022, 3025, 3027, 3029, 3032, 3034, 3036, 3039, 3041, 3043, 3046, 3048, 3050, 3053, 3055, 3057, 3060, 3062, 3064, 3067, 3069, 3071, 3074, 3076, 3078, 3081, 3083, 3085, 3088, 3090, 3092, 3095, 3097, 3099, 3102, 3104, 3106, 3109, 3111, 3113, 3116, 3118, 3120, 3123, 3125, 3127, 3130, 3132, 3134, 3136, 3139, 3141, 3143, 3146, 3148, 3150, 3153, 3155, 3157, 3160, 3162, 3164, 3167, 3169, 3171, 3174, 3176, 3178, 3181, 3183, 3185, 3188, 3190, 3192, 3194, 3197, 3199, 3201, 3204, 3206, 3208, 3211, 3213, 3215, 3218, 3220, 3222, 3225, 3227, 3229, 3231, 3234, 3236, 3238, 3241, 3243, 3245, 3248, 3250, 3252, 3255, 3257, 3259, 3261, 3264, 3266, 3268, 3271, 3273, 3275, 3278, 3280, 3282, 3285, 3287, 3289, 3291, 3294, 3296, 3298, 3301, 3303, 3305, 3308, 3310, 3312, 3314, 3317, 3319, 3321, 3324, 3326, 3328, 3330, 3333, 3335, 3337, 3340, 3342, 3344, 3347, 3349, 3351, 3353, 3356, 3358, 3360, 3363, 3365, 3367, 3369, 3372, 3374, 3376, 3379, 3381, 3383, 3385, 3388, 3390, 3392, 3395, 3397, 3399, 3401, 3404, 3406, 3408, 3411, 3413, 3415, 3417, 3420, 3422, 3424, 3427, 3429, 3431, 3433, 3436, 3438, 3440, 3443, 3445, 3447, 3449, 3452, 3454, 3456, 3459, 3461, 3463, 3465, 3468, 3470, 3472, 3474, 3477, 3479, 3481, 3484, 3486, 3488, 3490, 3493, 3495, 3497, 3499, 3502, 3504, 3506, 3509, 3511, 3513, 3515, 3518, 3520, 3522, 3524, 3527, 3529, 3531, 3533, 3536, 3538, 3540, 3543, 3545, 3547, 3549, 3552, 3554, 3556, 3558, 3561, 3563, 3565, 3567, 3570, 3572, 3574, 3576, 3579, 3581, 3583, 3585, 3588, 3590, 3592, 3594, 3597, 3599, 3601, 3604, 3606, 3608, 3610, 3613, 3615, 3617, 3619, 3622, 3624, 3626, 3628, 3631, 3633, 3635, 3637, 3640, 3642, 3644, 3646, 3649, 3651, 3653, 3655, 3658, 3660, 3662, 3664, 3667, 3669, 3671, 3673, 3675, 3678, 3680, 3682, 3684, 3687, 3689, 3691, 3693, 3696, 3698, 3700, 3702, 3705, 3707, 3709, 3711, 3714, 3716, 3718, 3720, 3723, 3725, 3727, 3729, 3731, 3734, 3736, 3738, 3740, 3743, 3745, 3747, 3749, 3752, 3754, 3756, 3758, 3760, 3763, 3765, 3767, 3769, 3772, 3774, 3776, 3778, 3781, 3783, 3785, 3787, 3789, 3792, 3794, 3796, 3798, 3801, 3803, 3805, 3807, 3809, 3812, 3814, 3816, 3818, 3821, 3823, 3825, 3827, 3829, 3832, 3834, 3836, 3838, 3840, 3843, 3845, 3847, 3849, 3852, 3854, 3856, 3858, 3860, 3863, 3865, 3867, 3869, 3871, 3874, 3876, 3878, 3880, 3883, 3885, 3887, 3889, 3891, 3894, 3896, 3898, 3900, 3902, 3905, 3907, 3909, 3911, 3913, 3916, 3918, 3920, 3922, 3924, 3927, 3929, 3931, 3933, 3935, 3938, 3940, 3942, 3944, 3946, 3949, 3951, 3953, 3955, 3957, 3960, 3962, 3964, 3966, 3968, 3971, 3973, 3975, 3977, 3979, 3982, 3984, 3986, 3988, 3990, 3993, 3995, 3997, 3999, 4001, 4004, 4006, 4008, 4010, 4012, 4014, 4017, 4019, 4021, 4023, 4025, 4028, 4030, 4032, 4034, 4036, 4039, 4041, 4043, 4045, 4047, 4049, 4052, 4054, 4056, 4058, 4060, 4063, 4065, 4067, 4069, 4071, 4073, 4076, 4078, 4080, 4082, 4084, 4086, 4089, 4091, 4093, 4095, 4097, 4100, 4102, 4104, 4106, 4108, 4110, 4113, 4115, 4117, 4119, 4121, 4123, 4126, 4128, 4130, 4132, 4134, 4136, 4139, 4141, 4143, 4145, 4147, 4149, 4152, 4154, 4156, 4158, 4160, 4162, 4165, 4167, 4169, 4171, 4173, 4175, 4177, 4180, 4182, 4184, 4186, 4188, 4190, 4193, 4195, 4197, 4199, 4201, 4203, 4206, 4208, 4210, 4212, 4214, 4216, 4218, 4221, 4223, 4225, 4227, 4229, 4231, 4234, 4236, 4238, 4240, 4242, 4244, 4246, 4249, 4251, 4253, 4255, 4257, 4259, 4261, 4264, 4266, 4268, 4270, 4272, 4274, 4276, 4279, 4281, 4283, 4285, 4287, 4289, 4291, 4294, 4296, 4298, 4300, 4302, 4304, 4306, 4309, 4311, 4313, 4315, 4317, 4319, 4321, 4323, 4326, 4328, 4330, 4332, 4334, 4336, 4338, 4341, 4343, 4345, 4347, 4349, 4351, 4353, 4355, 4358, 4360, 4362, 4364, 4366, 4368, 4370, 4372, 4375, 4377, 4379, 4381, 4383, 4385, 4387, 4389, 4392, 4394, 4396, 4398, 4400, 4402, 4404, 4406, 4408, 4411, 4413, 4415, 4417, 4419, 4421, 4423, 4425, 4428, 4430, 4432, 4434, 4436, 4438, 4440, 4442, 4444, 4447, 4449, 4451, 4453, 4455, 4457, 4459, 4461, 4463, 4466, 4468, 4470, 4472, 4474, 4476, 4478, 4480, 4482, 4484, 4487, 4489, 4491, 4493, 4495, 4497, 4499, 4501, 4503, 4506, 4508, 4510, 4512, 4514, 4516, 4518, 4520, 4522, 4524, 4526, 4529, 4531, 4533, 4535, 4537, 4539, 4541, 4543, 4545, 4547, 4550, 4552, 4554, 4556, 4558, 4560, 4562, 4564, 4566, 4568, 4570, 4573, 4575, 4577, 4579, 4581, 4583, 4585, 4587, 4589, 4591, 4593, 4595, 4598, 4600, 4602, 4604, 4606, 4608, 4610, 4612, 4614, 4616, 4618, 4620, 4623, 4625, 4627, 4629, 4631, 4633, 4635, 4637, 4639, 4641, 4643, 4645, 4647, 4649, 4652, 4654, 4656, 4658, 4660, 4662, 4664, 4666, 4668, 4670, 4672, 4674, 4676, 4678, 4681, 4683, 4685, 4687, 4689, 4691, 4693, 4695, 4697, 4699, 4701, 4703, 4705, 4707, 4709, 4712, 4714, 4716, 4718, 4720, 4722, 4724, 4726, 4728, 4730, 4732, 4734, 4736, 4738, 4740, 4742, 4744, 4746, 4749, 4751, 4753, 4755, 4757, 4759, 4761, 4763, 4765, 4767, 4769, 4771, 4773, 4775, 4777, 4779, 4781, 4783, 4785, 4788, 4790, 4792, 4794, 4796, 4798, 4800, 4802, 4804, 4806, 4808, 4810, 4812, 4814, 4816, 4818, 4820, 4822, 4824, 4826, 4828, 4830, 4832, 4834, 4837, 4839, 4841, 4843, 4845, 4847, 4849, 4851, 4853, 4855, 4857, 4859, 4861, 4863, 4865, 4867, 4869, 4871, 4873, 4875, 4877, 4879, 4881, 4883, 4885, 4887, 4889, 4891, 4893, 4895, 4897, 4899, 4902, 4904, 4906, 4908, 4910, 4912, 4914, 4916, 4918, 4920, 4922, 4924, 4926, 4928, 4930, 4932, 4934, 4936, 4938, 4940, 4942, 4944, 4946, 4948, 4950, 4952, 4954, 4956, 4958, 4960, 4962, 4964, 4966, 4968, 4970, 4972, 4974, 4976, 4978, 4980, 4982, 4984, 4986, 4988, 4990, 4992, 4994, 4996, 4998, 5000, 5002, 5004, 5006, 5008, 5010, 5012, 5014, 5016, 5018, 5020, 5022, 5024, 5026, 5028, 5030, 5032, 5034, 5036, 5038, 5040, 5042, 5044, 5046, 5048, 5050, 5052, 5054, 5056, 5058, 5060, 5062, 5064, 5066, 5068, 5070, 5072, 5074, 5076, 5078, 5080, 5082, 5084, 5086, 5088, 5090, 5092, 5094, 5096, 5098, 5100, 5102, 5104, 5106, 5108, 5110, 5112, 5114, 5116, 5118, 5120, 5122, 5124, 5126, 5128, 5130, 5132, 5134, 5136, 5138, 5140, 5142, 5144, 5146, 5147, 5149, 5151, 5153, 5155, 5157, 5159, 5161, 5163, 5165, 5167, 5169, 5171, 5173, 5175, 5177, 5179, 5181, 5183, 5185, 5187, 5189, 5191, 5193, 5195, 5197, 5199, 5201, 5203, 5205, 5207, 5209, 5210, 5212, 5214, 5216, 5218, 5220, 5222, 5224, 5226, 5228, 5230, 5232, 5234, 5236, 5238, 5240, 5242, 5244, 5246, 5248, 5250, 5252, 5254, 5256, 5257, 5259, 5261, 5263, 5265, 5267, 5269, 5271, 5273, 5275, 5277, 5279, 5281, 5283, 5285, 5287, 5289, 5291, 5293, 5294, 5296, 5298, 5300, 5302, 5304, 5306, 5308, 5310, 5312, 5314, 5316, 5318, 5320, 5322, 5324, 5326, 5327, 5329, 5331, 5333, 5335, 5337, 5339, 5341, 5343, 5345, 5347, 5349, 5351, 5353, 5355, 5357, 5358, 5360, 5362, 5364, 5366, 5368, 5370, 5372, 5374, 5376, 5378, 5380, 5382, 5384, 5385, 5387, 5389, 5391, 5393, 5395, 5397, 5399, 5401, 5403, 5405, 5407, 5409, 5410, 5412, 5414, 5416, 5418, 5420, 5422, 5424, 5426, 5428, 5430, 5432, 5433, 5435, 5437, 5439, 5441, 5443, 5445, 5447, 5449, 5451, 5453, 5455, 5456, 5458, 5460, 5462, 5464, 5466, 5468, 5470, 5472, 5474, 5476, 5477, 5479, 5481, 5483, 5485, 5487, 5489, 5491, 5493, 5495, 5496, 5498, 5500, 5502, 5504, 5506, 5508, 5510, 5512, 5514, 5515, 5517, 5519, 5521, 5523, 5525, 5527, 5529, 5531, 5533, 5534, 5536, 5538, 5540, 5542, 5544, 5546, 5548, 5550, 5551, 5553, 5555, 5557, 5559, 5561, 5563, 5565, 5567, 5568, 5570, 5572, 5574, 5576, 5578, 5580, 5582, 5584, 5585, 5587, 5589, 5591, 5593, 5595, 5597, 5599, 5601, 5602, 5604, 5606, 5608, 5610, 5612, 5614, 5616, 5617, 5619, 5621, 5623, 5625, 5627, 5629, 5631, 5632, 5634, 5636, 5638, 5640, 5642, 5644, 5646, 5647, 5649, 5651, 5653, 5655, 5657, 5659, 5660, 5662, 5664, 5666, 5668, 5670, 5672, 5674, 5675, 5677, 5679, 5681, 5683, 5685, 5687, 5688, 5690, 5692, 5694, 5696, 5698, 5700, 5701, 5703, 5705, 5707, 5709, 5711, 5713, 5714, 5716, 5718, 5720, 5722, 5724, 5726, 5727, 5729, 5731, 5733, 5735, 5737, 5739, 5740, 5742, 5744, 5746, 5748, 5750, 5751, 5753, 5755, 5757, 5759, 5761, 5763, 5764, 5766, 5768, 5770, 5772, 5774, 5775, 5777, 5779, 5781, 5783, 5785, 5787, 5788, 5790, 5792, 5794, 5796, 5798, 5799, 5801, 5803, 5805, 5807, 5809, 5810, 5812, 5814, 5816, 5818, 5820, 5821, 5823, 5825, 5827, 5829, 5831, 5832, 5834, 5836, 5838, 5840, 5842, 5843, 5845, 5847, 5849, 5851, 5852, 5854, 5856, 5858, 5860, 5862, 5863, 5865, 5867, 5869, 5871, 5873, 5874, 5876, 5878, 5880, 5882, 5883, 5885, 5887, 5889, 5891, 5893, 5894, 5896, 5898, 5900, 5902, 5903, 5905, 5907, 5909, 5911, 5913, 5914, 5916, 5918, 5920, 5922, 5923, 5925, 5927, 5929, 5931, 5932, 5934, 5936, 5938, 5940, 5941, 5943, 5945, 5947, 5949, 5950, 5952, 5954, 5956, 5958, 5960, 5961, 5963, 5965, 5967, 5969, 5970, 5972, 5974, 5976, 5978, 5979, 5981, 5983, 5985, 5986, 5988, 5990, 5992, 5994, 5995, 5997, 5999, 6001, 6003, 6004, 6006, 6008, 6010, 6012, 6013, 6015, 6017, 6019, 6021, 6022, 6024, 6026, 6028, 6029, 6031, 6033, 6035, 6037, 6038, 6040, 6042, 6044, 6046, 6047, 6049, 6051, 6053, 6054, 6056, 6058, 6060, 6062, 6063, 6065, 6067, 6069, 6070, 6072, 6074, 6076, 6078, 6079, 6081, 6083, 6085, 6086, 6088, 6090, 6092, 6094, 6095, 6097, 6099, 6101, 6102, 6104, 6106, 6108, 6109, 6111, 6113, 6115, 6117, 6118, 6120, 6122, 6124, 6125, 6127, 6129, 6131, 6132, 6134, 6136, 6138, 6139, 6141, 6143, 6145, 6147, 6148, 6150, 6152, 6154, 6155, 6157, 6159, 6161, 6162, 6164, 6166, 6168, 6169, 6171, 6173, 6175, 6176, 6178, 6180, 6182, 6183, 6185, 6187, 6189, 6190, 6192, 6194, 6196, 6197, 6199, 6201, 6203, 6204, 6206, 6208, 6210, 6211, 6213, 6215, 6217, 6218, 6220, 6222, 6224, 6225, 6227, 6229, 6231, 6232, 6234, 6236, 6237, 6239, 6241, 6243, 6244, 6246, 6248, 6250, 6251, 6253, 6255, 6257, 6258, 6260, 6262, 6264, 6265, 6267, 6269, 6270, 6272, 6274, 6276, 6277, 6279, 6281, 6283, 6284, 6286, 6288, 6289, 6291, 6293, 6295, 6296, 6298, 6300, 6302, 6303, 6305, 6307, 6308, 6310, 6312, 6314, 6315, 6317, 6319, 6321, 6322, 6324, 6326, 6327, 6329, 6331, 6333, 6334, 6336, 6338, 6339, 6341, 6343, 6345, 6346, 6348, 6350, 6351, 6353, 6355, 6357, 6358, 6360, 6362, 6363, 6365, 6367, 6369, 6370, 6372, 6374, 6375, 6377, 6379, 6381, 6382, 6384, 6386, 6387, 6389, 6391, 6392, 6394, 6396, 6398, 6399, 6401, 6403, 6404, 6406, 6408, 6409, 6411, 6413, 6415, 6416, 6418, 6420, 6421, 6423, 6425, 6426, 6428, 6430, 6432, 6433, 6435, 6437, 6438, 6440, 6442, 6443, 6445, 6447, 6448, 6450, 6452, 6454, 6455, 6457, 6459, 6460, 6462, 6464, 6465, 6467, 6469, 6470, 6472, 6474, 6475, 6477, 6479, 6481, 6482, 6484, 6486, 6487, 6489, 6491, 6492, 6494, 6496, 6497, 6499, 6501, 6502, 6504, 6506, 6507, 6509, 6511, 6512, 6514, 6516, 6517, 6519, 6521, 6522, 6524, 6526, 6528, 6529, 6531, 6533, 6534, 6536, 6538, 6539, 6541, 6543, 6544, 6546, 6548, 6549, 6551, 6553, 6554, 6556, 6558, 6559, 6561, 6563, 6564, 6566, 6568, 6569, 6571, 6573, 6574, 6576, 6578, 6579, 6581, 6583, 6584, 6586, 6587, 6589, 6591, 6592, 6594, 6596, 6597, 6599, 6601, 6602, 6604, 6606, 6607, 6609, 6611, 6612, 6614, 6616, 6617, 6619, 6621, 6622, 6624, 6626, 6627, 6629, 6630, 6632, 6634, 6635, 6637, 6639, 6640, 6642, 6644, 6645, 6647, 6649, 6650, 6652, 6654, 6655, 6657, 6658, 6660, 6662, 6663, 6665, 6667, 6668, 6670, 6672, 6673, 6675, 6677, 6678, 6680, 6681, 6683, 6685, 6686, 6688, 6690, 6691, 6693, 6695, 6696, 6698, 6699, 6701, 6703, 6704, 6706, 6708, 6709, 6711, 6712, 6714, 6716, 6717, 6719, 6721, 6722, 6724, 6725, 6727, 6729, 6730, 6732, 6734, 6735, 6737, 6738, 6740, 6742, 6743, 6745, 6747, 6748, 6750, 6751, 6753, 6755, 6756, 6758, 6760, 6761, 6763, 6764, 6766, 6768, 6769, 6771, 6772, 6774, 6776, 6777, 6779, 6781, 6782, 6784, 6785, 6787, 6789, 6790, 6792, 6793, 6795, 6797, 6798, 6800, 6802, 6803, 6805, 6806, 6808, 6810, 6811, 6813, 6814, 6816, 6818, 6819, 6821, 6822, 6824, 6826, 6827, 6829, 6830, 6832, 6834, 6835, 6837, 6838, 6840, 6842, 6843, 6845, 6846, 6848, 6850, 6851, 6853, 6854, 6856, 6858, 6859, 6861, 6862, 6864, 6866, 6867, 6869, 6870, 6872, 6874, 6875, 6877, 6878, 6880, 6881, 6883, 6885, 6886, 6888, 6889, 6891, 6893, 6894, 6896, 6897, 6899, 6901, 6902, 6904, 6905, 6907, 6908, 6910, 6912, 6913, 6915, 6916, 6918, 6920, 6921, 6923, 6924, 6926, 6927, 6929, 6931, 6932, 6934, 6935, 6937, 6938, 6940, 6942, 6943, 6945, 6946, 6948, 6950, 6951, 6953, 6954, 6956, 6957, 6959, 6961, 6962, 6964, 6965, 6967, 6968, 6970, 6972, 6973, 6975, 6976, 6978, 6979, 6981, 6982, 6984, 6986, 6987, 6989, 6990, 6992, 6993, 6995, 6997, 6998, 7000, 7001, 7003, 7004, 7006, 7007, 7009, 7011, 7012, 7014, 7015, 7017, 7018, 7020, 7022, 7023, 7025, 7026, 7028, 7029, 7031, 7032, 7034, 7036, 7037, 7039, 7040, 7042, 7043, 7045, 7046, 7048, 7049, 7051, 7053, 7054, 7056, 7057, 7059, 7060, 7062, 7063, 7065, 7067, 7068, 7070, 7071, 7073, 7074, 7076, 7077, 7079, 7080, 7082, 7083, 7085, 7087, 7088, 7090, 7091, 7093, 7094, 7096, 7097, 7099, 7100, 7102, 7104, 7105, 7107, 7108, 7110, 7111, 7113, 7114, 7116, 7117, 7119, 7120, 7122, 7123, 7125, 7127, 7128, 7130, 7131, 7133, 7134, 7136, 7137, 7139, 7140, 7142, 7143, 7145, 7146, 7148, 7149, 7151, 7153, 7154, 7156, 7157, 7159, 7160, 7162, 7163, 7165, 7166, 7168, 7169, 7171, 7172, 7174, 7175, 7177, 7178, 7180, 7181, 7183, 7184, 7186, 7187, 7189, 7191, 7192, 7194, 7195, 7197, 7198, 7200, 7201, 7203, 7204, 7206, 7207, 7209, 7210, 7212, 7213, 7215, 7216, 7218, 7219, 7221, 7222, 7224, 7225, 7227, 7228, 7230, 7231, 7233, 7234, 7236, 7237, 7239, 7240, 7242, 7243, 7245, 7246, 7248, 7249, 7251, 7252, 7254, 7255, 7257, 7258, 7260, 7261, 7263, 7264, 7266, 7267, 7269, 7270, 7272, 7273, 7275, 7276, 7278, 7279, 7281, 7282, 7284, 7285, 7287, 7288, 7290, 7291, 7293, 7294, 7296, 7297, 7299, 7300, 7302, 7303, 7305, 7306, 7308, 7309, 7311, 7312, 7314, 7315, 7317, 7318, 7320, 7321, 7323, 7324, 7326, 7327, 7329, 7330, 7331, 7333, 7334, 7336, 7337, 7339, 7340, 7342, 7343, 7345, 7346, 7348, 7349, 7351, 7352, 7354, 7355, 7357, 7358, 7360, 7361, 7363, 7364, 7365, 7367, 7368, 7370, 7371, 7373, 7374, 7376, 7377, 7379, 7380, 7382, 7383, 7385, 7386, 7388, 7389, 7390, 7392, 7393, 7395, 7396, 7398, 7399, 7401, 7402, 7404, 7405, 7407, 7408, 7410, 7411, 7412, 7414, 7415, 7417, 7418, 7420, 7421, 7423, 7424, 7426, 7427, 7429, 7430, 7431, 7433, 7434, 7436, 7437, 7439, 7440, 7442, 7443, 7445, 7446, 7447, 7449, 7450, 7452, 7453, 7455, 7456, 7458, 7459, 7461, 7462, 7463, 7465, 7466, 7468, 7469, 7471, 7472, 7474, 7475, 7476, 7478, 7479, 7481, 7482, 7484, 7485, 7487, 7488, 7490, 7491, 7492, 7494, 7495, 7497, 7498, 7500, 7501, 7502, 7504, 7505, 7507, 7508, 7510, 7511, 7513, 7514, 7515, 7517, 7518, 7520, 7521, 7523, 7524, 7526, 7527, 7528, 7530, 7531, 7533, 7534, 7536, 7537, 7538, 7540, 7541, 7543, 7544, 7546, 7547, 7548, 7550, 7551, 7553, 7554, 7556, 7557, 7558, 7560, 7561, 7563, 7564, 7566, 7567, 7568, 7570, 7571, 7573, 7574, 7576, 7577, 7578, 7580, 7581, 7583, 7584, 7585, 7587, 7588, 7590, 7591, 7593, 7594, 7595, 7597, 7598, 7600, 7601, 7603, 7604, 7605, 7607, 7608, 7610, 7611, 7612, 7614, 7615, 7617, 7618, 7620, 7621, 7622, 7624, 7625, 7627, 7628, 7629, 7631, 7632, 7634, 7635, 7636, 7638, 7639, 7641, 7642, 7643, 7645, 7646, 7648, 7649, 7651, 7652, 7653, 7655, 7656, 7658, 7659, 7660, 7662, 7663, 7665, 7666, 7667, 7669, 7670, 7672, 7673, 7674, 7676, 7677, 7679, 7680, 7681, 7683, 7684, 7686, 7687, 7688, 7690, 7691, 7693, 7694, 7695, 7697, 7698, 7699, 7701, 7702, 7704, 7705, 7706, 7708, 7709, 7711, 7712, 7713, 7715, 7716, 7718, 7719, 7720, 7722, 7723, 7725, 7726, 7727, 7729, 7730, 7731, 7733, 7734, 7736, 7737, 7738, 7740, 7741, 7743, 7744, 7745, 7747, 7748, 7749, 7751, 7752, 7754, 7755, 7756, 7758, 7759, 7760, 7762, 7763, 7765, 7766, 7767, 7769, 7770, 7771, 7773, 7774, 7776, 7777, 7778, 7780, 7781, 7782, 7784, 7785, 7787, 7788, 7789, 7791, 7792, 7793, 7795, 7796, 7798, 7799, 7800, 7802, 7803, 7804, 7806, 7807, 7809, 7810, 7811, 7813, 7814, 7815, 7817, 7818, 7819, 7821, 7822, 7824, 7825, 7826, 7828, 7829, 7830, 7832, 7833, 7834, 7836, 7837, 7839, 7840, 7841, 7843, 7844, 7845, 7847, 7848, 7849, 7851, 7852, 7853, 7855, 7856, 7858, 7859, 7860, 7862, 7863, 7864, 7866, 7867, 7868, 7870, 7871, 7872, 7874, 7875, 7876, 7878, 7879, 7880, 7882, 7883, 7885, 7886, 7887, 7889, 7890, 7891, 7893, 7894, 7895, 7897, 7898, 7899, 7901, 7902, 7903, 7905, 7906, 7907, 7909, 7910, 7911, 7913, 7914, 7915, 7917, 7918, 7919, 7921, 7922, 7924, 7925, 7926, 7928, 7929, 7930, 7932, 7933, 7934, 7936, 7937, 7938, 7940, 7941, 7942, 7944, 7945, 7946, 7948, 7949, 7950, 7952, 7953, 7954, 7956, 7957, 7958, 7960, 7961, 7962, 7964, 7965, 7966, 7968, 7969, 7970, 7971, 7973, 7974, 7975, 7977, 7978, 7979, 7981, 7982, 7983, 7985, 7986, 7987, 7989, 7990, 7991, 7993, 7994, 7995, 7997, 7998, 7999, 8001, 8002, 8003, 8005, 8006, 8007, 8009, 8010, 8011, 8012, 8014, 8015, 8016, 8018, 8019, 8020, 8022, 8023, 8024, 8026, 8027, 8028, 8030, 8031, 8032, 8034, 8035, 8036, 8037, 8039, 8040, 8041, 8043, 8044, 8045, 8047, 8048, 8049, 8051, 8052, 8053, 8054, 8056, 8057, 8058, 8060, 8061, 8062, 8064, 8065, 8066, 8068, 8069, 8070, 8071, 8073, 8074, 8075, 8077, 8078, 8079, 8081, 8082, 8083, 8084, 8086, 8087, 8088, 8090, 8091, 8092, 8094, 8095, 8096, 8097, 8099, 8100, 8101, 8103, 8104, 8105, 8106, 8108, 8109, 8110, 8112, 8113, 8114, 8116, 8117, 8118, 8119, 8121, 8122, 8123, 8125, 8126, 8127, 8128, 8130, 8131, 8132, 8134, 8135, 8136, 8137, 8139, 8140, 8141, 8143, 8144, 8145, 8146, 8148, 8149, 8150, 8152, 8153, 8154, 8155, 8157, 8158, 8159, 8161, 8162, 8163, 8164, 8166, 8167, 8168, 8170, 8171, 8172, 8173, 8175, 8176, 8177, 8178, 8180, 8181, 8182, 8184, 8185, 8186, 8187, 8189, 8190, 8191, 8192 },
    { 0 }
};
s32 D_80071318[3] = { 24, 458765, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071324[3] = { 25, 458767, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071330[3] = { 96, 20, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007133C[4] = { 393216, 393224, 1376292, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007134C[5] = { 96, 16, 96, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071360[5] = { 393216, 57, 393224, 10, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071374[5] = { 96, 64, 96, 32, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071388[3] = { 393216, 2, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071394[3] = { 128, 48, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800713A0[6] = { 983041, 49, 393216, 2, 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800713B8[6] = { 48, 8, 96, 48, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800713D0[5] = { 983041, 51, 983041, 52, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800713E4[5] = { 32, 36, 32, 36, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800713F8[5] = { 983041, 52, 983041, 51, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007140C[5] = { 32, 36, 32, 36, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071420[5] = { 983041, 51, 983041, 52, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071434[5] = { 32, 36, 32, 36, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071448[5] = { 983041, 52, 983041, 51, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007145C[5] = { 32, 36, 32, 36, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071470[5] = { 983041, 52, 983041, 51, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071484[5] = { 32, 36, 32, 36, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071498[6] = { 983041, 51, 983041, 49, 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800714B0[6] = { 32, 36, 32, 8, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800714C8[6] = { 983041, 52, 983041, 50, 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800714E0[6] = { 32, 36, 32, 8, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800714F8[4] = { 983041, 49, 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071508[5] = { 32, 8, 64, 12, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007151C[5] = { 52, 47, 51, 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071530[5] = { 48, 48, 48, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071544[5] = { 31, 51, 30, 52, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071558[5] = { 16, 48, 16, 48, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007156C[5] = { 30, 52, 31, 51, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071580[5] = { 16, 48, 16, 48, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071594[5] = { 52, 47, 51, 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800715A8[5] = { 48, 48, 48, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800715BC[3] = { 47, 51, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800715C8[3] = { 96, 30, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800715D4[3] = { 47, 52, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800715E0[3] = { 96, 30, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800715EC[5] = { 52, 47, 51, 47, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071600[5] = { 48, 96, 48, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071614[5] = { 52, 47, 51, 47, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071628[5] = { 48, 96, 48, 96, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007163C[2] = { 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071644[6] = { 36, 32, 8, 15, 60, 0 }; /* UNRESOLVED: size-only typing */
s32 D_8007165C[2] = { 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071664[3] = { 30, 12, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071670[2] = { 393216, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071678[2] = { 99, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071680[2] = { 14592, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071688[2] = { -1, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071690[2] = { 1455872, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80071698[2] = { 1455872, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800716A0[4] = { 8960, 0, 1451008, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800716B0[2] = { 8960, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800716B8[2] = { 1451008, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800716C0[2] = { 1451008, 0 }; /* UNRESOLVED: size-only typing */
void *D_800716C8[24] = { &D_80071680, &D_80071688, &D_80071690, &D_80071688, &D_800716C0, &D_80071688, &D_80071690, &D_80071688, &D_800716B0, &D_80071688, &D_80071698, &D_80071688, &D_800716B0, &D_80071688, &D_800716B0, &D_80071688, &D_800716B0, &D_80071688, &D_800716A0, &D_80071688, &D_800716B8, &D_80071688, &D_800716B0, &D_80071688 };
void *D_80071728[2] = { &D_80071670, &D_80071678 };
void *D_80071730[2] = { &D_80071324, &D_80071330 };
void *D_80071738[46] = { &D_80071318, &D_80071330, &D_8007133C, &D_8007134C, &D_80071360, &D_80071374, &D_80071388, &D_80071394, &D_800713A0, &D_800713B8, &D_800713D0, &D_800713E4, &D_80071420, &D_80071434, &D_800713F8, &D_8007140C, &D_80071448, &D_8007145C, &D_80071470, &D_80071484, &D_80071498, &D_800714B0, &D_800714C8, &D_800714E0, &D_800714F8, &D_80071508, &D_8007151C, &D_80071530, &D_80071544, &D_80071558, &D_8007156C, &D_80071580, &D_80071594, &D_800715A8, &D_800715BC, &D_800715C8, &D_800715D4, &D_800715E0, &D_800715EC, &D_80071600, &D_80071614, &D_80071628, &D_8007163C, &D_80071644, &D_8007165C, &D_80071664 };
s16 D_800717F0 = 0;
s16 D_800717F2 = 0;
s32 D_800717F4 = 0;
u8 D_800717F8[4] = { 0, 0, 0, 0 };
s32 D_800717FC[6] = { 3801147, 3932221, 4063295, 4194369, 4325443, 4456517 };
s32 D_80071814 = 0;
s32 D_80071818 = 600;
s32 D_8007181C = 39321600;
s32 D_80071820[46] = { 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, 600, 39321600, 12288, 0, -600, 39321600, 12288, 0 };
s16 D_800718D8[4] = { 0, 0, 0, 0 };
s16 D_800718E0 = 0;
s16 D_800718E2 = 0;
s16 D_800718E4[2] = { 0, 0 };
s32 D_800718E8 = 0;
s16 D_800718EC[2] = { 0, 0 };
s32 D_800718F0 = 0;
s32 D_800718F4 = 0;
u8 D_800718F8[4] = { 1, 0, 0, 0 };
struct D_800718FC_s { s16 f_800718fc; s16 f_800718fe[3]; } D_800718FC = { 0, { 7, 0, 8 } }; /* members: D_800718FC, D_800718FE */
s32 D_80071904 = 0;
void *D_80071908[5] = { &D_800B5A84, &D_800B59C0, &D_800B5B3C, &D_800B5C24, &D_800B5A8C };
s32 D_8007191C[6] = { 20971648, 11534560, 8388736, 11534560, 76023150, 94373320 };
s32 D_80071934 = 0;
s32 D_80071938 = 0;
s32 D_8007193C = 0;
s32 D_80071940[2] = { 0, 0 };
struct D_80071948_s { u8 f_80071948; u8 f_80071949[7]; } D_80071948 = { 0, { 0, 0, 0, 0, 0, 0, 0 } }; /* members: D_80071948, D_80071949 */
s16 D_80071950[10] = { 0, 1, 1, 2, 1, 1, 3, 0, 0, 0 };
s32 D_80071964 = 0;
u8 D_80071968[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
s32 D_80071970[2] = { 0, 126 };
s32 D_80071978[44] = { 16777516, 83951873, 16843009, 17105664, 61440, 50529027, 50529027, 50530055, 117637891, 50530048, 369099010, 50595078, 117967376, 185339150, 252252434, 320083223, 404298267, 471670303, 556475427, 723658023, 690497067, 623585836, 724447018, 252380721, 842077975, 858666255, 67518487, 387003447, 957364792, 87768093, 974863676, 404096062, 322912274, 287114561, 1078004994, 336738333, 101516814, 138151447, 50989385, 1210073924, 1111968325, 1179339853, 1313820753, 1381171200 };
u8 D_80071A28[276] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 62, 76, 52, 70, 50, 51, 59, 53, 66, 69, 68, 58, 64, 57, 60, 81, 71, 78, 63, 65, 74, 61, 80, 75, 56, 67, 79, 54, 77, 0, 35, 1, 8, 4, 3, 8, 2, 9, 5, 7, 17, 6, 8, 9, 12, 10, 11, 12, 13, 14, 10, 15, 16, 40, 25, 17, 25, 41, 41, 55, 37, 38, 15, 27, 40, 30, 41, 41, 78, 20, 19, 21, 22, 37, 35, 32, 23, 33, 38, 37, 79, 25, 33, 26, 55, 27, 28, 65, 29, 30, 36, 31, 38, 32, 33, 30, 33, 57, 34, 37, 36, 35, 38, 40, 57, 40, 25, 66, 33, 40, 41, 70, 69, 71, 72, 73, 43, 44, 45, 42, 49, 47, 46, 48, 82, 83, 84, 85, 86, 87, 88, 90, 90, 0, 0 };
s16 D_80071B3C[134] = { 291, 310, 305, 321, 304, 306, 301, 289, 318, 292, 320, 300, 296, 290, 323, 316, 299, 313, 308, 317, 270, 302, 277, 311, 322, 287, 319, 314, 281, 309, 286, 302, 320, 298, 301, 318, 320, 308, 304, 287, 273, 305, 280, 304, 320, 271, 320, 290, 320, 270, 317, 290, 316, 273, 301, 323, 305, 323, 311, 311, 277, 316, 270, 309, 304, 301, 289, 311, 271, 313, 311, 281, 291, 298, 270, 302, 306, 287, 319, 309, 272, 314, 271, 323, 277, 319, 304, 280, 292, 317, 289, 308, 313, 309, 306, 319, 289, 319, 305, 290, 272, 308, 302, 309, 301, 301, 290, 318, 323, 319, 301, 311, 321, 292, 320, 279, 324, 307, 283, 282, 275, 303, 276, 284, 278, 274, 288, 297, 293, 295, 294, 312, 315, 285 };
s16 D_80071C48[2] = { 0, 0 };
s32 D_80071C4C = 0;
u8 D_80071C50[8] = { 1, 0, 0, 0, 0, 0, 0, 0 };
u16 D_80071C58[6] = { 0, 16, 68, 273, 325, 1301 };
s32 D_80071C64[12] = { 100859904, 88938, 74898, 234794, 116963, 149997, 116943, 88782, 75047, 88746, 117162, 0 };
s32 D_80071C94[12] = { 84082688, 11114, 9362, 29994, 14563, 18925, 14543, 10958, 9511, 10922, 10666, 0 };
s32 D_80071CC4[12] = { 67305472, 1386, 1170, 3754, 1843, 2365, 1823, 1482, 1191, 1530, 1850, 0 };
s32 D_80071CF4[12] = { 50528256, 170, 146, 471, 503, 317, 479, 190, 151, 471, 250, 0 };
s32 D_80071D24[12] = { 100794368, 4095, 2730, 3563, 3771, 2751, 3767, 4055, 1387, 4095, 2751, 0 };
s32 D_80071D54[12] = { 84017152, 1023, 682, 891, 955, 703, 951, 1015, 363, 1023, 703, 0 };
s32 D_80071D84[12] = { 67239936, 255, 170, 219, 239, 175, 231, 247, 93, 255, 250, 0 };
s32 D_80071DB4[12] = { 50462720, 63, 42, 59, 59, 47, 55, 55, 27, 63, 47, 0 };
s32 D_80071DE4[12] = { 100728832, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0 };
s32 D_80071E14[12] = { 83951616, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0 };
s32 D_80071E44[12] = { 67174400, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0 };
s32 D_80071E74[12] = { 50397184, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0 };
s32 D_80071EA4[12] = { 100859904, 88938, 74898, 246890, 201614, 37869, 201639, 88995, 74831, 88746, 201450, 0 };
s32 D_80071ED4[12] = { 84082688, 11114, 9362, 29802, 25486, 5101, 25511, 11171, 9295, 10922, 8938, 0 };
s32 D_80071F04[12] = { 67305472, 1386, 1170, 3754, 3166, 637, 3191, 1506, 1167, 1530, 3194, 0 };
s32 D_80071F34[12] = { 50528256, 170, 146, 471, 479, 125, 503, 187, 151, 471, 442, 0 };
s32 D_80071F64[12] = { 100794368, 4095, 1365, 3799, 3447, 1407, 3451, 4075, 2711, 4095, 1407, 0 };
s32 D_80071F94[12] = { 84017152, 1023, 341, 951, 887, 383, 891, 1019, 663, 1023, 383, 0 };
s32 D_80071FC4[12] = { 67239936, 255, 85, 231, 223, 95, 219, 251, 174, 255, 245, 0 };
s32 D_80071FF4[13] = { 50462720, 63, 21, 55, 55, 31, 59, 59, 39, 63, 31, 0, 0 };
u8 D_80072028[8] = { 0, 2, 4, 6, 8, 0, 0, 0 };
u8 D_80072030[8] = { 0, 4, 8, 12, 16, 18, 0, 0 };
u8 D_80072038[8] = { 2, 2, 2, 2, 1, 0, 0, 0 };
u8 D_80072040[8] = { 4, 4, 4, 4, 2, 1, 0, 0 };
char D_80072048[24] = "SELECT PLAY TO SWAP OUT";
char D_80072060[28] = "SELECT PLAY TO REPLACE WITH";
void *D_8007207C[3] = { &D_800C8E3C, &D_800C8F64, &D_800C90C0 };
void *D_80072088[1] = { &D_8006C928 };
struct D_8007208C_s { s16 f_8007208c[5]; u8 f_80072096[2]; } D_8007208C = { { -32768, 7220, 0, 0, -1 }, { 255, 0 } }; /* members: D_8007208C, D_80072096 */
s16 D_80072098[2] = { 64, 0 };
s32 D_8007209C = 503711232; /* UNRESOLVED: size-only typing */
s32 D_800720A0 = 17371409; /* UNRESOLVED: size-only typing */
void *D_800720A4[3] = { &D_800C9120, &D_800C9158, &D_800C9190 };
s32 D_800720B0 = 135987968;
void *D_800720B4[3] = { &D_8007209C, &D_800720A0, &D_800720A4 };
s32 D_800720C0[6] = { 100700160, -2146659896, 100597760, 0, 0, 0 };
void *D_800720D8[4] = { &D_800C9220, &D_800C9228, &D_800C9254, &D_8006C620 };
struct D_800720E8_s { s16 f_800720e8[5]; u8 f_800720f2[42]; } D_800720E8 = { { 0, 0, 0, 0, -1 }, { 255, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 1, 0, 0, 0, 16, 0, 0, 0, 2, 0, 0, 0, 4, 0, 0, 0, 8, 0, 0, 0, 32, 0, 0, 0, 64, 0, 0, 0, 128, 0 } }; /* members: D_800720E8, D_800720F2 */
void *D_8007211C[9] = { &D_8006BD24, &D_8006BD30, &D_8006BD28, &D_8006BD8C, &D_8006BD9C, &D_8006BDAC, &D_8006BD5C, &D_8006BD6C, &D_8006BD7C };
u8 D_80072140[6] = { 23, 31, 39, 47, 55, 0 };
s16 D_80072146 = 0;
s16 D_80072148[2] = { 0, 0 };
s32 D_8007214C = -1;
s32 D_80072150 = 0;
s16 D_80072154[2] = { 0, 0 };
void *D_80072158[8] = { &D_800E6A6C, &D_800E620C, &D_800E6318, &D_800E6424, &D_800E663C, &D_800E6748, &D_800E6854, &D_800E6960 };
void *D_80072178[4] = { &D_800CAC58, &D_800CB434, &D_800CBC98, &D_800E5E18 };
struct D_80072188_s { s16 f_80072188[5]; u8 f_80072192[6]; } D_80072188 = { { 0, 0, 0, 0, -1 }, { 255, 0, 0, 0, 0, 0 } }; /* members: D_80072188, D_80072192 */
void *D_80072198[3] = { &D_800CD03C, &D_800CD7E0, &D_800CDDD8 };
struct D_800721A4_s { s16 f_800721a4[7]; u8 f_800721b2[6]; } D_800721A4 = { { -32762, -13000, 0, 0, 0, 0, -1 }, { 255, 0, 0, 64, 0, 0 } }; /* members: D_800721A4, D_800721B2 */
u8 D_800721B8[8] = { 0, 12, 10, 11, 14, 13, 255, 0 };
u8 D_800721C0[8] = { 16, 3, 17, 18, 15, 255, 0, 0 };
s32 D_800721C8[2] = { 0, 0 };
s32 D_800721D0 = 0;
s32 D_800721D4 = 0;
void *D_800721D8[5] = { &D_800D6BA4, &D_800D785C, &D_800D83F8, &D_8006CB14, &D_800021CC };
s32 D_800721EC = 0;
s16 D_800721F0[4] = { 5, -256, 64, 0 };
s16 D_800721F8 = 0;
s16 D_800721FA = 0;
void *D_800721FC[5] = { &D_800D85D8, &D_800D872C, &D_800D89E8, &D_8006C68C, &D_80002220 };
s32 D_80072210 = 0;
s16 D_80072214[4] = { 5, -256, 0, 0 };
s32 D_8007221C = 504628766; /* UNRESOLVED: size-only typing */
s32 D_80072220 = 67900194; /* UNRESOLVED: size-only typing */
void *D_80072224[4] = { &D_800D8A60, &D_800D8A98, &D_800D8B10, &D_800D8B74 };
s32 D_80072234 = 118359040;
void *D_80072238[3] = { &D_8007221C, &D_80072220, &D_80072224 };
s32 D_80072244[6] = { 100697088, -2146595840, 100597760, 0, 0, 0 };
void *D_8007225C[5] = { &D_800D8C58, &D_800D90C4, &D_800D9600, &D_8006C9DC, &D_80002244 };
s32 D_80072270 = 0;
s16 D_80072274[4] = { 5, -256, 64, 0 };
void *D_8007227C[5] = { &D_800D9824, &D_800D9B5C, &D_800DA048, &D_800C2258, &D_80002368 };
s32 D_80072290[3] = { 0, 392960, 4194304 };
void *D_8007229C[5] = { &D_800DA200, &D_800DA3AC, &D_800DA598, &D_8006CCDC, &D_800023E4 };
s32 D_800722B0 = 0;
s16 D_800722B4[4] = { 5, -256, 0, 0 };
s32 D_800722BC = 404490256; /* UNRESOLVED: size-only typing */
s32 D_800722C0 = 50727945; /* UNRESOLVED: size-only typing */
void *D_800722C4[4] = { &D_800DAA58, &D_800DAB68, &D_800DAC54, &D_800DAD5C };
struct D_800722D4_s { u8 f_800722d4; u8 f_800722d5[3]; } D_800722D4 = { 3, { 4, 4, 0 } }; /* members: D_800722D4, D_800722D5 */
void *D_800722D8[3] = { &D_800722BC, &D_800722C0, &D_800722C4 };
s32 D_800722E4[7] = { 100664320, -2146586940, 100597760, 0, 0, 0, 0 };
struct D_80072300_s { u8 f_80072300; u8 f_80072301[31]; } D_80072300 = { 0, { 0, 1, 8, 1, 7, 1, 6, 1, 5, 1, 4, 1, 3, 1, 2, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1 } }; /* members: D_80072300, D_80072301 */
s32 D_80072320 = 0;
s32 D_80072324 = 0;
s32 D_80072328 = 0;
s32 D_8007232C = 0;
s32 D_80072330 = 0;
s32 D_80072334 = 0;
u8 D_80072338[16] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0, 0 };
s32 D_80072348[14] = { 460800, 460800, 460800, 460800, 921600, 921600, 921600, 921600, 1843200, 1843200, 1843200, 1843200, 3686400, 3686400 };
s32 D_80072380[3] = { 0, 1212501072, 0 };
s32 D_8007238C = 1;
s32 D_80072390 = 0;
void *D_80072394[4] = { 0, 0, 0, &D_800DE370 };
void *D_800723A4[4] = { 0, 0, 0, &D_800DE370 };
void *D_800723B4[5] = { 0, 0, 0, &D_800DE370, 0 };
u8 D_800723C8[7] = { 0, 0, 0, 0, 255, 4, 1 };
u8 D_800723CF = 3;
u8 D_800723D0[4] = { 3, 0, 0, 0 };
void *D_800723D4[2] = { &D_80072394, &D_80072394 };
s32 D_800723DC = 0;
s32 D_800723E0 = 421068800; /* UNRESOLVED: size-only typing */
void *D_800723E4[2] = { &D_800DF394, &D_800DF508 };
s32 D_800723EC[8] = { 0, -2146568688, 0, 0, 0, 0, 65536, 16843008 };
void *D_8007240C[2] = { &D_800723E4, &D_800723E0 };
s32 D_80072414[3] = { 0, -64512, 84279296 };
void *D_80072420[2] = { &D_800DF6E4, &D_800DF5B0 };
s32 D_80072428[6] = { 0, 0, 0, 0, 0, 0 };
void *D_80072440[7] = { &D_800DE900, &D_800DE998, &D_800DED64, &D_800DED00, &D_800DAF30, &D_800DB1F8, &D_800DB220 };
s32 D_8007245C = 0;
s32 D_80072460[2] = { 0, 0 };
s32 D_80072468[2] = { 0, 0 };
s32 D_80072470 = 12;
void *D_80072474[12] = { &D_8000259C, &D_80002598, &D_80002594, &D_80002590, &D_8000258C, &D_80002588, &D_80002584, &D_80002580, &D_8000257C, &D_80002578, &D_80002574, &D_80002570 };
s32 D_800724A4 = 0;
u8 D_800724A8[4] = { 1, 0, 0, 0 };
s32 D_800724AC[11] = { 6, 146, 147, 148, 149, 150, 151, 0, 0, 0, 0 };
s16 D_800724D8 = 840;
u8 D_800724DA = 0;
u8 D_800724DB = 0;
s32 D_800724DC = 0;
s32 D_800724E0 = 0;
s32 D_800724E4 = 0;
s32 D_800724E8 = 0;
s32 D_800724EC = 0;
s16 D_800724F0[4] = { 0, 0, 0, 0 };
struct D_800724F8_s { u8 f_800724f8; u8 f_800724f9[3]; } D_800724F8 = { 0, { 0, 0, 0 } }; /* members: D_800724F8, D_800724F9 */
s32 D_800724FC = 1090519040;
void *D_80072500[5] = { &D_8009E3EC, &D_8009E528, &D_8009E68C, &D_800C19C0, &D_80002690 };
s32 D_80072514[3] = { 0, 392960, 4194304 };
s32 D_80072520 = 84803584; /* UNRESOLVED: size-only typing */
s32 D_80072524 = 17367040; /* UNRESOLVED: size-only typing */
void *D_80072528[2] = { &D_8009E764, &D_8009E78C };
struct D_80072530_s { u8 f_80072530; u8 f_80072531[3]; } D_80072530 = { 8, { 16, 2, 0 } }; /* members: D_80072530, D_80072531 */
void *D_80072534[3] = { &D_80072520, &D_80072524, &D_80072528 };
s32 D_80072540[6] = { 100705280, -2146834676, 83886080, 0, 2, 2 };
void *D_80072558[5] = { &D_8009EA50, &D_8009ECD8, &D_8009EFB8, &D_800C1A14, &D_80002704 };
s32 D_8007256C[3] = { 0, 392960, 4194304 };
s32 D_80072578 = 84809216;
s32 D_8007257C = 17371392;
void *D_80072580[3] = { &D_8009F360, &D_8009F388, &D_8009F3C8 };
void *D_8007258C[5] = { &D_8009F454, &D_8009F4E8, &D_8009F5EC, &D_8006C560, &D_80002774 };
s32 D_800725A0[3] = { 0, 392960, 0 };
void *D_800725AC[3] = { &D_800027A4, 0, 0 };
void *D_800725B8[4] = { 0, &D_80002798, 0, 0 };
void *D_800725C8[2] = { &D_800A8528, &D_80002784 };
void *D_800725D0[3] = { 0, 0, &D_800A8500 };
s32 D_800725DC[4] = { 720896, 0, -16709117, 50331648 };
void *D_800725EC[2] = { &D_800725AC, &D_800725AC };
void *D_800725F4[5] = { &D_8009F698, &D_8009FD98, &D_800A0144, &D_800C197C, &D_800027B4 };
s32 D_80072608[2] = { 0, 392960 };
s32 D_80072610 = 0;
s32 D_80072614 = 30;
s32 D_80072618[6] = { 30, -370, -370, -85, -250, -170 };
void *D_80072630[5] = { &D_800A0720, &D_800A0DA4, &D_800A0FD4, &D_800C197C, &D_800027B4 };
s32 D_80072644[3] = { 0, 392960, 0 };
s16 D_80072650[16] = { 30, 30, 30, 30, -582, -582, -582, -582, -65, -65, -485, -485, -95, -450, -285, 0 };
s16 D_80072670[16] = { 10, -40, -80, -120, 0, -40, -80, -120, -10, -120, -10, -120, -65, -65, -65, 0 };
void *D_80072690[3] = { &D_800B9CD8, &D_800C6AD4, &D_800B9CF8 };
void *D_8007269C[5] = { 0, &D_800C6AD4, 0, &D_800C6A94, 0 };
void *D_800726B0[2] = { &D_800B9CF8, &D_800C6A94 };
s32 D_800726B8[2] = { 0, 0 };
void *D_800726C0[2] = { &D_800B9D18, &D_800C6FB4 };
s32 D_800726C8[2] = { 0, 0 };
s32 D_800726D0[2] = { 0, 0 };
s32 D_800726D8[5] = { 16384, 32768, 4, 8224, 16 };
s32 D_800726EC[3] = { 16843010, 16974080, 17039360 };
s32 D_800726F8[5] = { 0, 0, 0, 0, 0 };
s32 D_8007270C = 0;
u8 D_80072710[8] = { 136, 133, 130, 127, 124, 121, 118, 115 };
u8 D_80072718[8] = { 96, 94, 92, 90, 88, 86, 84, 82 };
void *D_80072720[4] = { &D_80069C2C, &D_80069C40, &D_80069C54, &D_80069C68 };
s16 D_80072730[18] = { 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 0, 8 };
s32 D_80072754 = 0;
s32 D_80072758[6] = { 0, 0, 0, 0, 0, 0 };
s32 D_80072770 = 0;
s32 D_80072774[3] = { 2, -2146930396, 0 };
void *D_80072780[1] = { &D_800E2474 };
void *D_80072784[1] = { &D_800E2474 };
void *D_80072788[1] = { &D_800BB644 };
void *D_8007278C[1] = { &D_800E247C };
void *D_80072790[291] = { &D_800E2474, &D_800E2484, &D_800E24C4, &D_800BB610, &D_800E247C, &D_800E2474, &D_800E24FC, &D_800E25EC, &D_800BB644, &D_800E2A58, &D_800E24FC, &D_800E2734, &D_800E2824, &D_800E2474, &D_800E2A58, &D_800E2734, &D_800E2A70, &D_800E2C08, &D_800BB6EC, &D_800E2474, &D_800E2474, &D_800E2D0C, &D_800E32BC, &D_800BB728, &D_800E2474, &D_800E2474, &D_800E3560, &D_800E3630, &D_800BB728, &D_800E2474, &D_800E2474, &D_800E2474, &D_800E37A8, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D1D84, &D_800D1E3C, &D_800BB170, &D_800E247C, &D_800E2474, &D_800CDB88, &D_800CDBD0, &D_800BAC0C, &D_800E247C, &D_800CDB88, &D_800CE508, &D_800CE6BC, &D_800BB644, &D_800E247C, &D_800CE7B4, &D_800CEA34, &D_800CECC4, &D_800E2474, &D_800E2474, &D_800E2474, &D_800CED70, &D_800CED94, &D_800BB644, &D_800E247C, &D_800CED70, &D_800E3840, &D_800E384C, &D_800BB644, &D_800E247C, &D_800E3840, &D_800CF674, &D_800CF7F0, &D_800BB0B4, &D_800E2474, &D_800E2474, &D_800CFBF8, &D_800CFE28, &D_800BB644, &D_800E247C, &D_800CFBF8, &D_800D0158, &D_800D0188, &D_800BB644, &D_800E247C, &D_800D0158, &D_800D0AB0, &D_800D0AD8, &D_800BB644, &D_800E247C, &D_800D0AB0, &D_800D632C, &D_800D636C, &D_800BB644, &D_800E247C, &D_800D632C, &D_800D0D28, &D_800D0E60, &D_800BAE7C, &D_800E247C, &D_800D0D28, &D_800D196C, &D_800D1A18, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D1B08, &D_800D1BBC, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D72AC, &D_800D733C, &D_800BB644, &D_800E247C, &D_800D779C, &D_800E33E4, &D_800E344C, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D1C68, &D_800D1CD4, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D77E4, &D_800D7A48, &D_800BB644, &D_800E247C, &D_800D77E4, &D_800E39BC, &D_800E3E30, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D03DC, &D_800D0598, &D_800BB644, &D_800E247C, &D_800D03DC, &D_800D847C, &D_800D8484, &D_800BB644, &D_800E247C, &D_800D847C, &D_800CE804, &D_800CE844, &D_800BB644, &D_800E247C, &D_800CE804, &D_800D8B18, &D_800D8B68, &D_800BB684, &D_800E247C, &D_800D8B18, &D_800D8E1C, &D_800D8E90, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D8F64, &D_800D902C, &D_800BECE4, &D_800E2474, &D_800E2474, &D_800D9694, &D_800D96E4, &D_800BECE4, &D_800E2474, &D_800E2474, &D_800D9BF0, &D_800D9C10, &D_800BB728, &D_800E2474, &D_800E2474, &D_800D9D58, &D_800D9DD0, &D_800BECE4, &D_800E2474, &D_800E2474, &D_800D8538, &D_800D856C, &D_800BB644, &D_800E247C, &D_800E2474, &D_800D2260, &D_800D24F4, &D_800E2474, &D_800E2474, &D_800E2474, &D_800D2BF4, &D_800D2C70, &D_800BB644, &D_800E2474, &D_800E2474, &D_800D2EB4, &D_800D2F68, &D_800BB644, &D_800E2474, &D_800E2474, &D_800D306C, &D_800D31A0, &D_800BAE4C, &D_800E2474, &D_800E2474, &D_800D331C, &D_800D3374, &D_800E2474, &D_800E2474, &D_800E2474, &D_800D33F4, &D_800D350C, &D_800E2474, &D_800E2474, &D_800E2474, &D_800DA180, &D_800DA1B8, &D_800BB644, &D_800E247C, &D_800DA180, &D_800DA3D0, &D_800DA408, &D_800BB644, &D_800E247C, &D_800DA3D0, &D_800DA624, &D_800DA668, &D_800BB644, &D_800E247C, &D_800DA624, &D_800DAC50, &D_800DAC70, &D_800BB644, &D_800E247C, &D_800DAC50, &D_800D01E0, &D_800D0218, &D_800BB644, &D_800E247C, &D_800D01E0, &D_800DAE44, &D_800DAFCC, &D_800BB644, &D_800E247C, &D_800DAE44, &D_800DB050, &D_800DB058, &D_800BB644, &D_800E247C, &D_800DB050, &D_800D3618, &D_800D3784, &D_800BB644, &D_800E247C, &D_800D3618, &D_800E3F18, &D_800E42BC, &D_800E2474, &D_800E2474, &D_800E2474, &D_8009F350, &D_8009F37C, &D_800E2474, &D_800E247C, &D_8009F350, &D_8009FC00, &D_8009FC44, &D_800E2474, &D_800E247C, &D_8009FC00, &D_800A03E4, &D_800A03F0, &D_800E2474, &D_800E247C, &D_800A03E4, &D_800A10D8, &D_800A10E4, &D_800E2474, &D_800E247C, &D_800A10D8, &D_800A125C, &D_800A12A4, &D_800E2474, &D_800E247C, &D_800A125C, &D_800A167C, &D_800A16AC, &D_800E2474, &D_800E247C, &D_800A167C, &D_800A13B8, &D_800A13C0, &D_800E2474, &D_800E247C, &D_800A13B8 };
u8 D_80072C1C[60] = { 0, 1, 3, 3, 3, 1, 0, 0, 0, 0, 3, 2, 0, 0, 1, 0, 3, 0, 0, 0, 3, 0, 2, 0, 1, 3, 0, 3, 0, 1, 1, 1, 0, 0, 0, 1, 3, 1, 2, 0, 2, 0, 1, 3, 3, 3, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
s32 D_80072C58[16] = { 1518080, 1518849, 1518337, 1518081, 1518336, 1518592, 1518848, 1519104, 1519872, 1519616, 1520385, 1517824, 1520896, 1521152, 1520128, 1520384 };
s32 D_80072C98[33] = { -7274522, 3014659, 0, -6225946, 3014659, 0, -12517696, 3014659, 0, -8323392, 3014659, 0, -4129088, 3014659, 0, 65216, 3014659, 0, 4259520, 3014659, 0, 8453824, 3014659, 0, 12648128, 3014659, 0, 16842432, 3014659, 0, 21036736, 3014659, 0 };
s32 D_80072D1C[2] = { 0, 1536 };
void *D_80072D24[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_80072D3C[2] = { 0, 0 };
s32 D_80072D44[33] = { -7340006, 3014659, -2147483648, -6291430, 3014659, -2147483648, -12582592, 3014659, -2147483648, -8388288, 3014659, -2147483648, -4193984, 3014659, -2147483648, 320, 3014659, -2147483648, 4194624, 3014659, -2147483648, 8388928, 3014659, -2147483648, 12583232, 3014659, -2147483648, 16777536, 3014659, -2147483648, 20971840, 3014659, -2147483648 };
s32 D_80072DC8[2] = { 0, 1536 };
void *D_80072DD0[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_80072DE8[2] = { 0, 0 };
struct D_80072DF0_s { s16 f_80072df0[3]; u8 f_80072df6[2]; } D_80072DF0 = { { 0, 0, 80 }, { 0, 0 } }; /* members: D_80072DF0, D_80072DF6 */
void *D_80072DF8[3] = { &D_8006AFA8, &D_8006B024, &D_8006B06C };
void *D_80072E04[1] = { &D_8006B1AC };
void *D_80072E08[2] = { &D_8006B160, &D_8006B1E4 };
s32 D_80072E10[4] = { 0, -2147043508, 65536, 256 };
void *D_80072E20[6] = { &D_8006AFA8, &D_8006B018, &D_8006B0CC, &D_8006B144, &D_8006B16C, &D_8006B1EC };
s32 D_80072E38[4] = { 0, 0, 0, 512 };
void *D_80072E48[6] = { &D_8006AFA8, &D_8006B018, &D_8006B0C0, &D_8006B144, &D_8006B170, &D_8006B1F0 };
s32 D_80072E60[4] = { 0, 0, 524288, 20185856 };
void *D_80072E70[8] = { &D_8006AFC0, &D_8006B018, &D_8006B0E4, &D_8006B1AC, &D_8006B17C, &D_8006B230, &D_800C5808, &D_8006B77C };
s32 D_80072E90[2] = { 524288, 16778240 };
void *D_80072E98[6] = { &D_8006AFFC, &D_8006B018, &D_8006B114, &D_8006B144, &D_8006D420, &D_8006B1F4 };
s32 D_80072EB0[4] = { 0, 0, 524288, 16778496 };
void *D_80072EC0[7] = { &D_8006B008, &D_8006B018, &D_8006B120, &D_8006B144, &D_8006B144, &D_8006B1F8, &D_800C58E4 };
s32 D_80072EDC[3] = { 0, 0, 1536 };
void *D_80072EE8[6] = { &D_8006AFA8, &D_8006B018, &D_8006B138, &D_8006B144, &D_8006DF70, &D_8006B1F8 };
s32 D_80072F00[4] = { 0, 0, 0, 1792 };
void *D_80072F10[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_80072F28[4] = { 0, 0, 0, 2048 };
void *D_80072F38[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B1DC, &D_8006B1DC, &D_8006B1E4 };
s32 D_80072F50[2] = { 0, 0 };
s32 D_80072F58[2] = { 0, 2304 };
void *D_80072F60[6] = { &D_8006AFA8, &D_8006B018, &D_8006B12C, &D_8006B144, &D_8006D0E4, &D_8006B1F8 };
s32 D_80072F78[4] = { 0, 0, 0, 4590080 };
void *D_80072F88[6] = { &D_8006AFA8, &D_8006B030, &D_8006B078, &D_8006B1AC, &D_8006B15C, &D_8006B1FC };
s32 D_80072FA0[4] = { 0, -2147043500, 0, 4786944 };
void *D_80072FB0[6] = { &D_8006AFA8, &D_8006B03C, &D_8006B090, &D_8006B1AC, &D_8006B14C, &D_8006B204 };
s32 D_80072FC8[4] = { 0, -2147043468, 0, 5114880 };
void *D_80072FD8[6] = { &D_8006AFA8, &D_8006B048, &D_8006B084, &D_8006B1AC, &D_8006B180, &D_8006B20C };
s32 D_80072FF0[4] = { 0, -2147043484, 0, 5442816 };
void *D_80073000[6] = { &D_8006AFA8, &D_8006B054, &D_8006B0A8, &D_8006B1AC, &D_8006B188, &D_8006B214 };
s32 D_80073018[4] = { 0, -2147043476, 0, 3214848 };
void *D_80073028[6] = { &D_8006AFA8, &D_8006B060, &D_8006B09C, &D_8006B1AC, &D_8006B190, &D_8006B218 };
s32 D_80073040[4] = { 0, -2147043492, 524288, 21434112 };
void *D_80073050[8] = { &D_8006AFB4, &D_8006B018, &D_8006B108, &D_8006B1AC, &D_8006B154, &D_8006B220, &D_800C58B8, &D_8006B79C };
s32 D_80073070[2] = { 524288, 20123648 };
void *D_80073078[8] = { &D_8006AFCC, &D_8006B018, &D_8006B0D8, &D_8006B1AC, &D_8006B178, &D_8006B224, &D_800C5834, &D_8006B784 };
s32 D_80073098[2] = { 524288, 21893376 };
void *D_800730A0[8] = { &D_8006AFD8, &D_8006B018, &D_8006B0F0, &D_8006B1AC, &D_8006B19C, &D_8006B228, &D_800C5860, &D_8006B78C };
s32 D_800730C0[2] = { 524288, 21238272 };
void *D_800730C8[8] = { &D_8006AFE4, &D_8006B018, &D_8006B0FC, &D_8006B1AC, &D_8006B1A4, &D_8006B22C, &D_800C588C, &D_8006B794 };
s32 D_800730E8[2] = { 0, 5247744 };
void *D_800730F0[6] = { &D_8006AFA8, &D_8006B024, &D_8006B06C, &D_8006B1C0, &D_8006B160, &D_8006B1E4 };
s32 D_80073108[4] = { 0, -2147043508, 0, 5248000 };
void *D_80073118[6] = { &D_8006AFA8, &D_8006B024, &D_8006B06C, &D_8006B1B4, &D_8006B160, &D_8006B1E4 };
s32 D_80073130[4] = { 0, -2147043508, 0, 5248256 };
void *D_80073140[6] = { &D_8006AFA8, &D_8006B024, &D_8006B06C, &D_8006B1B8, &D_8006B160, &D_8006B1E4 };
s32 D_80073158[4] = { 0, -2147043508, 0, 4593152 };
void *D_80073168[6] = { &D_8006AFA8, &D_8006B030, &D_8006B078, &D_8006B1C0, &D_8006B15C, &D_8006B1FC };
s32 D_80073180[4] = { 0, -2147043500, 0, 4593408 };
void *D_80073190[6] = { &D_8006AFA8, &D_8006B030, &D_8006B078, &D_8006B1B4, &D_8006B15C, &D_8006B1FC };
s32 D_800731A8[4] = { 0, -2147043500, 0, 4593664 };
void *D_800731B8[6] = { &D_8006AFA8, &D_8006B030, &D_8006B078, &D_8006B1B8, &D_8006B15C, &D_8006B1FC };
s32 D_800731D0[4] = { 0, -2147043500, 0, 4790528 };
void *D_800731E0[6] = { &D_8006AFA8, &D_8006B03C, &D_8006B090, &D_8006B1C0, &D_8006B14C, &D_8006B204 };
s32 D_800731F8[4] = { 0, -2147043468, 0, 4790784 };
void *D_80073208[6] = { &D_8006AFA8, &D_8006B03C, &D_8006B090, &D_8006B1B4, &D_8006B14C, &D_8006B204 };
s32 D_80073220[4] = { 0, -2147043468, 0, 4791040 };
void *D_80073230[6] = { &D_8006AFA8, &D_8006B03C, &D_8006B090, &D_8006B1B8, &D_8006B14C, &D_8006B204 };
s32 D_80073248[4] = { 0, -2147043468, 0, 4791296 };
void *D_80073258[6] = { &D_8006AFA8, &D_8006B03C, &D_8006B090, &D_8006B1D0, &D_8006B14C, &D_8006B204 };
s32 D_80073270[4] = { 0, 0, 0, 5119232 };
void *D_80073280[6] = { &D_8006AFA8, &D_8006B048, &D_8006B084, &D_8006B1C0, &D_8006B180, &D_8006B20C };
s32 D_80073298[4] = { 0, -2147043484, 0, 5119488 };
void *D_800732A8[6] = { &D_8006AFA8, &D_8006B048, &D_8006B084, &D_8006B1B4, &D_8006B180, &D_8006B20C };
s32 D_800732C0[4] = { 0, -2147043484, 0, 5119744 };
void *D_800732D0[6] = { &D_8006AFA8, &D_8006B048, &D_8006B084, &D_8006B1B8, &D_8006B180, &D_8006B20C };
s32 D_800732E8[4] = { 0, -2147043484, 0, 5447680 };
void *D_800732F8[6] = { &D_8006AFA8, &D_8006B054, &D_8006B0A8, &D_8006B1C8, &D_8006B188, &D_8006B214 };
s32 D_80073310[4] = { 0, -2147043476, 0, 3219712 };
void *D_80073320[6] = { &D_8006AFA8, &D_8006B060, &D_8006B09C, &D_8006B1C8, &D_8006B190, &D_8006B218 };
s32 D_80073338[4] = { 0, -2147043492, 0, 3219968 };
void *D_80073348[6] = { &D_8006AFA8, &D_8006B060, &D_8006B09C, &D_8006B1B4, &D_8006B190, &D_8006B218 };
s32 D_80073360[4] = { 0, -2147043492, 0, 3220224 };
void *D_80073370[6] = { &D_8006AFA8, &D_8006B060, &D_8006B09C, &D_8006B1B8, &D_8006B190, &D_8006B218 };
s32 D_80073388[4] = { 0, -2147043492, 0, 1536 };
void *D_80073398[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_800733B0[4] = { 0, 0, 0, 1536 };
void *D_800733C0[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_800733D8[4] = { 0, 0, 0, 2304 };
void *D_800733E8[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_80073400[4] = { 0, 0, 0, 2304 };
void *D_80073410[6] = { &D_8006AFA8, &D_8006B018, &D_8006B06C, &D_8006B144, &D_8006B144, &D_8006B1F8 };
s32 D_80073428[2] = { 0, 0 };
s32 D_80073430 = 0;
s32 D_80073434 = 0;
s32 D_80073438 = 0;
s32 D_8007343C = 0;
s32 D_80073440 = 1;
s16 D_80073444 = 2;
s16 D_80073446 = 0;
s32 D_80073448 = 18022400; /* UNRESOLVED: size-only typing */
s32 D_8007344C = 338755584; /* UNRESOLVED: size-only typing */
char D_80073450[8] = "2;Zc";
char D_80073458[8] = "<O2;";
char D_80073460[4] = "PY";
char D_80073464[4] = "<O";
char D_80073468[8] = "Zc<O";
void *D_80073470[23] = { &D_80073448, &D_8007344C, &D_8007344C, &D_80073460, &D_80073460, &D_80073464, &D_80073464, &D_80073458, &D_80073464, &D_80073464, &D_80073468, &D_80073468, &D_80073468, &D_80073450, &D_80073450, &D_80073450, &D_80073450, &D_8007344C, &D_8007344C, &D_8007344C, &D_8007344C, &D_80073448, &D_80073448 };
s32 D_800734CC[3] = { 100991746, 117702911, 134875393 };
s32 D_800734D8[4] = { 100991746, 67332, 134875647, 0 };
s32 D_800734E8 = 1;
s32 D_800734EC = 1;
void *D_800734F0[2] = { &D_800420A0, &D_800420A8 };
s32 D_800734F8 = -1;
u8 D_800734FC[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
s16 D_80073504 = 0;
s16 D_80073506 = 9;
struct D_80073508_s { s16 f_80073508; s16 f_8007350a[3]; } D_80073508 = { 0, { 3, 0, 0 } }; /* members: D_80073508, D_8007350A */
u8 D_80073510[12] = { 31, 32, 33, 34, 35, 36, 38, 39, 40, 0, 0, 0 };
u8 D_8007351C[7] = { 0, 221, 0, 35, 128, 128, 255 };
u8 D_80073523 = 1;
struct D_80073524_s { u8 f_80073524; u8 f_80073525[1959]; } D_80073524 = { 0, { 55, 50, 44, 54, 48, 56, 0, 0, 222, 0, 31, 247, 247, 222, 46, 1, 55, 48, 44, 53, 48, 48, 0, 0, 223, 0, 28, 128, 128, 255, 1, 2, 53, 52, 44, 54, 48, 48, 0, 0, 224, 0, 37, 128, 128, 255, 3, 0, 56, 48, 44, 50, 57, 48, 0, 0, 225, 0, 33, 128, 128, 255, 1, 2, 55, 50, 44, 56, 48, 48, 0, 0, 226, 0, 39, 128, 128, 255, 1, 0, 54, 54, 44, 57, 52, 54, 0, 0, 227, 0, 33, 128, 128, 255, 3, 2, 54, 48, 44, 51, 56, 57, 0, 0, 228, 0, 31, 128, 128, 255, 7, 0, 54, 53, 44, 48, 50, 52, 0, 0, 229, 0, 36, 128, 128, 255, 1, 2, 55, 54, 44, 50, 55, 51, 0, 0, 230, 0, 50, 233, 226, 202, 46, 1, 56, 48, 44, 53, 48, 48, 0, 0, 231, 0, 38, 128, 128, 255, 1, 0, 53, 57, 44, 53, 52, 51, 0, 0, 233, 0, 45, 128, 128, 255, 1, 0, 54, 51, 44, 48, 54, 56, 0, 0, 234, 0, 38, 231, 231, 231, 14, 1, 54, 48, 44, 49, 50, 57, 0, 0, 235, 0, 35, 128, 128, 255, 1, 0, 55, 51, 44, 48, 48, 48, 0, 0, 236, 0, 30, 128, 128, 255, 1, 2, 55, 56, 44, 48, 54, 55, 0, 0, 237, 0, 36, 128, 128, 255, 17, 0, 55, 51, 44, 48, 48, 48, 0, 0, 238, 0, 35, 222, 206, 181, 14, 1, 54, 51, 44, 48, 48, 48, 0, 0, 239, 0, 31, 128, 128, 255, 1, 2, 54, 48, 44, 55, 57, 52, 0, 0, 240, 0, 25, 33, 33, 26, 14, 1, 54, 57, 44, 48, 54, 53, 0, 0, 241, 0, 36, 128, 128, 255, 3, 0, 55, 55, 44, 51, 49, 49, 0, 0, 242, 0, 36, 128, 128, 255, 3, 2, 55, 54, 44, 56, 57, 49, 0, 0, 243, 0, 41, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 244, 0, 50, 128, 128, 255, 3, 2, 54, 53, 44, 51, 53, 54, 0, 0, 245, 0, 26, 128, 128, 255, 3, 0, 53, 57, 44, 52, 57, 50, 0, 0, 246, 0, 33, 165, 156, 156, 14, 1, 54, 53, 44, 51, 48, 48, 0, 0, 247, 0, 37, 128, 128, 255, 17, 2, 54, 48, 44, 56, 51, 53, 0, 0, 248, 0, 48, 128, 128, 255, 17, 0, 54, 54, 44, 52, 53, 53, 0, 0, 249, 0, 33, 231, 222, 214, 14, 1, 54, 52, 44, 57, 56, 52, 0, 0, 250, 0, 31, 128, 128, 255, 1, 2, 55, 52, 44, 51, 48, 49, 0, 0, 251, 0, 44, 128, 128, 255, 1, 0, 55, 56, 44, 54, 48, 48, 0, 0, 232, 0, 33, 128, 128, 255, 3, 2, 53, 48, 44, 48, 51, 52, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 253, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 254, 0, 39, 128, 128, 255, 1, 0, 54, 48, 44, 56, 51, 53, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 221, 0, 35, 128, 128, 255, 1, 0, 55, 50, 44, 54, 48, 56, 0, 0, 222, 0, 31, 247, 247, 222, 46, 1, 55, 48, 44, 53, 48, 48, 0, 0, 223, 0, 28, 128, 128, 255, 1, 2, 53, 52, 44, 54, 48, 48, 0, 0, 224, 0, 37, 128, 128, 255, 3, 0, 56, 48, 44, 50, 57, 48, 0, 0, 225, 0, 33, 128, 128, 255, 1, 2, 55, 50, 44, 56, 48, 48, 0, 0, 226, 0, 39, 128, 128, 255, 1, 0, 54, 54, 44, 57, 52, 54, 0, 0, 227, 0, 33, 128, 128, 255, 3, 2, 54, 48, 44, 51, 56, 57, 0, 0, 228, 0, 31, 128, 128, 255, 7, 0, 54, 53, 44, 48, 50, 52, 0, 0, 229, 0, 36, 128, 128, 255, 1, 2, 55, 54, 44, 50, 55, 51, 0, 0, 230, 0, 50, 233, 226, 202, 46, 1, 56, 48, 44, 53, 48, 48, 0, 0, 231, 0, 38, 128, 128, 255, 1, 0, 53, 57, 44, 53, 52, 51, 0, 0, 233, 0, 45, 128, 128, 255, 1, 0, 54, 51, 44, 48, 54, 56, 0, 0, 234, 0, 38, 231, 231, 231, 14, 1, 54, 48, 44, 49, 50, 57, 0, 0, 235, 0, 35, 128, 128, 255, 1, 0, 55, 51, 44, 48, 48, 48, 0, 0, 236, 0, 30, 128, 128, 255, 1, 2, 55, 56, 44, 48, 54, 55, 0, 0, 237, 0, 36, 128, 128, 255, 17, 0, 55, 51, 44, 48, 48, 48, 0, 0, 238, 0, 35, 222, 206, 181, 14, 1, 54, 51, 44, 48, 48, 48, 0, 0, 239, 0, 31, 128, 128, 255, 1, 2, 54, 48, 44, 55, 57, 52, 0, 0, 240, 0, 25, 33, 33, 26, 14, 1, 54, 57, 44, 48, 54, 53, 0, 0, 241, 0, 36, 128, 128, 255, 3, 0, 55, 55, 44, 51, 49, 49, 0, 0, 242, 0, 36, 128, 128, 255, 3, 2, 55, 54, 44, 56, 57, 49, 0, 0, 243, 0, 41, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 244, 0, 50, 128, 128, 255, 3, 2, 54, 53, 44, 51, 53, 54, 0, 0, 245, 0, 26, 128, 128, 255, 3, 0, 53, 57, 44, 52, 57, 50, 0, 0, 246, 0, 33, 165, 156, 156, 14, 1, 54, 53, 44, 51, 48, 48, 0, 0, 247, 0, 37, 128, 128, 255, 17, 2, 54, 48, 44, 56, 51, 53, 0, 0, 248, 0, 48, 128, 128, 255, 17, 0, 54, 54, 44, 52, 53, 53, 0, 0, 249, 0, 33, 231, 222, 214, 14, 1, 54, 52, 44, 57, 56, 52, 0, 0, 250, 0, 31, 128, 128, 255, 1, 2, 55, 52, 44, 51, 48, 49, 0, 0, 251, 0, 44, 128, 128, 255, 1, 0, 55, 56, 44, 54, 48, 48, 0, 0, 232, 0, 33, 128, 128, 255, 3, 2, 53, 48, 44, 48, 51, 52, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 253, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 254, 0, 39, 128, 128, 255, 1, 0, 54, 48, 44, 56, 51, 53, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 221, 0, 35, 128, 128, 255, 1, 0, 55, 50, 44, 54, 48, 56, 0, 0, 222, 0, 31, 247, 247, 222, 46, 1, 55, 48, 44, 53, 48, 48, 0, 0, 223, 0, 28, 128, 128, 255, 1, 2, 53, 52, 44, 54, 48, 48, 0, 0, 224, 0, 37, 128, 128, 255, 3, 0, 56, 48, 44, 50, 57, 48, 0, 0, 225, 0, 33, 128, 128, 255, 1, 2, 55, 50, 44, 56, 48, 48, 0, 0, 226, 0, 39, 128, 128, 255, 1, 0, 54, 54, 44, 57, 52, 54, 0, 0, 227, 0, 33, 128, 128, 255, 3, 2, 54, 48, 44, 51, 56, 57, 0, 0, 228, 0, 31, 128, 128, 255, 7, 0, 54, 53, 44, 48, 50, 52, 0, 0, 229, 0, 36, 128, 128, 255, 1, 2, 55, 54, 44, 50, 55, 51, 0, 0, 230, 0, 50, 233, 226, 202, 46, 1, 56, 48, 44, 53, 48, 48, 0, 0, 231, 0, 38, 128, 128, 255, 1, 0, 53, 57, 44, 53, 52, 51, 0, 0, 233, 0, 45, 128, 128, 255, 1, 0, 54, 51, 44, 48, 54, 56, 0, 0, 234, 0, 38, 231, 231, 231, 14, 1, 54, 48, 44, 49, 50, 57, 0, 0, 235, 0, 35, 128, 128, 255, 1, 0, 55, 51, 44, 48, 48, 48, 0, 0, 236, 0, 30, 128, 128, 255, 1, 2, 55, 56, 44, 48, 54, 55, 0, 0, 237, 0, 36, 128, 128, 255, 17, 0, 55, 51, 44, 48, 48, 48, 0, 0, 238, 0, 35, 222, 206, 181, 14, 1, 54, 51, 44, 48, 48, 48, 0, 0, 239, 0, 31, 128, 128, 255, 1, 2, 54, 48, 44, 55, 57, 52, 0, 0, 240, 0, 25, 33, 33, 26, 14, 1, 54, 57, 44, 48, 54, 53, 0, 0, 241, 0, 36, 128, 128, 255, 3, 0, 55, 55, 44, 51, 49, 49, 0, 0, 242, 0, 36, 128, 128, 255, 3, 2, 55, 54, 44, 56, 57, 49, 0, 0, 243, 0, 41, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 244, 0, 50, 128, 128, 255, 3, 2, 54, 53, 44, 51, 53, 54, 0, 0, 245, 0, 26, 128, 128, 255, 3, 0, 53, 57, 44, 52, 57, 50, 0, 0, 246, 0, 33, 165, 156, 156, 14, 1, 54, 53, 44, 51, 48, 48, 0, 0, 247, 0, 37, 128, 128, 255, 17, 2, 54, 48, 44, 56, 51, 53, 0, 0, 248, 0, 48, 128, 128, 255, 17, 0, 54, 54, 44, 52, 53, 53, 0, 0, 249, 0, 33, 231, 222, 214, 14, 1, 54, 52, 44, 57, 56, 52, 0, 0, 250, 0, 31, 128, 128, 255, 1, 2, 55, 52, 44, 51, 48, 49, 0, 0, 251, 0, 44, 128, 128, 255, 1, 0, 55, 56, 44, 54, 48, 48, 0, 0, 232, 0, 33, 128, 128, 255, 3, 2, 53, 48, 44, 48, 51, 52, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 253, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 254, 0, 39, 128, 128, 255, 1, 0, 54, 48, 44, 56, 51, 53, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0, 0, 252, 0, 45, 128, 128, 255, 1, 0, 52, 55, 44, 51, 49, 51, 0 } }; /* members: D_80073524, D_80073525 */
s16 D_80073CCC = 1;
s16 D_80073CCE = 768;
s16 D_80073CD0 = 768;
s16 D_80073CD2 = 768;
s16 D_80073CD4 = 256;
s16 D_80073CD6 = 256;
s16 D_80073CD8[16] = { 256, 3, 256, 1621, 2986, 192, 160, 256, 1, 256, 256, 256, 368, 256, 256, 0 };
char D_80073CF8[12] = "tuvwxyz{|";
void *D_80073D04[9] = { &D_80002D08, &D_80002D04, &D_80002CFC, &D_80002CF0, &D_80002CE4, &D_80002CD8, &D_80002CCC, &D_80002CC0, &D_80002CB8 };
u8 D_80073D28[28] = { 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0 };
s32 D_80073D44 = 16777216;
void *D_80073D48[2] = { &D_800B9BE0, &D_800B9C38 };
void *D_80073D50[5] = { &D_800B9C70, &D_800B9CC4, &D_800B9D88, &D_800B9DE0, &D_800B9E90 };
s32 D_80073D64 = 0;
struct D_80073D68_s { s16 f_80073d68; s16 f_80073d6a[3]; } D_80073D68 = { 1, { 1, 0, 0 } }; /* members: D_80073D68, D_80073D6A */
s32 D_80073D70[3] = { 0, 32, 524288 };
s32 D_80073D7C[3] = { -3342336, 59, 262144 };
s16 D_80073D88[6] = { 51, 0, 0, 59, 4, 0 };
s32 D_80073D94[3] = { -62849824, 52429760, 0 };
void *D_80073DA0[11] = { &D_8006E298, &D_8006E2A0, &D_8006E2A4, &D_8006E2AC, &D_8006E2B4, &D_8006E2BC, &D_8006E2C4, &D_8006E2C8, &D_8006E2D0, &D_8006E2D4, &D_8006E2DC };
u32 D_80073DCC[11] = { 0x00161D00, 0x00162400, 0x00161F00, 0x00162400, 0x00161D00, 0x00162400, 0x00161F00, 0x00161F00, 0x00161D00, 0x00162400, 0x00161F00 };
u32 D_80073DF8[11] = { 0x00162100, 0x00161E00, 0x00162100, 0x00161E00, 0x00162100, 0x00161E00, 0x00162100, 0x00162100, 0x00162100, 0x00162100, 0x00161E00 };
void *D_80073E24[1] = { &D_8006E470 };
struct D_80073E28_s { u8 f_80073e28; u8 f_80073e29[635]; } D_80073E28 = { 0, { 255, 0, 0, 128, 6, 228, 188, 0, 255, 0, 0, 128, 6, 228, 220, 1, 255, 0, 0, 128, 6, 229, 40, 1, 255, 0, 0, 128, 6, 229, 88, 3, 255, 0, 0, 128, 6, 229, 156, 5, 255, 0, 0, 128, 6, 229, 176, 5, 255, 0, 0, 128, 6, 229, 192, 5, 255, 0, 0, 128, 6, 230, 32, 7, 255, 0, 0, 128, 6, 230, 248, 8, 255, 0, 0, 128, 6, 231, 20, 8, 255, 0, 0, 128, 6, 231, 164, 9, 255, 0, 0, 128, 6, 232, 88, 2, 255, 0, 0, 128, 6, 232, 144, 10, 255, 0, 0, 128, 6, 232, 216, 10, 255, 0, 0, 128, 6, 228, 152, 0, 255, 0, 0, 128, 6, 228, 188, 0, 255, 0, 0, 128, 6, 229, 56, 1, 255, 0, 0, 128, 6, 229, 140, 3, 255, 0, 0, 128, 6, 229, 176, 5, 255, 0, 0, 128, 6, 230, 96, 7, 255, 0, 0, 128, 6, 230, 172, 7, 255, 0, 0, 128, 6, 230, 236, 8, 255, 0, 0, 128, 6, 231, 20, 8, 255, 0, 0, 128, 6, 231, 128, 9, 255, 0, 0, 128, 6, 231, 148, 9, 255, 0, 0, 128, 6, 232, 4, 4, 255, 0, 0, 128, 6, 232, 88, 2, 255, 0, 0, 128, 6, 232, 200, 10, 255, 0, 0, 128, 6, 228, 188, 0, 255, 0, 0, 128, 6, 229, 12, 1, 255, 0, 0, 128, 6, 229, 72, 3, 255, 0, 0, 128, 6, 229, 204, 5, 255, 0, 0, 128, 6, 229, 236, 5, 255, 0, 0, 128, 6, 230, 148, 7, 255, 0, 0, 128, 6, 230, 196, 7, 255, 0, 0, 128, 6, 230, 236, 8, 255, 0, 0, 128, 6, 231, 100, 9, 255, 0, 0, 128, 6, 231, 112, 9, 255, 0, 0, 128, 6, 231, 232, 6, 255, 0, 0, 128, 6, 232, 48, 4, 255, 0, 0, 128, 6, 232, 112, 2, 255, 0, 0, 128, 6, 232, 160, 10, 255, 0, 0, 128, 6, 232, 184, 10, 255, 0, 0, 128, 6, 232, 216, 10, 255, 0, 0, 128, 6, 228, 112, 0, 255, 0, 0, 128, 6, 228, 204, 0, 255, 0, 0, 128, 6, 228, 232, 1, 255, 0, 0, 128, 6, 229, 28, 1, 255, 0, 0, 128, 6, 229, 124, 3, 255, 0, 0, 128, 6, 229, 220, 5, 255, 0, 0, 128, 6, 229, 252, 5, 255, 0, 0, 128, 6, 230, 32, 7, 255, 0, 0, 128, 6, 230, 128, 7, 255, 0, 0, 128, 6, 231, 36, 8, 255, 0, 0, 128, 6, 231, 84, 9, 255, 0, 0, 128, 6, 231, 184, 6, 255, 0, 0, 128, 6, 232, 32, 4, 255, 0, 0, 128, 6, 228, 168, 0, 255, 0, 0, 128, 6, 232, 124, 10, 255, 0, 0, 128, 6, 228, 112, 0, 255, 0, 0, 128, 6, 232, 72, 2, 255, 0, 0, 128, 6, 228, 248, 1, 255, 0, 0, 128, 6, 229, 104, 3, 255, 0, 0, 128, 6, 229, 220, 5, 255, 0, 0, 128, 6, 230, 48, 7, 255, 0, 0, 128, 6, 230, 108, 7, 255, 0, 0, 128, 6, 230, 220, 8, 255, 0, 0, 128, 6, 231, 52, 8, 255, 0, 0, 128, 6, 231, 68, 9, 255, 0, 0, 128, 6, 231, 216, 6, 255, 0, 0, 128, 6, 232, 16, 4, 255, 0, 0, 128, 6, 228, 136, 0, 255, 0, 0, 128, 6, 228, 168, 0, 255, 0, 0, 128, 6, 230, 80, 7, 255, 0, 0, 128, 6, 230, 160, 7, 255, 0, 0, 128, 6, 230, 184, 7, 255, 0, 0, 128, 6, 230, 208, 7, 255, 0, 0, 128, 6, 231, 4, 8, 255, 0, 0, 128, 6, 231, 200, 6, 255, 0, 0 } }; /* members: D_80073E28, D_80073E29 */
struct D_800740A4_s { u8 f_800740a4; u8 f_800740a5; u8 f_800740a6; u8 f_800740a7[21]; } D_800740A4 = { 0, 15, 33, { 33, 16, 29, 34, 35, 30, 45, 65, 67, 46, 60, 68, 70, 61, 72, 71, 74, 73, 80, 96, 96 } }; /* members: D_800740A4, D_800740A5, D_800740A6, D_800740A7 */
struct D_800740BC_s { u8 f_800740bc; u8 f_800740bd[7]; } D_800740BC = { 43, { 35, 10, 7, 4, 1, 0, 0 } }; /* members: D_800740BC, D_800740BD */
s32 D_800740C4 = 0;
s16 D_800740C8 = 0;
s16 D_800740CA = 1;
s16 D_800740CC[2] = { 0, 0 };
s32 D_800740D0[2] = { 0, 0 };
s32 D_800740D8[2] = { 15, 0 };
s16 D_800740E0 = 1;
s16 D_800740E2 = 1;
s16 D_800740E4[2] = { 1, 0 };
s32 D_800740E8 = 0;
s32 D_800740EC[192] = { 0, 8, 33554688, 1, 8, 16777728, 2, 19, 33554688, 3, 19, 16777728, 4, 9, 33554688, 5, 9, 16777728, 6, 1, 8388736, 7, 21, 16777472, 8, 16, 26214800, 9, 22, 16777472, 10, 22, 16777472, 11, 0, 16777472, 12, 10, 32768500, 13, 11, 32768500, 14, 26, 32768500, 15, 27, 32768500, 16, 23, 32768500, 17, 24, 32768500, 18, 28, 32768500, 19, 18, 32768500, 20, 28, 50332416, 21, 18, 50332416, 22, 20, 32768500, 23, 25, 32768500, 24, 25, 32768500, 25, 13, 32768500, 26, 13, 32768500, 27, 20, 32768500, 28, 3, 32768500, 29, 17, 32768500, 30, 2, 8388736, 31, 29, 16777472, 32, 30, 16777472, 33, 29, 16777472, 34, 30, 16777472, 35, 29, 16777472, 36, 36, 33554944, 37, 31, 16777472, 38, 32, 16777472, 39, 29, 16777472, 40, 30, 16777472, 41, 29, 16777472, 42, 30, 16777472, 43, 4, 33554732, 44, 5, 19661312, 45, 12, 33554732, 46, 7, 19661312, 47, 6, 33554732, 48, 33, 32768500, 49, 34, 32768500, 50, 35, 32768500, 51, 38, 13435085, 52, 39, 13435085, 53, 40, 13435085, 54, 41, 13435085, 55, 42, 16777472, 56, 43, 16777472, 57, 44, 16777472, 58, 45, 16777472, 59, 47, 16777472, 60, 48, 16777472, 64, 46, 33554944, 65, 37, 16777472, -1, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800743EC[93] = { 0, 8, 33554688, 12, 10, 32768500, 13, 11, 32768500, 14, 26, 32768500, 15, 27, 32768500, 16, 23, 32768500, 17, 24, 32768500, 18, 28, 32768500, 19, 18, 32768500, 20, 28, 50332416, 21, 18, 52429600, 22, 20, 52429600, 23, 25, 32768500, 24, 25, 32768500, 25, 13, 52429600, 26, 13, 52429600, 27, 20, 52429600, 51, 54, 52429600, 52, 55, 52429600, 53, 58, 52429600, 54, 60, 52429600, 55, 57, 52429600, 56, 49, 52429600, 28, 61, 52429600, 36, 36, 52429600, 7, 21, 11796660, 8, 16, 39322200, 9, 22, 16777472, 43, 62, 52429600, 57, 199, 32768500, -1, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80074560[21] = { 37, 50, 52429600, 38, 51, 52429600, 39, 52, 52429600, 40, 53, 52429600, 41, 56, 52429600, 28, 61, 52429600, -1, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800745B4[9] = { 54, 60, 52429600, 42, 59, 52429600, -1, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800745D8[9] = { 54, 60, 52429600, 42, 59, 52429600, -1, 0, 0 }; /* UNRESOLVED: size-only typing */
s32 D_800745FC[33] = { 31, 29, 16777472, 32, 30, 16777472, 33, 29, 16777472, 34, 30, 16777472, 35, 29, 16777472, 36, 36, 16777472, 61, 14, 16777472, 62, 15, 16777472, 63, 21, 16777472, 65, 37, 33554944, -1, 0, 0 }; /* UNRESOLVED: size-only typing */
void *D_80074680[6] = { &D_800740EC, &D_800745FC, &D_800743EC, &D_80074560, &D_800745B4, &D_800745D8 };
s32 D_80074698[3] = { 131084, 524301, 524288 }; /* UNRESOLVED: size-only typing */
s32 D_800746A4[3] = { 131086, 589839, 589824 }; /* UNRESOLVED: size-only typing */
s32 D_800746B0[3] = { 131088, 720913, 720896 }; /* UNRESOLVED: size-only typing */
s32 D_800746BC[5] = { 262162, 720915, 720916, 720917, 720896 }; /* UNRESOLVED: size-only typing */
s32 D_800746D0[3] = { 131072, 851969, 851968 }; /* UNRESOLVED: size-only typing */
s32 D_800746DC[3] = { 131074, 851971, 851968 }; /* UNRESOLVED: size-only typing */
s32 D_800746E8[3] = { 131076, 851973, 851968 }; /* UNRESOLVED: size-only typing */
s32 D_800746F4[4] = { 196608, 851969, 851972, 851968 }; /* UNRESOLVED: size-only typing */
s32 D_80074704[3] = { 131117, 786478, 786432 }; /* UNRESOLVED: size-only typing */
s32 D_80074710[4] = { 196651, 786476, 786479, 786432 }; /* UNRESOLVED: size-only typing */
s32 D_80074720[3] = { 131095, 589848, 786432 }; /* UNRESOLVED: size-only typing */
s32 D_8007472C[4] = { 196656, 786481, 786482, 786432 }; /* UNRESOLVED: size-only typing */
void *D_8007473C[14] = { &D_8007472C, &D_800746DC, &D_80074698, &D_800746A4, &D_800746B0, &D_800746BC, &D_800746BC, &D_800746BC, &D_800746D0, &D_800746E8, &D_800746F4, &D_80074704, &D_80074710, &D_80074720 };
struct D_80074774_s { s16 f_80074774; s16 f_80074776[39]; } D_80074774 = { 67, { 80, 81, 84, 85, 89, 90, 90, 91, 92, 93, 96, 97, 97, 98, 99, 100, 101, 102, 102, 103, 108, 109, 111, 0, 0, 112, 115, 116, 117, 118, 119, 0, 0, 120, 121, 0, 0, 122, 123 } }; /* members: D_80074774, D_80074776 */
u8 D_800747C4[68] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 0, 125, 0, 126, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 129, 0, 131, 0, 0, 0, 0, 0, 0, 0, 0, 33, 34, 35, 39, 42, 43, 44, 45, 46, 47, 58, 61, 63, 64, 0, 0 };
u8 D_80074808[4] = { 1, 0, 0, 0 };
u8 D_8007480C[24] = { 3, 2, 2, 3, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 0, 0, 0 };
s32 D_80074824[3] = { 0, -1703904, 524288 };
s32 D_80074830[3] = { 0, 14, 524288 };
s32 D_8007483C[3] = { 0, -1703931, 655360 };
s32 D_80074848[3] = { 0, -1703931, 655360 };
s32 D_80074854[3] = { 0, -1703931, 655360 };
s32 D_80074860[3] = { 0, 12, 655360 }; /* UNRESOLVED: size-only typing */
s32 D_8007486C[3] = { 0, 12, 655360 }; /* UNRESOLVED: size-only typing */
s32 D_80074878[3] = { 0, 12, 655360 }; /* UNRESOLVED: size-only typing */
s32 D_80074884[3] = { 5, 10, 262144 }; /* UNRESOLVED: size-only typing */
s32 D_80074890[3] = { 0, 10, 262144 }; /* UNRESOLVED: size-only typing */
s32 D_8007489C[3] = { 4, 10, 262144 }; /* UNRESOLVED: size-only typing */
s32 D_800748A8[3] = { 0, -327643, 524288 };
s32 D_800748B4[3] = { 0, 327717, 524288 };
void *D_800748C0[1] = { &D_8007483C };
void *D_800748C4[1] = { &D_80074848 };
void *D_800748C8[7] = { &D_80074854, &D_80074860, &D_8007486C, &D_80074878, &D_80074884, &D_80074890, &D_8007489C };
s32 D_800748E4 = 0;
s32 D_800748E8 = 0;
s32 D_800748EC[2] = { 655670, 655590 };
s32 D_800748F4[2] = { -65215, -65295 };
s32 D_800748FC[2] = { 458759, 10027161 };
u16 D_80074904[4] = { 65, 65, 209, 209 };
s16 D_8007490C[4] = { 224, 224, 192, 192 };
s32 D_80074914[4] = { 4784202, 4784202, 14221530, 14221530 };
u8 D_80074924[16] = { 0, 14, 7, 17, 12, 3, 15, 11, 8, 18, 13, 4, 16, 19, 0, 0 };
u8 D_80074934[16] = { 1, 14, 6, 17, 12, 2, 15, 10, 9, 18, 13, 5, 16, 19, 0, 0 };
u8 D_80074944[20] = { 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0 };
u8 D_80074958[20] = { 0, 0, 5, 5, 5, 5, 2, 2, 2, 2, 2, 2, 4, 4, 1, 6, 6, 3, 3, 7 };
s32 D_8007496C[3] = { 5308416, 2359296, 589824 };
s32 D_80074978[13] = { 53084, 5308416, 2359296, 589824, 53084, 5308416, 2359296, 589824, 53084, 5308416, 2359296, 589824, 53084 };
s32 D_800749AC = 943718;
u8 D_800749B0[135] = { 97, 115, 110, 102, 89, 116, 77, 126, 87, 104, 90, 107, 119, 129, 106, 93, 118, 98, 78, 113, 121, 83, 85, 114, 100, 124, 95, 130, 92, 80, 131, 81, 90, 117, 76, 86, 90, 78, 88, 122, 107, 108, 142, 88, 90, 99, 90, 127, 90, 120, 111, 128, 93, 107, 76, 105, 109, 105, 114, 114, 84, 93, 121, 79, 88, 77, 125, 114, 100, 98, 114, 91, 96, 118, 120, 82, 116, 123, 94, 80, 120, 130, 100, 105, 85, 94, 89, 143, 103, 112, 125, 78, 98, 80, 116, 94, 125, 94, 110, 129, 121, 78, 82, 80, 77, 77, 129, 87, 106, 94, 77, 114, 101, 104, 90, 137, 132, 133, 134, 135, 136, 138, 139, 140, 141, 144, 145, 146, 147, 148, 149, 150, 151, 152, 219 };
u8 D_80074A37 = 1;
u8 D_80074A38[4] = { 240, 240, 240, 0 };
char D_80074A3C[4] = "@@@";
s32 D_80074A40[4] = { 76, 57, 96, 0 };
s32 D_80074A50[4] = { 0, 0, 96, 0 };
u8 D_80074A60[4] = { 0, 0, 0, 0 };
u8 D_80074A64[20] = { 0, 1, 2, 3, 4, 5, 6, 2, 2, 3, 4, 5, 6, 7, 0, 0, 0, 0, 0, 0 };
s32 D_80074A78 = 38010;
s32 D_80074A7C = 38010;
s32 D_80074A80[2] = { 38010, 0 };
s32 D_80074A88 = 67142143;
s32 D_80074A8C[13] = { 1, 131075, 262149, 393223, 327681, 131078, 262144, 196615, 458758, 131075, 262149, 65536, 0 };
s32 D_80074AC0[29] = { 0, 5242960, 5242944, 5243248, 5242912, -5242800, -5242816, -5242832, -5242848, 2097216, 64, -2097088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 458756, 65836 }; /* UNRESOLVED: size-only typing */
s32 D_80074B34[6] = { 72, 7, 8323088, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80074B4C[12] = { 136, 9, 8323088, 232, 17, 8323088, 248, 7, 8323088, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80074B7C[12] = { 0, 0, 8323088, 156, 7, 8323088, 256, 8, 8323088, 300, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80074BAC[6] = { 80, 8, 8323088, 180, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80074BC4[6] = { 20, 9, 8323088, 180, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80074BDC[15] = { 48, 17, 8323088, 56, 14, 8323088, 56, 21, 8323088, 76, 8, 8323088, 180, 65536, 0 }; /* UNRESOLVED: size-only typing */
s32 D_80074C18[9] = { 30, 7, 8323088, 184, 57, 6881296, 300, 65536, 0 };
s32 D_80074C3C[3] = { -2146928236, 44, -2147005644 }; /* UNRESOLVED: size-only typing */
s32 D_80074C48[3] = { -2146928236, 45, -2147005620 }; /* UNRESOLVED: size-only typing */
s32 D_80074C54[3] = { -2146928236, 46, -2147005572 }; /* UNRESOLVED: size-only typing */
s32 D_80074C60[3] = { -2146928236, 47, -2147005524 }; /* UNRESOLVED: size-only typing */
s32 D_80074C6C[3] = { -2146928236, 48, -2147005500 }; /* UNRESOLVED: size-only typing */
s32 D_80074C78[3] = { -2146928236, 49, -2147005476 }; /* UNRESOLVED: size-only typing */
s32 D_80074C84 = 0;
s32 D_80074C88 = 56;
s32 D_80074C8C = 0;
s32 D_80074C90[58] = { -2146542284, 0, 4, 0, -2146542724, 0, -2147005380, 0, -2146543080, 0, 5, 0, -2146542724, 0, -2147005356, 0, -2146543080, 0, 6, 0, -2146542724, 0, -2147005344, 0, -2146543080, 0, -2147005332, 0, -2146543080, 0, -2147005320, 0, -2146543080, 0, 7, 0, -2146542724, 0, -2147005368, 0, -2146543080, 0, 8, 0, -2146542724, 0, -2147005760, 0, -2146541620, 0, 9, 0, -2146542724, 1, 0, 0, 0, 0 };
s32 D_80074D78[2] = { 0, 0 };
u8 D_80074D80[16] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
Vtx_t D_80074D90[2] = {
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
s32 D_80074DB0 = 0;
s32 D_80074DB4 = 62500000;
s32 D_80074DB8 = 48681812;
s32 D_80074DBC = 0;
s32 D_80074DC0[4] = { 4194049, 0, 0, 0 };
s32 D_80074DD0 = 0;
s32 D_80074DD4 = 0;
s32 D_80074DD8 = 0;
s32 D_80074DDC = 0;
s32 D_80074DE0 = 0;
s32 D_80074DE4 = 0;
s32 D_80074DE8 = 0;
s32 D_80074DEC = 0;
void *D_80074DF0[2] = { &D_8007D1D8, &D_8007BD08 };
s32 D_80074DF8[2] = { 0, 0 };
s32 D_80074E00[4] = { 0, 0, 0, 0 };
s32 D_80074E10[4] = { 0, 0, 0, 0 };
s32 D_80074E20[2] = { 0, -1 };
void *D_80074E28[1] = { &D_80074E20 };
void *D_80074E2C[1] = { &D_80074E20 };
s32 D_80074E30 = 0;
s32 D_80074E34[3] = { 0, 0, 0 };
Vtx_t D_80074E40[3] = {
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
Vtx_t D_80074E70[3] = {
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
void *D_80074EA0[1] = { &D_80074E40 };
void *D_80074EA4[3] = { &D_80074E70, 0, 0 };
s32 D_80074EB0 = 0;
s32 D_80074EB4 = 0;
s32 D_80074EB8 = 0;
s32 D_80074EBC = 0;
s32 D_80074EC0 = 0;
s32 D_80074EC4 = 0;
s32 D_80074EC8[2] = { 0, 0 };
void *D_80074ED0[4] = { &D_8007E588, 0, 0, 0 };
s32 D_80074EE0[20] = { 33554432, 12574, 320, 65348153, 525, 3093, 202705941, 7078636, 512, 0, 640, 1024, 2425343, 918020, 2, 640, 1024, 2425343, 918020, 2 };
s32 D_80074F30[20] = { 268435456, 12574, 320, 72621626, 625, 1510505, 208604269, 8389376, 512, 0, 640, 1024, 6226489, 590443, 2, 640, 1024, 6226489, 590443, 2 };
s32 D_80074F80[20] = { 503316480, 12574, 320, 73735737, 525, 265233, 202968090, 7078636, 512, 0, 640, 1024, 2425343, 918020, 2, 640, 1024, 2425343, 918020, 2 };
/* Selected by index and copied as one 0x50-byte runtime preset. */
struct RuntimePreset { u8 bytes[0x50]; } D_80074FD0[42] = {
    { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x0E, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x1E, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x0F, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4F, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x1F, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5F, 0x00, 0x00, 0x01, 0x40, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x05, 0x00, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x02, 0x80, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x05, 0x00, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x02, 0x80, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x4F, 0x00, 0x00, 0x05, 0x00, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4F, 0x00, 0x00, 0x02, 0x80, 0x03, 0xE5, 0x22, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x15, 0x0C, 0x15, 0x0C, 0x15, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x14, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x0E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x71, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x01, 0x00, 0x04, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x03, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x1E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x71, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x01, 0x00, 0x04, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x03, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x0F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x71, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x1F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x71, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x05, 0x00, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x02, 0x80, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x05, 0x00, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x02, 0x80, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x4F, 0x00, 0x00, 0x05, 0x00, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4F, 0x00, 0x00, 0x02, 0x80, 0x04, 0x54, 0x1E, 0x3A, 0x00, 0x00, 0x02, 0x70, 0x00, 0x17, 0x0C, 0x69, 0x0C, 0x6F, 0x0C, 0x6D, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x5D, 0x02, 0x37, 0x00, 0x09, 0x02, 0x6B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x14, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x5F, 0x02, 0x39, 0x00, 0x0D, 0x02, 0x69, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x0E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x04, 0x0C, 0x11, 0x0C, 0x19, 0x0C, 0x1A, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x1E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x04, 0x0C, 0x11, 0x0C, 0x19, 0x0C, 0x1A, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x80, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x80, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x0F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x04, 0x0C, 0x11, 0x0C, 0x19, 0x0C, 0x1A, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x1F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0D, 0x00, 0x04, 0x0C, 0x11, 0x0C, 0x19, 0x0C, 0x1A, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x23, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5F, 0x00, 0x00, 0x01, 0x40, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x05, 0x00, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4E, 0x00, 0x00, 0x02, 0x80, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x05, 0x00, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x5E, 0x00, 0x00, 0x02, 0x80, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x4F, 0x00, 0x00, 0x05, 0x00, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } },
    { { 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x4F, 0x00, 0x00, 0x02, 0x80, 0x04, 0x65, 0x1E, 0x39, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x0C, 0x10, 0x0C, 0x1C, 0x0C, 0x1C, 0x00, 0x6C, 0x02, 0xEC, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x23, 0x01, 0xFD, 0x00, 0x0B, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x14, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x0E, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02 } }
};
s32 D_80075CF0[4] = { 0, 0, 0, 0 };
