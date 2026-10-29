/* overlay_5 tail_data 0x800E44B4..0x800E7C16: generated from results/data-ledger.tsv by tools/gen.py */
#include "types.h"

/* Vtx_t: N64 GBI vertex (position, flag, texture coordinates, RGBA or normal+alpha). */
typedef struct { s16 ob[3]; u16 flag; s16 tc[2]; u8 cn[4]; } Vtx_t;

extern u8 D_8006B178[];
extern u8 D_8006B17C[];
extern u8 D_8006B19C[];
extern u8 D_8006B1A4[];
extern u8 D_8006B1AC[];
extern u8 D_8006B1B4[];
extern u8 D_8006B1B8[];
extern u8 D_8006B1C0[];
extern u8 D_8006B1C8[];
extern u8 D_8006BDBC[];
extern u8 D_8006BDC4[];
extern u8 D_8006BDDC[];
extern u8 D_8006BDF8[];
extern u8 D_8006BE18[];
extern u8 D_8006BE24[];
extern u8 D_8006BE34[];
extern u8 D_8006BE54[];
extern u8 D_8006C3CC[];
extern u8 D_8006C68C[];
extern u8 D_8006C748[];
extern u8 D_8006C798[];
extern u8 D_8006C89C[];
extern u8 D_8006C8E0[];
extern u8 D_8006C960[];
extern u8 D_8006CC80[];
extern u8 D_8006CDD4[];
extern u8 D_8006CF38[];
extern u8 D_8006CF74[];
extern u8 D_8006CF84[];
extern u8 D_8006CF94[];
extern u8 D_8006CFA4[];
extern u8 D_8006CFB4[];
extern u8 D_8006CFC0[];
extern u8 D_8006CFCC[];
extern u8 D_8006CFDC[];
extern u8 D_8006D04C[];
extern u8 D_8006D05C[];
extern u8 D_8006D06C[];
extern u8 D_8006D080[];
extern u8 D_8006D094[];
extern u8 D_8006D0A4[];
extern u8 D_8006D0B4[];
extern u8 D_8006D0C8[];
extern u8 D_8006D0F0[];
extern u8 D_8006D2BC[];
extern u8 D_8006D2CC[];
extern u8 D_8006D2D8[];
extern u8 D_8006D2E4[];
extern u8 D_8006D2F0[];
extern u8 D_8006D2FC[];
extern u8 D_8006D30C[];
extern u8 D_8006D31C[];
extern u8 D_8006D328[];
extern u8 D_8006D33C[];
extern u8 D_8006D350[];
extern u8 D_8006D364[];
extern u8 D_8006D374[];
extern u8 D_8006D384[];
extern u8 D_8006D394[];
extern u8 D_8006D3A8[];
extern u8 D_8006D3AC[];
extern u8 D_8006D3B0[];
extern u8 D_8006D3C0[];
extern u8 D_8006D3D0[];
extern u8 D_8006D3E0[];
extern u8 D_8006D3F0[];
extern u8 D_8006D3F8[];
extern u8 D_8006D400[];
extern u8 D_8006D408[];
extern u8 D_8006D420[];
extern u8 D_8006D494[];
extern u8 D_8006D4D8[];
extern u8 D_8006D4DC[];
extern u8 D_8006D4E0[];
extern u8 D_8006D4E4[];
extern u8 D_8006D4E8[];
extern u8 D_8006D4EC[];
extern u8 D_8006D4F0[];
extern u8 D_8006D4F4[];
extern u8 D_8006D4F8[];
extern u8 D_8006D4FC[];
extern u8 D_8006D500[];
extern u8 D_8006D504[];
extern u8 D_8006D508[];
extern u8 D_8006D50C[];
extern u8 D_8006D514[];
extern u8 D_8006D51C[];
extern u8 D_8006D524[];
extern u8 D_8006D52C[];
extern u8 D_8006D530[];
extern u8 D_8006D534[];
extern u8 D_8006D538[];
extern u8 D_8006D53C[];
extern u8 D_8006D540[];
extern u8 D_8006D544[];
extern u8 D_8006D548[];
extern u8 D_8006D5C4[];
extern u8 D_8006D5C8[];
extern u8 D_8006D5CC[];
extern u8 D_8006D5D0[];
extern u8 D_8006D5D4[];
extern u8 D_8006D5D8[];
extern u8 D_8006D5DC[];
extern u8 D_8006D5E0[];
extern u8 D_8006D5E4[];
extern u8 D_8006D5E8[];
extern u8 D_8006D5EC[];
extern u8 D_8006D5F0[];
extern u8 D_8006D5F4[];
extern u8 D_8006D5F8[];
extern u8 D_8006D5FC[];
extern u8 D_8006D600[];
extern u8 D_8006D604[];
extern u8 D_8006D608[];
extern u8 D_8006D60C[];
extern u8 D_8006DADC[];
extern u8 D_8006DF70[];
extern u8 D_800A8500[];
extern u8 D_800A8528[];
extern u8 D_800A85C8[];
extern u8 D_800C5F50[];
extern u8 D_800C5F64[];
extern u8 D_800C5F74[];
extern u8 D_800C5F80[];
extern u8 D_800C5F94[];
extern u8 D_800C5FA8[];
extern u8 D_800C5FBC[];
extern u8 D_800C5FC8[];
extern u8 D_800C5FDC[];
extern u8 D_800C5FF0[];
extern u8 D_800C6004[];
extern u8 D_800C6018[];
extern u8 D_800C6020[];
extern u8 D_800C602C[];
extern u8 D_800C6038[];
extern u8 D_800C6040[];
extern u8 D_800C6048[];
extern u8 D_800C6054[];
extern u8 D_800C6060[];
extern u8 D_800C6068[];
extern u8 D_800C6070[];
extern u8 D_800C6080[];
extern u8 D_800C6090[];
extern u8 D_800C6098[];
extern u8 D_800C609C[];
extern u8 D_800C60A4[];
extern u8 D_800C6114[];
extern u8 D_800C611C[];
extern u8 D_800C612C[];
extern u8 D_800C613C[];
extern u8 D_800C614C[];
extern u8 D_800C615C[];
extern u8 D_800C8598[];
extern u8 D_800C8868[];
extern u8 D_800C8918[];
extern u8 D_800C8A34[];
extern u8 D_800C8A64[];
extern u8 D_800C8A98[];
extern u8 D_800C8B24[];
extern u8 D_800C8B4C[];
extern u8 D_800C8B90[];
extern u8 D_800C8BB0[];
extern u8 D_800C8BF8[];
extern u8 D_800C8C20[];
extern u8 D_800C8C48[];
extern u8 D_800C8C84[];
extern u8 D_800C8CC0[];
extern u8 D_800C8CFC[];
extern u8 D_800C8D84[];
extern u8 D_800C8DAC[];
extern u8 D_800C8E1C[];
extern u8 D_800C925C[];
extern u8 D_800C9718[];
extern u8 D_800CA0D4[];
extern u8 D_800CA194[];
extern u8 D_800CA320[];
extern u8 D_800CA400[];
extern u8 D_800CA508[];
extern u8 D_800CA5CC[];
extern u8 D_800CA604[];
extern u8 D_800CA874[];
extern u8 D_800CAB14[];
extern u8 D_800CAB34[];
extern u8 D_800CAB5C[];
extern u8 D_800CC388[];
extern u8 D_800CC434[];
extern u8 D_800CC550[];
extern u8 D_800CC570[];
extern u8 D_800CC598[];
extern u8 D_800CC6E8[];
extern u8 D_800CC760[];
extern u8 D_800CC7A0[];
extern u8 D_800CC98C[];
extern u8 D_800CC9AC[];
extern u8 D_800CC9EC[];
extern u8 D_800CCB40[];
extern u8 D_800CCB60[];
extern u8 D_800CDFF0[];
extern u8 D_800CE4C4[];
extern u8 D_800CEAB4[];
extern u8 D_800CF2C0[];
extern u8 D_800CF7C8[];
extern u8 D_800CF95C[];
extern u8 D_800CF9D4[];
extern u8 D_800CFA84[];
extern u8 D_800D01AC[];
extern u8 D_800D0340[];
extern u8 D_800D0400[];
extern u8 D_800D0474[];
extern u8 D_800D04F4[];
extern u8 D_800D269C[];
extern u8 D_800D26D4[];
extern u8 D_800D273C[];
extern u8 D_800D2810[];
extern u8 D_800D2830[];
extern u8 D_800D2A00[];
extern u8 D_800D2B8C[];
extern u8 D_800D2BE0[];
extern u8 D_800D3128[];

