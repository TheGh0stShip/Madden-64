#include "types.h"

extern const char D_800011C8[];
extern const char D_800011D0[];
extern const char D_800011D8[];
extern const char D_800011E0[];
extern const char D_800011EC[];
extern const char D_800011F0[];
extern const char D_80001204[];
extern const char D_80001214[];
extern const char D_80001220[];
extern const char D_80001230[];
extern const char D_8000123C[];
extern const char D_80001244[];
extern const char D_8000124C[];
extern const char D_8000125C[];
extern const char D_80001270[];

void resource_stream_update(s16 value, char *out);
void func_8002E65C(char *dst, const char *src);
void func_8002E688(char *dst, const char *src);

void gameplay_interface_dispatch(u32 value, u32 count, char **lines, s16 *stats)
{
    char buf[24];
    u32 line;
    s32 mode;
    s32 j;
    s32 n;

    if (value == 0) {
        mode = 0;
    } else if (value < 10) {
        mode = 1;
    } else {
        mode = 2;
    }
    for (line = 0; line < count; line++) {
        lines[line][0] = ' ';
        lines[line][1] = 0;
    }
    line = 0;
    j = 0;
    switch (mode) {
    case 0:
        resource_stream_update(stats[j++], lines[line]);
        func_8002E688(lines[line], D_800011C8);
        resource_stream_update(stats[j++], buf);
        func_8002E688(lines[line], buf);
        func_8002E688(lines[line], D_800011D0);
        resource_stream_update(stats[j++], buf);
        func_8002E688(lines[line], buf);
        func_8002E688(lines[line], D_800011D8);
        line++;
        n = stats[j++];
        if (n != 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            func_8002E688(lines[line], D_800011E0);
            if (n != 1) {
                func_8002E688(lines[line], D_800011EC);
            }
            line++;
        }
        n = stats[j];
        if (n > 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            func_8002E688(lines[line], D_800011F0);
            if (n != 1) {
                func_8002E688(lines[line], D_800011EC);
            }
        }
        break;
    case 1:
        n = stats[j++];
        if (n != 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            if (n != 1) {
                func_8002E688(lines[line], D_80001204);
            } else {
                func_8002E688(lines[line], D_80001214);
            }
            resource_stream_update(stats[j++], buf);
            func_8002E688(lines[line], buf);
            func_8002E688(lines[line], D_800011D8);
            line++;
        } else {
            j++;
        }
        n = stats[j++];
        if (n != 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            if (n != 1) {
                func_8002E688(lines[line], D_80001220);
            } else {
                func_8002E688(lines[line], D_80001230);
            }
            resource_stream_update(stats[j++], buf);
            func_8002E688(lines[line], buf);
            func_8002E688(lines[line], D_800011D8);
            line++;
        } else {
            j++;
        }
        n = stats[j];
        if (n != 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            func_8002E688(lines[line], D_800011E0);
            if (n != 1) {
                func_8002E688(lines[line], D_800011EC);
            }
        }
        break;
    case 2:
        n = stats[j++];
        if (n != 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            func_8002E688(lines[line], D_8000123C);
            if (n != 1) {
                func_8002E688(lines[line], D_800011EC);
            }
            line++;
        }
        n = stats[j++];
        if (n != 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            func_8002E688(lines[line], D_80001244);
            if (n != 1) {
                func_8002E688(lines[line], D_800011EC);
            }
            line++;
        }
        n = stats[j++];
        if (n != 0) {
            resource_stream_update(n, buf);
            func_8002E65C(lines[line], buf);
            func_8002E688(lines[line], D_8000124C);
            if (n != 1) {
                func_8002E688(lines[line], D_800011EC);
            }
            line++;
        }
        if (line < count) {
            n = stats[j];
            if (n != 0) {
                resource_stream_update(n, buf);
                func_8002E65C(lines[line], buf);
                if (n != 1) {
                    func_8002E688(lines[line], D_8000125C);
                } else {
                    func_8002E688(lines[line], D_80001270);
                }
            }
        }
        break;
    }
}
