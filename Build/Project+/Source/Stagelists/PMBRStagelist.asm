######################################################################################
PMBR Stagelist [Bird]
######################################################################################
* 26523400 00000002 # If 80523400 is less than 2
op mr r0, r4				@ $806B8F5C # Access stage location in table
op lbzx r3, r3, r0			@ $806B8F64	# Entry variable is a byte, rather than a half
op rlwinm r0, r3, 1, 0, 30	@ $800AF618	# Access stage to load
op addi r4, r4, 2			@ $800AF68C	# Table entry size
op rlwinm r3, r3, 1, 0, 30	@ $800AF6AC	# \ Relates to loading the stage frame icon
op lbz r0, 1(r3)			@ $800AF6C0	# /
op li r3, -1				@ $800AF6E8	# Disables message?
op li r3, 0xC				@ $800AF59C	# Disables stage unlocking
CODE @ $800B91C8
{
	stmw r29, 0x14(r1)
	mr r31, r6
	mr r30, r5
	mr r29, r3
	cmpwi cr2, r5, -1
	beq- cr2, 0x14		
}

.BA<-TABLE_STAGES
.BA->$80495D00
.BA<-TABLE_1
.BA->$80495D04
.BA<-TABLE_2
.BA->$80495D08
.BA<-TABLE_3
.BA->$80495D0C
.BA<-TABLE_4
.BA->$80495D10
.BA<-TABLE_5
.BA->$80495D14
.GOTO->SkipStageTables

TABLE_1:
	byte[10] | 
 0x15, |
 0x18, |
 0x01, |
 0x04, |
 0x23, |
 0x1C, |
 0x1A, |
 0x00, |
 0x28, |
 0x02 |


TABLE_2:
	byte[24] | 
 0x07, |
 0x20, |
 0x0A, |
 0x14, |
 0x05, |
 0x21, |
 0x1E, |
 0x0C, |
 0x0E, |
 0x06, |
 0x1B, |
 0x19, |
 0x16, |
 0x12, |
 0x26, |
 0x11, |
 0x13, |
 0x22, |
 0x03, |
 0x25, |
 0x2B, |
 0x1F, |
 0x10, |
 0x0F |


TABLE_3:
	byte[25] | 
 0x31, |
 0x2D, |
 0x38, |
 0x3B, |
 0x32, |
 0x33, |
 0x2E, |
 0x36, |
 0x24, |
 0x39, |
 0x3C, |
 0x27, |
 0x08, |
 0x0D, |
 0x34, |
 0x35, |
 0x2F, |
 0x09, |
 0x37, |
 0x1D, |
 0x2C, |
 0x30, |
 0x3A, |
 0x17, |
 0x0B |

TABLE_4:	# Unused
TABLE_5:	# Unused

TABLE_STAGES:
# Table of icon<->stage slot associations
half[61] |	# Stage Count + 2
| # OLD SLOTS
0x0101, 0x0202, 0x0303, 0x0404, | # Battlefield, Final Destination, Delfino's Secret, Luigi's Mansion
0x0505, 0x0606, 0x0707, 0x0808, | # Metal Cavern, Bowser's Castle, Kongo Jungle, Rumble Falls
0x0909, 0x330A, 0x492C, 0x0C0C, | # Pirate Ship, Hyrule Castle, Metroid Lab, Frigate Orpheon
0x0D0D, 0x0E0E, 0x130F, 0x1410, | # Yoshi's Island, Halberd, Lylat Cruise, Saffron City
0x1511, 0x1612, 0x1713, 0x1814, | # Spear Pillar, Port Town Aero Dive, Infinite Glacier, Flat Zone 2
0x1915, 0x1C16, 0x1D17, 0x1E18, | # Castle Siege, Wario Land, Distant Planet, Skyworld
0x1F19, 0x201A, 0x211B, 0x221C, | # Fountain of Dreams, Fourside, Smashville, Shadow Moses Island
0x231D, 0x241E, 0x4326, 0x2932, | # Green Hill Zone, PictoChat, Sky Sanctuary, Temple
0x2A33, 0x472A, 0x2C35, 0x2D36, | # Yoshi's Story, Golden Temple, Onett, Dream Land
0x2F37, 0x3038, 0x3139, 0x323A, | # Rainbow Cruise, Corneria, Big Blue, Planet Zebes
0x2E3B, 0xFF64, 0xFF64, 0x373C, | # Pokemon Stadium 2, NOTHING, NOTHING, Training Room
| # NEW SLOTS
0x4023, 0x4124, 0x4225, 0x251F, | # Dracula's Castle, Mario Circuit, Clock Town, Hanenbow
0x4427, 0x4528, 0x4629, 0x2B34, | # Dead Line, Dinosaur Land, Oil Drum Alley, Jungle Japes
0x482B, 0x0B0B, 0x4A2D, 0x4B2E, | # Bell Tower, Norfair, Cookie Country, Venus Lighthouse
0x4C2F, 0x4D30, 0x4E31, 0x4F3D, | # Mushroom Kingdom, WarioWare, Subspace, Rainbow Cruise
0x503E				| # Poke Floats


SkipStageTables:
.RESET
byte 10 @ $806B929C # Page 1
byte 24 @ $806B92A4 # Page 2
byte 25 @ $80496002 # Page 3
byte 00 @ $80496003 # Page 4 (Unused)
byte 00 @ $80496004 # Page 5 (Unused)
byte 59 @ $800AF673 # Stage Count
* E0000000 80008000