extern char D_800E44B8[];
extern char D_800E44E4[];
extern char D_800E451C[];
extern char D_800E4548[];
extern char D_800E4574[];
extern char D_800E45AC[];
extern char D_800E45CC[];
extern char D_800E4600[];
extern char D_800E4644[];
extern char D_800E4674[];
extern char D_800E46B0[];
extern char D_800E46E4[];
extern char D_800E46F8[];
extern char D_800E4738[];
extern char D_800E476C[];
extern char D_800E47A0[];
extern char D_800E47C0[];
extern char D_800E4810[];
extern char D_800E4850[];
extern char D_800E4898[];
extern char D_800E48E0[];
extern char D_800E4914[];
extern char D_800E4950[];
extern char D_800E4970[];
extern char D_800E49A8[];
extern s32 D_800E49E4[];
extern char D_800E4A20[];
extern char D_800E4A58[];
extern char D_800E4AA0[];
extern char D_800E4AE0[];
extern char D_800E4B00[];
extern char D_800E4B34[];
extern char D_800E4B60[];
extern char D_800E4BAC[];
extern char D_800E4BEC[];
extern char D_800E4C24[];
extern char D_800E4C58[];
extern char D_800E4C90[];
extern char D_800E4CB8[];
extern char D_800E4CF0[];
extern char D_800E4D28[];
extern char D_800E4D54[];
extern char D_800E4D98[];
extern char D_800E4DC0[];
extern char D_800E4E04[];
extern char D_800E4E44[];
extern char D_800E4E70[];
extern char D_800E4EA8[];
extern char D_800E4EB8[];
extern char D_800E4ED8[];
extern char D_800E4F10[];
extern char D_800E4F44[];
extern char D_800E4F78[];
extern char D_800E4FB8[];
extern char D_800E4FF0[];
extern char D_800E5030[];
extern char D_800E506C[];
extern char D_800E50A8[];
extern s32 D_800E50C8[];
extern char D_800E5104[];
extern char D_800E5134[];
extern char D_800E516C[];
extern char D_800E519C[];
extern char D_800E51D8[];
extern char D_800E5218[];
extern char D_800E525C[];
extern char D_800E528C[];
extern char D_800E52C0[];
extern char D_800E52DC[];
extern char D_800E5320[];
extern char D_800E5350[];
extern char D_800E5378[];
extern char D_800E53A8[];
extern char D_800E5410[];
extern char D_800E542C[];
extern char D_800E5448[];
extern char D_800E5478[];
extern char D_800E54B8[];
extern char D_800E54FC[];
extern char D_800E552C[];
extern char D_800E5564[];
extern char D_800E55A0[];
extern char D_800E55F0[];
extern char D_800E5640[];
extern char D_800E5674[];
extern char D_800E56BC[];
extern char D_800E56FC[];
extern char D_800E5724[];
extern char D_800E575C[];
extern char D_800E5798[];
extern char D_800E57D8[];
extern char D_800E581C[];
extern char D_800E585C[];
extern char D_800E588C[];
extern char D_800E58D0[];
extern char D_800E5918[];
extern char D_800E595C[];
extern char D_800E59A4[];
extern s32 D_800E59E8[];
extern char D_800E5A30[];
extern char D_800E5A78[];
extern char D_800E5ACC[];
extern s32 D_800E5B84;
extern s32 D_800E5B94;
extern s32 D_800E5BA0;
extern s32 D_800E5BB0;
extern s32 D_800E5BC0;
extern s32 D_800E5BD8;
extern s32 D_800E5BEC;
extern s32 D_800E5C00;
extern s32 D_800E5C10;
extern s32 D_800E5C20;
extern s32 D_800E5C34;
extern s32 D_800E5C44;
extern s32 D_800E5C58;
extern s32 D_800E5C68;
extern s32 D_800E5CB4;
extern s32 D_800E5CC8;
extern s32 D_800E5CDC;
extern s32 D_800E5CEC;
extern s32 D_800E5D0C;
extern s32 D_800E5D24;
extern s32 D_800E5D34;
extern s32 D_800E5D44;
extern s32 D_800E5D54;
extern s32 D_800E5D64;
extern s32 D_800E5D74;
extern s32 D_800E5D8C;
extern s32 D_800E5DA0;
extern s32 D_800E5DBC;
extern void *D_800E5ED8[];
extern void *D_800E5F20[];
extern s32 D_800E5FB8[];
extern s32 D_800E5FC0[];
extern void *D_800E5FC8[];
extern void *D_800E6C5C[];
extern void *D_800E6D24[];
extern s32 D_800E6DDC[];
extern s32 D_800E6DE4[];
extern s32 D_800E6E44[];
extern void *D_800E6E8C[];
extern void *D_800E6ED8[];
extern Vtx_t D_800E70A0[];
extern s32 D_800E71C0[];
extern Vtx_t D_800E7338[];
extern void *D_800E7400[];
extern s32 D_800E7498[];
extern s32 D_800E74A4[];
extern s32 D_800E74FC[];
extern s32 D_800E7578[];
extern char D_800E75D0[];
extern s32 D_800E7648[];
extern s32 D_800E7654[];
extern void *D_800E7660[];
extern s32 D_800E76AC;
extern s32 D_800E76B0;
extern void *D_800E76B4[];

