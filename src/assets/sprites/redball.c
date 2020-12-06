#include "redball.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2017
// Palette uses hardware values.
const u8 main_pal111[16] = { 0x54, 0x44, 0x5c, 0x58, 0x45, 0x52, 0x46, 0x5e, 0x40, 0x47, 0x42, 0x53, 0x5a, 0x4a, 0x43, 0x4b };

// Tile sp_redball: 8x8 pixels, 4x8 bytes.
const u8 sp_redball[4 * 8] = {
	0x00, 0x55, 0xaa, 0x00,
	0x00, 0xeb, 0xd7, 0x00,
	0x55, 0xc3, 0xc3, 0xaa,
	0xeb, 0xc3, 0xc3, 0xd7,
	0xeb, 0xc3, 0xc3, 0xd7,
	0x55, 0xc3, 0xc3, 0xaa,
	0x00, 0xeb, 0xd7, 0x00,
	0x00, 0x55, 0xaa, 0x00
};