s32 D_800E44B4 = 1633956180;
char D_800E44B8[44] = "~I NEEDS TO ESTABLISH THE ~A RUNNING GAME.";
char D_800E44E4[56] = "RUNNING ~I MAY HELP WEAR DOWN THE ~E DEFENSIVE LINE.";
char D_800E451C[44] = "GET ~I THE BALL, HE CAN MAKE THINGS HAPPEN.";
char D_800E4548[44] = "~I NEEDS TO STEP UP AND HAVE  A GOOD GAME.";
char D_800E4574[56] = "~I MUST BREAK LOOSE TODAY FOR THEM TO HAVE A CHANCE.";
char D_800E45AC[32] = "~D NEEDS TO KEEP AIRING IT OUT.";
char D_800E45CC[52] = "IF ~D REMAINS ACCURATE IT COULD MEAN AN EASY WIN.";
char D_800E4600[68] = "WITH THE ~A OFF. LINE, ~D SHOULD HAVE ALL DAY TO FIND AN OPEN WR.";
char D_800E4644[48] = "~D CAN NOT TAKE CHANCES AGAINST THE ~E DEFENSE.";
char D_800E4674[60] = "THE ~A OFFENSIVE LINE NEEDS TO GIVE ~D A CHANCE TO THROW.";
char D_800E46B0[52] = "~D SHOULDN'T FORCE THE PASS TO THE ~A RECEIVERS.";
char D_800E46E4[20] = "GET ~B THE BALL.";
char D_800E46F8[64] = "IF ~B GETS OPEN, IT WILL BE A LONG DAY FOR THE ~E SECONDARY.";
char D_800E4738[52] = "THE MORE TIMES ~D AND ~B CAN CONNECT THE BETTER.";
char D_800E476C[52] = "THROWING TO ~B DEEP WILL SPREAD OUT THE ~E DEFENSE.";
char D_800E47A0[32] = "STICK WITH THEIR GO-TO GUY, ~B.";
char D_800E47C0[80] = "IF THE ~E DEFENSIVE FRONT GIVES THE RUN, THE ~A OFFENSE SHOULD TAKE THE YARDS.";
char D_800E4810[64] = "~C NEEDS TO STEP UP TO GIVE THE ~A OFFENSE A BALANCED ATTACK.";
char D_800E4850[72] = "~B NEEDS A COUPLE OF CATCHES TO TAKE THE PRESSURE OFF THE RUNNING GAME.";
char D_800E4898[72] = "IF THE DEFENSE LOOKS FOR THE RUN, IT CAN WAKE UP THE ~A PASSING GAME.";
char D_800E48E0[52] = "BY GETTING ~B THE BALL, YOU PLAY TO YOUR STRENGTH.";
char D_800E4914[60] = "~D MUST THROW TO ~B AND TAKE ANY YARDAGE THEY GIVE THEM.";
char D_800E4950[32] = "~D SHOULD HOOK UP DEEP WITH ~B.";
char D_800E4970[56] = "~B CAN SHOWCASE HIS TALENT IF ~D CAN GET HIM THE BALL.";
char D_800E49A8[60] = "~B NEEDS TO STEP UP FOR THE ~A OFFENSE TO HAVE A CHANCE.";
s32 D_800E49E4[3] = { 2118264659, 541868355, 1260408646 }; /* inferred aggregate type; byte-exact typed C */
char D_800E49F0[48] = " PRODUCTION MEANS THE RUNNING GAME MUST EXCEL.";
char D_800E4A20[56] = "WITH THE ~A WEAK PASSING GAME, THEY WILL LOOK TO RUN.";
char D_800E4A58[72] = "WITH ~B ANCHORING THE LINE, THEY NEED TO ATTACK THAT DEFENSIVE FRONT.";
char D_800E4AA0[64] = "~B HAS REALLY HELPED THAT LINE;  THEY NEED TO RUN BEHIND HIM.";
char D_800E4AE0[32] = "HIT THE HOLES THAT ~B CREATES.";
char D_800E4B00[52] = "~D NEEDS TO WATCH THE PRESSURE FROM HIS LEFT SIDE.";
char D_800E4B34[44] = "THE ~A OFFENSE SHOULD RUN THE BALL RIGHT.";
char D_800E4B60[76] = "~D NEEDS TO AVOID THE HEAVY PRESSURE THAT IS SURE TO COME FROM THE LEFT.";
char D_800E4BAC[64] = "THE ~A BACKS SHOULD BE ABLE TO RUN THE BALL RIGHT UP THE GUT.";
char D_800E4BEC[56] = "THE ~A BACKS SHOULD LOOK TO RUN BETWEEN THE TACKLES.";
char D_800E4C24[52] = "~I SHOULDN'T HAVE A PROBLEM RUNNING UP THE MIDDLE.";
char D_800E4C58[56] = "IF THE ~E BLITZ, IT SHOULD COME RIGHT UP THE MIDDLE.";
char D_800E4C90[40] = "AVOID THE DIVES AND RUN TO THE OUTSIDE.";
char D_800E4CB8[56] = "~D SHOULD USE THE SHOTGUN TO HELP AVOID THE PRESSURE.";
char D_800E4CF0[56] = "IF ~D NEEDS TIME TO THROW, HE SHOULD GO TO THE SHOTGUN.";
char D_800E4D28[44] = "IT WOULD BE A GOOD IDEA TO RUN BEHIND ~B.";
char D_800E4D54[68] = "A FOCUS ON THE RIGHT SIDE MIGHT GIVE SOME POSITIVE RUSHING YARDS.";
char D_800E4D98[40] = "THE ~A RUNNING GAME POWERS THROUGH ~B.";
char D_800E4DC0[68] = "THE ~A OFFENSIVE FRONT NEEDS BETTER SUPPORT FROM THE RIGHT SIDE.";
char D_800E4E04[64] = "THE ~A OFFENSE NEEDS TO TIGHTEN UP THE RIGHT SIDE OF THE LINE.";
char D_800E4E44[44] = "~D NEEDS TO AVOID THE RIGHT SIDE PRESSURE.";
char D_800E4E70[56] = "~B NEEDS TO STEP UP AND PROTECT HIS SIDE OF THE LINE.";
char D_800E4EA8[16] = "SHUT DOWN ~J.";
char D_800E4EB8[32] = "KEEP UP THE GREAT RUN DEFENSE.";
char D_800E4ED8[56] = "~J SHOULD NOT BE AS DOMINANT DUE TO THE GREAT ~A RUN D.";
char D_800E4F10[52] = "THE ~A DEFENSE NEEDS TO CONTINUE STOPPING THE RUN.";
char D_800E4F44[52] = "THE ~A DEFENSE MUST STOP ~J TO HAVE A GOOD CHANCE.";
char D_800E4F78[64] = "IF ~J CAN BE CONTAINED, THEY WILL HAVE A GREAT CHANCE TO WIN.";
char D_800E4FB8[56] = "THE ~A DEFENSE MUST STOP ~J AND THE ~E RUNNING GAME.";
char D_800E4FF0[64] = "IT ALL STARTS ON THE D-LINE AND HOW WELL THEY CAN CONTAIN ~J.";
char D_800E5030[60] = "THE ~A DEFENSE SECONDARY IS LOOKING FORWARD TO STOPPING ~H.";
char D_800E506C[60] = "IF ~H DID HIS SCOUTING HE WILL AVOID THROWING TOWARDS ~B.";
char D_800E50A8[32] = "KEEP UP THE GREAT PASS DEFENSE.";
s32 D_800E50C8[2] = { 1414022432, 2118197331 }; /* inferred aggregate type; byte-exact typed C */
s32 D_800E50D0[7] = { 1162039118, 1145131609, 542000453, 1146298452, 1327516485, 1162879102, 1210074706 }; /* inferred aggregate type; byte-exact typed C */
char D_800E50EC[24] = "OM HAVING A FIELD DAY.";
char D_800E5104[48] = "~B NEEDS TO LEAD HIS TEAM IN STOPPING THE PASS.";
char D_800E5134[56] = "PLAY MORE NICKEL DEFENSE TO STOP THE ~E PASSING GAME.";
char D_800E516C[48] = "PUT PRESSURE ON ~H, TRY TO DISRUPT HIS TIMING.";
char D_800E519C[60] = "THE ~A SECONDARY MUST STOP ~H OR HE WILL PICK THEM APART.";
char D_800E51D8[64] = "THE ~A PASS DEFENSE MUST CONTAIN ~H IN ORDER TO WIN THIS GAME.";
char D_800E5218[68] = "THE ~E PASSING GAME IS PRECISE--THE ~A SECONDARY MUST STOP THEM.";
char D_800E525C[48] = "THE ~A SECONDARY CAN GIVE ~F HEADACHES TODAY.";
char D_800E528C[52] = "~B'S COVER SKILLS WILL MAKE IT A LONG DAY FOR ~F.";
char D_800E52C0[28] = "~B CAN CONTAIN ~F TODAY.";
char D_800E52DC[68] = "~B CAN SHUT OUT ~F, EFFECTIVELY COVERING THAT SIDE OF THE FIELD.";
char D_800E5320[48] = "HAVE ~B SHADOW ~F, AND MAKE HIM A NON-FACTOR.";
char D_800E5350[40] = "~B MUST CONTAIN ~F TODAY FOR A ~A WIN.";
char D_800E5378[48] = "~B MUST SHUT OUT ~F, OR IT WILL BE A LONG DAY.";
char D_800E53A8[40] = "USE ZONE COVERAGE TO HELP ~B COVER ~F.";
char D_800E53D0[64] = "THE ~A SECONDARY CAN EFFECTIVELY SHUT DOWN THE ~E PASSING GAME.";
char D_800E5410[28] = "KEEP ~B LOCKED UP ON ~F.";
char D_800E542C[28] = "GROUND THE ~E AIR ATTACK.";
char D_800E5448[48] = "KEEP ~H GUESSING BY MIXING UP YOUR COVERAGES.";
char D_800E5478[64] = "BY MIXING UP THE COVERAGE, THE ~A SECONDARY CAN GET AN EDGE.";
char D_800E54B8[68] = "THE ~A SECONDARY MUST STEP UP IN ORDER FOR THEM TO HAVE A CHANCE.";
char D_800E54FC[48] = "~B SHOULD BE ABLE TO PUT THE PRESSURE ON ~H.";
char D_800E552C[56] = "HAVE ~B FIGHT THROUGH THE DOUBLE-TEAM AND ADD PRESSURE.";
char D_800E5564[60] = "RUNNING STUNTS TO FREE UP ~B WILL DISRUPT THE ~E OFFENSE.";
char D_800E55A0[80] = "THE ~A LB'S NEED TO BE ON OR NEAR THE LINE OF SCRIMMAGE FOR EXTRA RUN DEFENSE.";
char D_800E55F0[80] = "~C MUST STEP IT UP AND MAKE BIG PLAYS ON THE LEFT SIDE OF THE DEFENSIVE LINE.";
char D_800E5640[52] = "THE ~A DEFENSIVE LINE NEEDS TO HAVE A GREAT GAME.";
char D_800E5674[72] = "THE ~A LINE NEEDS OUTSIDE CONTAINMENT TO FORCE THINGS INTO THE MIDDLE.";
char D_800E56BC[64] = "WITH ~B ROAMING IN THE MIDDLE, EXPECT A LOT OF DOUBLE TEAMS.";
char D_800E56FC[40] = "~B CAN STOP THE ~E MIDDLE RUNNING GAME.";
char D_800E5724[56] = "THE ~A DEFENSE FEEDS OFF OF ~B.  HE NEEDS A BIG DAY.";
char D_800E575C[60] = "A STRONG MIDDLE PASS RUSH WILL DISRUPT THE ~E PASSING GAME.";
char D_800E5798[64] = "THEY NEEDS SOME HELP IN THE MIDDLE OF THAT ~A DEFENSIVE LINE.";
char D_800E57D8[68] = "IF THEY STICK WITH A 4-3 DEFENSE, IT WILL KEEP THEIR LINE FRESH.";
char D_800E581C[64] = "THE MIDDLE OF THAT DEFENSIVE LINE NEEDS TO MAKE SOME BIG PLAYS.";
char D_800E585C[48] = "~B NEEDS TO THINK RUN FIRST AND PASS SECOND.";
char D_800E588C[68] = "SINCE ~B CAN CONTAIN HIS SIDE, WATCH THE SWEEP TO THE RIGHT SIDE.";
char D_800E58D0[72] = "WITH BLITZES ON TOP OF ~B'S RUSH, THE ~A DEFENSE CAN FORCE TURNOVERS.";
char D_800E5918[68] = "~B'S RUSH WITH AN ADDED BLITZER SHOULD PRESSURE ~H INTO MISTAKES.";
char D_800E595C[72] = "IF ~B CAN GET A HAND IN ~H'S FACE IT WILL MAKE HIM FORCE HIS PASSES.";
char D_800E59A4[68] = "IF ~H SCRAMBLES TO THE LEFT TODAY, HE WILL FACE UNINVITED GUESTS.";
s32 D_800E59E8[12] = { 1414022489, 541151813, 541675040, 1092634447, 1329864784, 1330858324, 1229934112, 1414471763, 1213551648, 1146050382, 542394437, 545146144 }; /* inferred aggregate type; byte-exact typed C */
char D_800E5A18[24] = "OFFENSE ON THE RIGHT.";
char D_800E5A30[72] = "TO MAKE AN IMPACT, ~B MUST USE HIS SPEED TO GET OUTSIDE OF THE TACKLE.";
char D_800E5A78[84] = "A HUGE FACTOR TODAY IS THE PLAY OF ~B AND THE RIGHT SIDE OF THAT DEFENSIVE LINE.";
char D_800E5ACC[64] = "~B NEEDS A GOOD DAY IF THE ~A DEFENSE EXPECTS TO BE EFFECTIVE.";
char D_800E5B0C[48] = "FORCE SOME TURNOVERS IN ORDER TO PULL IT OUT.";
s32 D_800E5B3C[16] = { 1414022489, 542000453, 1142964512, 1346720326, 1162040352, 1195461957, 542070100, 542066208, 1414022473, 1377850181, 1129270852, 1095915808, 1414471760, 1431063584, 1414023507, 542068293 }; /* inferred aggregate type; byte-exact typed C */
char D_800E5B7C[8] = " OFF.";
s32 D_800E5B84 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5B88[3] = { &D_800E44B8, &D_800E44E4, &D_800E451C };
s32 D_800E5B94 = 2; /* inferred aggregate type; byte-exact typed C */
void *D_800E5B98[2] = { &D_800E4548, &D_800E4574 };
s32 D_800E5BA0 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5BA4[3] = { &D_800E45AC, &D_800E45CC, &D_800E4600 };
s32 D_800E5BB0 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5BB4[3] = { &D_800E4644, &D_800E4674, &D_800E46B0 };
s32 D_800E5BC0 = 5; /* inferred aggregate type; byte-exact typed C */
void *D_800E5BC4[5] = { &D_800E46E4, &D_800E46F8, &D_800E4738, &D_800E476C, &D_800E47A0 };
s32 D_800E5BD8 = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5BDC[4] = { &D_800E47C0, &D_800E4810, &D_800E4850, &D_800E4898 };
s32 D_800E5BEC = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5BF0[4] = { &D_800E48E0, &D_800E4914, &D_800E4950, &D_800E4970 };
s32 D_800E5C00 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5C04[3] = { &D_800E49A8, &D_800E49E4, &D_800E4A20 };
s32 D_800E5C10 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5C14[3] = { &D_800E4A58, &D_800E4AA0, &D_800E4AE0 };
s32 D_800E5C20 = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5C24[4] = { &D_800E4B00, &D_800E4B34, &D_800E4B60, &D_800E4E70 };
s32 D_800E5C34 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5C38[3] = { &D_800E4BAC, &D_800E4BEC, &D_800E4C24 };
s32 D_800E5C44 = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5C48[4] = { &D_800E4C58, &D_800E4C90, &D_800E4CB8, &D_800E4CF0 };
s32 D_800E5C58 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5C5C[3] = { &D_800E4D28, &D_800E4D54, &D_800E4D98 };
s32 D_800E5C68 = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5C6C[18] = { &D_800E4DC0, &D_800E4E04, &D_800E4E44, &D_800E4E70, &D_800E5B84, &D_800E5BA0, &D_800E5BC0, &D_800E5BEC, &D_800E5C10, &D_800E5C34, &D_800E5C58, &D_800E5B94, &D_800E5BB0, &D_800E5BD8, &D_800E5C00, &D_800E5C20, &D_800E5C44, &D_800E5C68 };
s32 D_800E5CB4 = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5CB8[4] = { &D_800E4EA8, &D_800E4EB8, &D_800E4ED8, &D_800E4F10 };
s32 D_800E5CC8 = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5CCC[4] = { &D_800E4F44, &D_800E4F78, &D_800E4FB8, &D_800E4FF0 };
s32 D_800E5CDC = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5CE0[3] = { &D_800E5030, &D_800E506C, &D_800E50A8 };
s32 D_800E5CEC = 7; /* inferred aggregate type; byte-exact typed C */
void *D_800E5CF0[7] = { &D_800E50C8, &D_800E5104, &D_800E5134, &D_800E516C, &D_800E519C, &D_800E51D8, &D_800E5218 };
s32 D_800E5D0C = 5; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D10[5] = { &D_800E525C, &D_800E528C, &D_800E52C0, &D_800E52DC, &D_800E5320 };
s32 D_800E5D24 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D28[3] = { &D_800E5350, &D_800E5378, &D_800E53A8 };
s32 D_800E5D34 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D38[3] = { &D_800E5410, &D_800E5410, &D_800E542C };
s32 D_800E5D44 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D48[3] = { &D_800E5448, &D_800E5478, &D_800E54B8 };
s32 D_800E5D54 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D58[3] = { &D_800E54FC, &D_800E552C, &D_800E5564 };
s32 D_800E5D64 = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D68[3] = { &D_800E55A0, &D_800E55F0, &D_800E5640 };
s32 D_800E5D74 = 5; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D78[5] = { &D_800E5674, &D_800E56BC, &D_800E56FC, &D_800E5724, &D_800E575C };
s32 D_800E5D8C = 4; /* inferred aggregate type; byte-exact typed C */
void *D_800E5D90[4] = { &D_800E5798, &D_800E57D8, &D_800E581C, &D_800E585C };
s32 D_800E5DA0 = 6; /* inferred aggregate type; byte-exact typed C */
void *D_800E5DA4[6] = { &D_800E588C, &D_800E58D0, &D_800E5918, &D_800E595C, &D_800E59A4, &D_800E59E8 };
s32 D_800E5DBC = 3; /* inferred aggregate type; byte-exact typed C */
void *D_800E5DC0[17] = { &D_800E5A30, &D_800E5A78, &D_800E5ACC, &D_800E5CB4, &D_800E5CDC, &D_800E5D0C, &D_800E5D34, &D_800E5D54, &D_800E5D74, &D_800E5DA0, &D_800E5CC8, &D_800E5CEC, &D_800E5D24, &D_800E5D44, &D_800E5D64, &D_800E5D8C, &D_800E5DBC };
s32 D_800E5E04[5] = { 1, -2146542836, 1, -2146542788, 0 };
s32 D_800E5E18[31] = { 2118656126, 1244405886, 1193311817, 540876883, 1129467724, 1278114899, 1413567060, 540876866, 1094929199, 1347568982, 1229935955, 779910723, 540876883, 1162626371, 1411403852, 1096360020, 1327518551, 1095770191, 1431580284, 2118200352, 2118331424, 2118262845, 542328140, 1162040444, 538976326, 1330793775, 1397052463, 1347174745, 542396192, 1398227280, 541675054 };
char D_800E5E94[28] = "|~K = FLIP PLAY TO SWAP IN.";
u8 D_800E5EB0[4] = { 0, 0, 0, 0 };
s32 D_800E5EB4 = 0;
void *D_800E5EB8[5] = { &D_800D26D4, &D_800D273C, &D_800D2810, &D_8006C748, &D_800C5F50 };
s32 D_800E5ECC[3] = { 0, 392960, 0 };
void *D_800E5ED8[3] = { &D_800C5F80, 0, 0 };
void *D_800E5EE4[2] = { &D_800A8500, &D_800C5F74 };
s32 D_800E5EEC[2] = { 0, 0 };
void *D_800E5EF4[2] = { &D_800A8528, &D_800C5F64 };
void *D_800E5EFC[3] = { 0, 0, &D_800A85C8 };
s32 D_800E5F08[4] = { 720896, 0, -16710653, 50331648 };
void *D_800E5F18[2] = { &D_800E5ED8, &D_800E5ED8 };
void *D_800E5F20[3] = { &D_8006BE18, 0, 0 };
void *D_800E5F2C[2] = { &D_800C8A98, &D_8006BDF8 };
s32 D_800E5F34[2] = { 0, 0 };
void *D_800E5F3C[2] = { &D_800C8B24, &D_800C5FA8 };
s32 D_800E5F44[2] = { 0, 0 };
void *D_800E5F4C[2] = { &D_800D3128, &D_800C5F94 };
void *D_800E5F54[3] = { 0, 0, &D_800D0474 };
void *D_800E5F60[5] = { &D_800D26D4, &D_800D273C, &D_800D2810, &D_8006C748, &D_800C5FBC };
s32 D_800E5F74[3] = { 0, -256, 0 };
s32 D_800E5F80[4] = { 720896, 0, -16709628, 67108864 };
void *D_800E5F90[2] = { &D_800E5F20, &D_800E5F20 };
void *D_800E5F98[5] = { &D_800D2830, &D_800D2A00, &D_800D2B8C, &D_8006CC80, &D_800C5FC8 };
struct D_800E5FAC_s { s16 f_800e5fac[3]; u8 f_800e5fb2[6]; } D_800E5FAC = { { 0, 0, -1 }, { 255, 0, 0, 0, 0, 0 } }; /* members: D_800E5FAC, D_800E5FB2 */
s32 D_800E5FB8[2] = { 268632835, 101056512 }; /* inferred aggregate type; byte-exact typed C */
s32 D_800E5FC0[2] = { 17307172, 841678848 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E5FC8[1] = { &D_800D2BE0 };
s32 D_800E5FCC = 84346368;
void *D_800E5FD0[3] = { &D_800E5FB8, &D_800E5FC0, &D_800E5FC8 };
s32 D_800E5FDC[9] = { 100716544, -2146619104, 167706624, 0, 22, 1, 0, 0, 0 };
s32 D_800E6000 = 2097152;
s32 D_800E6004[63] = { -2147036932, 51052544, -2147036708, 786432, -2147036692, 65536, -2147036912, 131072, -2147036896, 0, -2147036924, 524288, -2147036776, 589824, -2147036764, 2162688, -2147036736, 655360, -2147036748, 262144, -2147036880, 327680, -2147036868, 17105920, -2147036848, 393216, -2147036832, 458752, -2147036816, 17237504, -2147036796, 851968, -2147036680, 917504, -2147036664, 196608, -2147036720, 983040, -2147036644, 1048576, -2147036628, 1114112, -2147036608, 17829632, -2147036588, 1179648, -2147036568, 1245184, -2147036552, 1310720, -2147036532, 101913088, -2147036512, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E6100[2] = { &D_8006CF74, &D_8006D04C };
s32 D_800E6108 = 65536;
s32 D_800E610C[64] = { 87097344, -2147035172, 262144, -2147035584, 196608, -2147035596, 17040128, -2147035100, 327680, -2147035572, 33882880, -2147035140, 393216, -2147035560, 458752, -2147035548, 524288, -2147035540, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E620C[2] = { &D_8006CF84, &D_8006D05C };
s32 D_800E6214[3] = { 131072, 589824, -2147035528 };
s32 D_800E6220[62] = { 655360, -2147035516, 34212096, -2147035212, 720896, -2147035504, 786432, -2147035180, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E6318[2] = { &D_8006CF94, &D_8006D06C };
s32 D_800E6320[3] = { 196608, 851968, -2147035480 };
s32 D_800E632C[62] = { 917504, -2147035472, 34475264, -2147035128, 983040, -2147035464, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E6424[2] = { &D_8006CFA4, &D_8006D080 };
s32 D_800E642C[3] = { 262144, 1048576, -2147035456 };
s32 D_800E6438[62] = { 1114112, -2147035448, 1310720, -2147035440, 1245184, -2147035164, 1179648, -2147035152, 1376256, -2147035432, 1441792, -2147035420, 2555904, -2147035192, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E6530[2] = { &D_8006CFA4, &D_8006D080 };
s32 D_800E6538[65] = { 262144, 1048576, -2147035456, 1114112, -2147035448, 1310720, -2147035440, 1245184, -2147035164, 1179648, -2147035152, 1376256, -2147035432, 1441792, -2147035420, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E663C[2] = { &D_8006CFB4, &D_8006D094 };
s32 D_800E6644[5] = { 327680, 1572864, -2147035368, 1507328, -2147035376 };
s32 D_800E6658[60] = { 18355968, -2147035088, 1638400, -2147035348, 1769472, -2147035328, 1703936, -2147035336, 18553344, -2147035080, 1835008, -2147035320, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E6748[2] = { &D_8006CFC0, &D_8006D0A4 };
s32 D_800E6750[5] = { 393216, 1900544, -2147035312, 1966080, -2147035304 };
s32 D_800E6764[60] = { 35527936, -2147035120, 2031616, -2147035292, 2097152, -2147035280, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E6854[2] = { &D_8006CFCC, &D_8006D0B4 };
s32 D_800E685C[5] = { 458752, 2162688, -2147035268, 2228224, -2147035256 };
Vtx_t D_800E6870[15] = {
    { { 546, 8448, -32762 }, 55324, { 35, 0 }, { 128, 6, 215, 144 } },
    { { -256, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
void *D_800E6960[2] = { &D_8006CFDC, &D_8006D0C8 };
s32 D_800E6968[5] = { 524288, 2359296, -2147035240, 2424832, -2147035228 };
Vtx_t D_800E697C[15] = {
    { { 549, 9216, -32762 }, 55324, { 38, 0 }, { 128, 6, 215, 172 } },
    { { -256, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
void *D_800E6A6C[2] = { &D_8006CF74, &D_8006D04C };
s32 D_800E6A74[65] = { 65536, 262144, -2147035584, 196608, -2147035596, 17040128, -2147035200, 327680, -2147035572, 33883136, -2147035140, 393216, -2147035560, 458752, -2147035548, 524288, -2147035540, -16777216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void *D_800E6B78[25] = { &D_8006D4D8, &D_8006D4DC, &D_8006D4E0, &D_8006D4E4, &D_8006D4E8, &D_8006D4EC, &D_8006D4F0, &D_8006D4F4, &D_8006D4F8, &D_8006D4FC, &D_8006D500, &D_8006D504, &D_8006D508, &D_8006D50C, &D_8006D514, &D_8006D51C, &D_8006D524, &D_8006D52C, &D_8006D530, &D_8006D534, &D_8006D538, &D_8006D53C, &D_8006D540, &D_8006D544, &D_8006D548 };
void *D_800E6BDC[19] = { &D_8006D5C4, &D_8006D5C8, &D_8006D5CC, &D_8006D5D0, &D_8006D5D4, &D_8006D5D8, &D_8006D5DC, &D_8006D5E0, &D_8006D5E4, &D_8006D5E8, &D_8006D5EC, &D_8006D5F0, &D_8006D5F4, &D_8006D5F8, &D_8006D5FC, &D_8006D600, &D_8006D604, &D_8006D608, &D_8006D60C };
s32 D_800E6C28 = 0;
s32 D_800E6C2C = 0;
s32 D_800E6C30 = 0;
s32 D_800E6C34 = 0;
s32 D_800E6C38 = -1;
void *D_800E6C3C[5] = { &D_800C8598, &D_800C8868, &D_800C8918, &D_8006C8E0, &D_800C5FDC };
s32 D_800E6C50[3] = { 0, -256, 2097152 };
void *D_800E6C5C[4] = { &D_8006D2E4, 0, 0, &D_800C8B90 };
void *D_800E6C6C[4] = { &D_8006D2FC, 0, 0, &D_800C8BB0 };
void *D_800E6C7C[3] = { &D_8006BE54, 0, 0 };
void *D_800E6C88[2] = { &D_800C8B4C, &D_800C5FF0 };
s32 D_800E6C90[2] = { 0, 0 };
void *D_800E6C98[2] = { &D_800C8C48, &D_8006D3B0 };
s32 D_800E6CA0[2] = { 0, 0 };
void *D_800E6CA8[2] = { &D_800C8BF8, &D_8006D2BC };
s32 D_800E6CB0[2] = { 0, 0 };
void *D_800E6CB8[2] = { &D_800C8CC0, &D_800C5FBC };
s32 D_800E6CC0[2] = { 0, 0 };
void *D_800E6CC8[2] = { &D_800D269C, &D_8006BE24 };
s32 D_800E6CD0[2] = { 0, 0 };
void *D_800E6CD8[2] = { &D_800C8DAC, &D_8006BE34 };
s32 D_800E6CE0[2] = { 0, 0 };
void *D_800E6CE8[2] = { &D_800C8D84, &D_8006D2CC };
s32 D_800E6CF0[2] = { 0, 0 };
void *D_800E6CF8[2] = { &D_800C8C20, &D_8006D2F0 };
void *D_800E6D00[3] = { 0, 0, &D_800C8CFC };
s32 D_800E6D0C[4] = { 720896, 0, -16708597, 184549376 };
void *D_800E6D1C[2] = { &D_800E6C5C, &D_800E6C5C };
void *D_800E6D24[3] = { &D_8006D2D8, 0, 0 };
void *D_800E6D30[2] = { &D_800C8E1C, &D_8006D2BC };
s32 D_800E6D38[2] = { 0, 0 };
void *D_800E6D40[2] = { &D_800C8CC0, &D_8006BE54 };
s32 D_800E6D48[2] = { 0, 0 };
void *D_800E6D50[2] = { &D_800C8B4C, &D_8006BE18 };
s32 D_800E6D58[2] = { 0, 0 };
void *D_800E6D60[2] = { &D_800C8A98, &D_8006BDF8 };
s32 D_800E6D68[2] = { 0, 0 };
void *D_800E6D70[2] = { &D_800C8B24, &D_8006BE34 };
void *D_800E6D78[3] = { 0, 0, &D_800C8D84 };
s32 D_800E6D84[4] = { 720896, 0, -16709882, 100663296 };
void *D_800E6D94[7] = { &D_800E6D24, &D_800E6D24, &D_800C8598, &D_800C8868, &D_800C8918, &D_8006C89C, &D_800C6004 };
s32 D_800E6DB0[3] = { 0, -256, 2097152 };
void *D_800E6DBC[5] = { &D_800C925C, &D_800C9718, &D_800CA0D4, &D_8006C798, &D_800C6018 };
s32 D_800E6DD0[3] = { 0, -256, 0 };
s32 D_800E6DDC[2] = { 503711238, 101056512 }; /* inferred aggregate type; byte-exact typed C */
s32 D_800E6DE4[2] = { 303702570, 842661888 }; /* inferred aggregate type; byte-exact typed C */
struct D_800E6DEC_s { u8 f_800e6dec; u8 f_800e6ded[3]; } D_800E6DEC = { 0, { 0, 0, 0 } }; /* members: D_800E6DEC, D_800E6DED */
s32 D_800E6DF0 = 0;
void *D_800E6DF4[16] = { &D_800C6068, 0, &D_800C6060, 0, &D_800C6054, 0, &D_800C6048, 0, &D_800C6040, 0, &D_800C6038, 0, &D_800C602C, 0, &D_800C6020, 0 };
struct D_800E6E34_s { u8 f_800e6e34; u8 f_800e6e35[7]; } D_800E6E34 = { 8, { 0, 0, 0, 128, 14, 109, 244 } }; /* members: D_800E6E34, D_800E6E35 */ /* inferred aggregate type; byte-exact typed C */
struct D_800E6E3C_s { u8 f_800e6e3c; u8 f_800e6e3d[3]; } D_800E6E3C = { 0, { 0, 0, 0 } }; /* members: D_800E6E3C, D_800E6E3D */
s32 D_800E6E40 = 0;
s32 D_800E6E44[4] = { -2147041376, 196608, -2146538004, 0 };
s32 D_800E6E54[4] = { -2147041376, 196608, -2146537932, 0 };
s32 D_800E6E64[4] = { -2147041376, 2293760, -2146537924, 0 };
s32 D_800E6E74[4] = { 655360, 0, -16499709, 50331648 };
void *D_800E6E84[2] = { &D_800E6E44, &D_800E6E44 };
void *D_800E6E8C[1] = { &D_800CA194 };
struct D_800E6E90_s { u8 f_800e6e90; u8 f_800e6e91[3]; } D_800E6E90 = { 6, { 6, 5, 0 } }; /* members: D_800E6E90, D_800E6E91 */
void *D_800E6E94[3] = { &D_800E6DDC, &D_800E6DE4, &D_800E6E8C };
struct D_800E6EA0_s { s16 f_800e6ea0[9]; s16 f_800e6eb2[3]; } D_800E6EA0 = { { 1536, -7168, -32756, -23864, 2559, 0, 0, 0, 1 }, { 0, 0, 1 } }; /* members: D_800E6EA0, D_800E6EB2 */
void *D_800E6EB8[5] = { &D_800CA320, &D_800CA400, &D_800CA508, &D_8006CF38, &D_800C6070 };
s32 D_800E6ECC[3] = { 0, -256, 4194304 };
void *D_800E6ED8[3] = { &D_8006D31C, 0, 0 };
void *D_800E6EE4[2] = { &D_800CA5CC, &D_8006D328 };
s32 D_800E6EEC[2] = { 0, 0 };
void *D_800E6EF4[2] = { &D_800CA5CC, &D_8006D350 };
s32 D_800E6EFC[2] = { 0, 0 };
void *D_800E6F04[2] = { &D_800CA5CC, &D_8006D364 };
s32 D_800E6F0C[2] = { 0, 0 };
void *D_800E6F14[2] = { &D_800CA5CC, &D_8006D374 };
s32 D_800E6F1C[2] = { 0, 0 };
void *D_800E6F24[2] = { &D_800CA5CC, &D_8006D384 };
s32 D_800E6F2C[2] = { 0, 0 };
void *D_800E6F34[2] = { &D_800CA5CC, &D_8006D30C };
s32 D_800E6F3C[2] = { 0, 0 };
void *D_800E6F44[2] = { &D_800CA5CC, &D_8006D394 };
s32 D_800E6F4C[2] = { 0, 0 };
void *D_800E6F54[2] = { &D_800CA5CC, &D_8006D33C };
void *D_800E6F5C[3] = { 0, 0, &D_800CA5CC };
u8 D_800E6F68[11] = { 0, 9, 0, 0, 0, 0, 0, 0, 255, 1, 9 };
u8 D_800E6F73 = 8;
u8 D_800E6F74[8] = { 8, 0, 0, 0, 128, 14, 110, 216 };
void *D_800E6F7C[1] = { &D_800E6ED8 };
void *D_800E6F80[5] = { &D_800CA604, &D_800CA874, &D_800CAB14, &D_8006C3CC, &D_800C6080 };
s32 D_800E6F94[3] = { 0, -256, 0 };
void *D_800E6FA0[6] = { &D_800C609C, 0, &D_800C6098, 0, &D_800C6090, 0 };
struct D_800E6FB8_s { u8 f_800e6fb8; u8 f_800e6fb9[7]; } D_800E6FB8 = { 3, { 0, 0, 0, 128, 14, 111, 160 } }; /* members: D_800E6FB8, D_800E6FB9 */ /* inferred aggregate type; byte-exact typed C */
void *D_800E6FC0[4] = { &D_8006D3A8, 0, &D_8006D3AC, 0 };
struct D_800E6FD0_s { u8 f_800e6fd0; u8 f_800e6fd1[7]; } D_800E6FD0 = { 2, { 0, 0, 0, 128, 14, 111, 192 } }; /* members: D_800E6FD0, D_800E6FD1 */ /* inferred aggregate type; byte-exact typed C */
s32 D_800E6FD8[6] = { -2147036248, 0, -2147036244, 0, 33554432, -2146537512 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E6FF0[4] = { &D_8006D3A8, 0, &D_8006D3AC, 0 };
struct D_800E7000_s { u8 f_800e7000; u8 f_800e7001[7]; } D_800E7000 = { 2, { 0, 0, 0, 128, 14, 111, 240 } }; /* members: D_800E7000, D_800E7001 */ /* inferred aggregate type; byte-exact typed C */
struct D_800E7008_s { u8 f_800e7008; u8 f_800e7009[7]; } D_800E7008 = { 2, { 0, 0, 0, 128, 14, 111, 240 } }; /* members: D_800E7008, D_800E7009 */ /* inferred aggregate type; byte-exact typed C */
struct D_800E7010_s { u8 f_800e7010; u8 f_800e7011[7]; } D_800E7010 = { 2, { 0, 0, 0, 128, 14, 111, 240 } }; /* members: D_800E7010, D_800E7011 */ /* inferred aggregate type; byte-exact typed C */
void *D_800E7018[4] = { &D_8006D3A8, 0, &D_8006D3AC, 0 };
struct D_800E7028_s { u8 f_800e7028; u8 f_800e7029[7]; } D_800E7028 = { 2, { 0, 0, 0, 128, 14, 112, 24 } }; /* members: D_800E7028, D_800E7029 */ /* inferred aggregate type; byte-exact typed C */
void *D_800E7030[8] = { &D_8006D3F0, 0, &D_8006D3F8, 0, &D_8006D400, 0, &D_8006D408, 0 };
struct D_800E7050_s { u8 f_800e7050; u8 f_800e7051[7]; } D_800E7050 = { 4, { 0, 0, 0, 128, 14, 112, 48 } }; /* members: D_800E7050, D_800E7051 */ /* inferred aggregate type; byte-exact typed C */
void *D_800E7058[4] = { &D_8006D3A8, 0, &D_8006D3AC, 0 };
struct D_800E7068_s { u8 f_800e7068; u8 f_800e7069[7]; } D_800E7068 = { 2, { 0, 0, 0, 128, 14, 112, 88 } }; /* members: D_800E7068, D_800E7069 */ /* inferred aggregate type; byte-exact typed C */
void *D_800E7070[4] = { &D_8006D3A8, 0, &D_8006D3AC, 0 };
struct D_800E7080_s { u8 f_800e7080; u8 f_800e7081[7]; } D_800E7080 = { 2, { 1, 0, 0, 128, 14, 112, 112 } }; /* members: D_800E7080, D_800E7081 */ /* inferred aggregate type; byte-exact typed C */
void *D_800E7088[4] = { &D_8006D3A8, 0, &D_8006D3AC, 0 };
struct D_800E7098_s { u8 f_800e7098; u8 f_800e7099[7]; } D_800E7098 = { 2, { 0, 0, 0, 128, 14, 112, 136 } }; /* members: D_800E7098, D_800E7099 */ /* inferred aggregate type; byte-exact typed C */
Vtx_t D_800E70A0[5] = {
    { { -32762, -15840, 1 }, 0, { -32754, 28600 }, { 0, 0, 0, 0 } },
    { { -32756, 24840, 1 }, 0, { -32754, 28688 }, { 0, 0, 0, 0 } },
    { { -32756, 24828, 1 }, 0, { -32754, 28776 }, { 0, 0, 0, 0 } },
    { { -32762, -17316, 1 }, 0, { -32754, 28672 }, { 0, 0, 0, 0 } },
    { { -32756, 24816, 1 }, 0, { -32754, 28712 }, { 0, 0, 0, 0 } }
};
s32 D_800E70F0[4] = { -2146672408, 65536, -2146537320, 0 };
Vtx_t D_800E7100[2] = {
    { { -32756, 24792, 1 }, 0, { -32754, 28752 }, { 0, 0, 0, 0 } },
    { { -32756, 24772, 1 }, 0, { -32754, 28800 }, { 0, 0, 0, 0 } }
};
s32 D_800E7120[4] = { -2146672464, 65536, -2146537520, 0 };
s32 D_800E7130[4] = { -2147036144, 65536, -2146537464, 0 };
void *D_800E7140[3] = { &D_800C60A4, 0, 0 };
void *D_800E714C[2] = { &D_800CAB34, &D_8006BDDC };
s32 D_800E7154[2] = { 0, 0 };
void *D_800E715C[2] = { &D_800C8C84, &D_8006D3E0 };
void *D_800E7164[3] = { 0, 0, &D_800CAB5C };
s32 D_800E7170[4] = { 720896, 0, -16708083, 218103808 };
void *D_800E7180[2] = { &D_800E70A0, &D_800E70A0 };
void *D_800E7188[5] = { &D_800CC388, &D_800CC434, &D_800CC550, &D_8006C3CC, &D_8006D3B0 };
s32 D_800E719C[3] = { 0, -256, 0 };
void *D_800E71A8[4] = { &D_800C6114, 0, &D_8006DADC, 0 };
struct D_800E71B8_s { u8 f_800e71b8; u8 f_800e71b9[7]; } D_800E71B8 = { 2, { 0, 0, 0, 128, 14, 113, 168 } }; /* members: D_800E71B8, D_800E71B9 */ /* inferred aggregate type; byte-exact typed C */
s32 D_800E71C0[4] = { -2147036240, 65536, -2146537032, 0 };
void *D_800E71D0[3] = { &D_8006D3C0, 0, 0 };
void *D_800E71DC[2] = { &D_800C8A34, &D_8006D3D0 };
s32 D_800E71E4[2] = { 0, 0 };
void *D_800E71EC[2] = { &D_800C8A64, &D_8006BDBC };
s32 D_800E71F4[2] = { 0, 0 };
void *D_800E71FC[2] = { &D_800CC570, &D_8006BDC4 };
s32 D_800E7204[2] = { 0, 0 };
void *D_800E720C[2] = { &D_800CC598, &D_800C611C };
void *D_800E7214[3] = { 0, 0, &D_800CC6E8 };
s32 D_800E7220[4] = { 720896, 0, -16709882, 100663296 };
void *D_800E7230[2] = { &D_800E71C0, &D_800E71C0 };
void *D_800E7238[5] = { &D_800CC760, &D_800CC7A0, &D_800CC98C, &D_8006C3CC, &D_800C612C };
s32 D_800E724C[3] = { 0, -256, 0 };
void *D_800E7258[8] = { &D_8006B1AC, 0, &D_8006B1C0, 0, &D_8006B1B4, 0, &D_8006B1B8, 0 };
s32 D_800E7278[2] = { 67108864, -2146536872 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E7280[8] = { &D_8006B1AC, 0, &D_8006B1C0, 0, &D_8006B1B4, 0, &D_8006B1B8, 0 };
s32 D_800E72A0[2] = { 67108864, -2146536832 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E72A8[8] = { &D_8006B1AC, 0, &D_8006B1C0, 0, &D_8006B1B4, 0, &D_8006B1B8, 0 };
s32 D_800E72C8[2] = { 67108864, -2146536792 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E72D0[8] = { &D_8006B1AC, 0, &D_8006B1C0, 0, &D_8006B1B4, 0, &D_8006B1B8, 0 };
s32 D_800E72F0[2] = { 67108864, -2146536752 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E72F8[8] = { &D_8006B1AC, 0, &D_8006B1C8, 0, &D_8006B1B4, 0, &D_8006B1B8, 0 };
s32 D_800E7318[2] = { 67108864, -2146536712 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E7320[4] = { &D_8006B1AC, 0, &D_8006B1C8, 0 };
s32 D_800E7330[2] = { 33554432, -2146536672 }; /* inferred aggregate type; byte-exact typed C */
Vtx_t D_800E7338[9] = {
    { { -32762, -20128, 1 }, 0, { -32754, 29304 }, { 0, 0, 0, 0 } },
    { { -32762, -20096, 1 }, 0, { -32754, 29344 }, { 0, 0, 0, 0 } },
    { { -32762, -20132, 1 }, 0, { -32754, 29384 }, { 0, 0, 0, 0 } },
    { { -32762, -20148, 1 }, 0, { -32754, 29424 }, { 0, 0, 0, 0 } },
    { { -32762, -20080, 1 }, 0, { -32754, 29464 }, { 0, 0, 0, 0 } },
    { { -32762, -20088, 1 }, 0, { -32754, 29488 }, { 0, 0, 0, 0 } },
    { { -32762, -11220, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { -32762, -11232, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { -32762, -12060, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
s32 D_800E73C8[4] = { 720896, 0, -16709111, 150994944 };
void *D_800E73D8[2] = { &D_800E7338, &D_800E7338 };
void *D_800E73E0[5] = { &D_800CC9AC, &D_800CC9EC, &D_800CCB40, &D_8006C3CC, &D_800C613C };
s32 D_800E73F4[3] = { 0, -256, 0 };
void *D_800E7400[32] = { &D_8006B17C, 0, 0, 0, &D_8006B178, 0, 0, 0, &D_8006B19C, 0, 0, 0, &D_8006B1A4, 0, 0, 0, &D_8006D494, 0, 0, 0, &D_8006D0F0, 0, 0, 0, &D_8006D420, 0, 0, 0, &D_8006DF70, 0, 0, 0 };
s32 D_800E7480[4] = { 589824, 0, -16709368, 134217728 };
void *D_800E7490[2] = { &D_800E7400, &D_800E7400 };
s32 D_800E7498[3] = { 51642376, 134744072, 134217728 }; /* inferred aggregate type; byte-exact typed C */
s32 D_800E74A4[2] = { 286529047, 438116352 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E74AC[2] = { 0, &D_800CCB60 };
struct D_800E74B4_s { s16 f_800e74b4; u8 f_800e74b6[3]; u8 f_800e74b9[19]; } D_800E74B4 = { 0, { 0, 0, 3 }, { 0, 0, 0, 128, 14, 107, 220, 0, 0, 0, 0, 0, 21, 0, 0, 7, 0, 4, 0 } }; /* members: D_800E74B4, D_800E74B6, D_800E74B9 */
s32 D_800E74CC = 0;
void *D_800E74D0[2] = { &D_800E7498, &D_800E74A4 };
struct D_800E74D8_s { s16 f_800e74d8; u8 f_800e74da[18]; } D_800E74D8 = { 3589, { 229, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 8, 119, 128 } }; /* members: D_800E74D8, D_800E74DA */
s32 D_800E74EC = 0;
s32 D_800E74F0 = 0;
s32 D_800E74F4 = 0;
s32 D_800E74F8 = 0;
s32 D_800E74FC[3] = { 33625347, 151653132, 218103808 }; /* inferred aggregate type; byte-exact typed C */
Vtx_t D_800E7508[2] = {
    { { 0, 0, 0 }, 0, { 1, 0 }, { 1, 0, 0, 0 } },
    { { -32754, 27612, 0 }, 0, { 21, 0 }, { 9, 0, 4, 0 } }
};
s32 D_800E7528 = 0;
void *D_800E752C[2] = { &D_800E7498, &D_800E74FC };
struct D_800E7534_s { s16 f_800e7534; u8 f_800e7536[18]; } D_800E7534 = { 1279, { 224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 8, 119, 128 } }; /* members: D_800E7534, D_800E7536 */
s32 D_800E7548 = 0;
s32 D_800E754C[2] = { 0, 0 };
s32 D_800E7554 = 0;
void *D_800E7558[4] = { &D_800CE4C4, &D_800CEAB4, &D_800CF2C0, &D_8006CDD4 };
s32 D_800E7568[4] = { 0, 0, -256, 4194304 };
s32 D_800E7578[4] = { 522470185, 775108608, 0, 0 }; /* inferred aggregate type; byte-exact typed C */
struct D_800E7588_s { s16 f_800e7588; s16 f_800e758a[11]; } D_800E7588 = { 1, { 0, 256, 0, -32754, 27612, 0, 0, 21, 0, 1792, 1024 } }; /* members: D_800E7588, D_800E758A */
s32 D_800E75A0 = 0;
void *D_800E75A4[2] = { &D_800E7498, &D_800E7578 };
struct D_800E75AC_s { s16 f_800e75ac; u8 f_800e75ae[18]; } D_800E75AC = { 15621, { 228, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 8, 119, 128 } }; /* members: D_800E75AC, D_800E75AE */
s32 D_800E75C0 = 0;
s32 D_800E75C4[2] = { 0, 0 };
s32 D_800E75CC = 0;
char D_800E75D0[8] = " %D*/49";
void *D_800E75D8[2] = { 0, &D_800CDFF0 };
struct D_800E75E0_s { s16 f_800e75e0; u8 f_800e75e2[3]; u8 f_800e75e5[19]; } D_800E75E0 = { 0, { 0, 0, 4 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 7, 0, 4, 0 } }; /* members: D_800E75E0, D_800E75E2, D_800E75E5 */
s32 D_800E75F8 = 0;
void *D_800E75FC[2] = { &D_800E7498, &D_800E75D0 };
struct D_800E7604_s { s16 f_800e7604; u8 f_800e7606[18]; } D_800E7604 = { -247, { 229, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 8, 119, 128 } }; /* members: D_800E7604, D_800E7606 */
s32 D_800E7618 = 0;
s32 D_800E761C = 0;
s32 D_800E7620 = 0;
s32 D_800E7624 = 0;
void *D_800E7628[5] = { &D_800CF7C8, &D_800CF95C, &D_800CF9D4, &D_8006C68C, &D_800C614C };
s32 D_800E763C[3] = { 0, -256, 0 };
s32 D_800E7648[3] = { 253957637, 386467606, 83886080 }; /* inferred aggregate type; byte-exact typed C */
s32 D_800E7654[3] = { 17503519, 692728637, 1191182336 }; /* inferred aggregate type; byte-exact typed C */
void *D_800E7660[1] = { &D_800CFA84 };
struct D_800E7664_s { u8 f_800e7664; u8 f_800e7665[3]; } D_800E7664 = { 3, { 30, 9, 0 } }; /* members: D_800E7664, D_800E7665 */
void *D_800E7668[3] = { &D_800E7648, &D_800E7654, &D_800E7660 };
s32 D_800E7674[2] = { 100716544, 0 };
u8 D_800E767C[16] = { 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0 };
void *D_800E768C[5] = { &D_800D01AC, &D_800D0340, &D_800D0400, &D_8006C960, &D_800C615C };
s32 D_800E76A0[3] = { 0, -256, 0 };
s32 D_800E76AC = 336204288; /* inferred aggregate type; byte-exact typed C */
s32 D_800E76B0 = 67900416; /* inferred aggregate type; byte-exact typed C */
void *D_800E76B4[1] = { &D_800D04F4 };
s32 D_800E76B8 = 135136000;
void *D_800E76BC[3] = { &D_800E76AC, &D_800E76B0, &D_800E76B4 };
s32 D_800E76C8[6] = { 100713472, -2146630500, 100597760, 0, 0, 0 };
Vtx_t D_800E76E0[5] = {
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
Vtx_t D_800E7730[15] = {
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
u8 D_800E7820[328] = { 0 }; /* address-taken runtime workspace */
struct D_800E7968_s { s16 f_800e7968[3]; s16 f_800e796e[109]; } D_800E7968 = { { 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } }; /* members: D_800E7968, D_800E796E */
s32 D_800E7A48[3] = { 0, 0, 0 };
s32 D_800E7A54 = 0;
s32 D_800E7A58 = 0;
s32 D_800E7A5C[6] = { 0, 0, 0, 0, 0, 0 };
s16 D_800E7A74[2] = { 0, 0 };
s32 D_800E7A78 = 0;
s32 D_800E7A7C = 0;
s32 D_800E7A80[3] = { 0, 0, 0 };
s32 D_800E7A8C = 0;
s16 D_800E7A90 = 0;
s16 D_800E7A92 = 0;
s16 D_800E7A94 = 0;
s16 D_800E7A96 = 0;
struct D_800E7A98_s { s16 f_800e7a98; s16 f_800e7a9a[3]; } D_800E7A98 = { 0, { 0, 0, 0 } }; /* members: D_800E7A98, D_800E7A9A */
s32 D_800E7AA0[55] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
s16 D_800E7B7C[2] = { 0, 0 };
s32 D_800E7B80[2] = { 0, 0 };
struct D_800E7B88_s { s16 f_800e7b88; s16 f_800e7b8a[3]; } D_800E7B88 = { 0, { 0, 0, 0 } }; /* members: D_800E7B88, D_800E7B8A */
Vtx_t D_800E7B90[5] = {
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, 0, 0 }, 0, { 0, 0 }, { 0, 0, 0, 0 } }
};
s16 D_800E7BE0[27] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
