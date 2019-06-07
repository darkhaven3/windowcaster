///I_EnumsInit();
// enums go here.

//used to identify what mode the map editor is currently in.
enum editmode {
    floors = 0,
    ceilings = 1,
    wallh = 2,
    wallv = 3,
    doors = 4,
    NUMMODES
}

    //script trigger types as found in mapname.scr
    //(byteswapped by buffer_read)
    enum trigger {
        unk_0000 = $0000,
        unk_0080 = $8000,
        unk_0200 = $0002,
        unk_0280 = $8002,
        unk_0300 = $0003,
        unk_0400 = $0004,
        unk_0500 = $0005,
        unk_0580 = $8005,   //poi
        unk_0680 = $8006,
        unk_0780 = $8007,
        unk_0800 = $0008,
        unk_0880 = $8008,
        unk_0980 = $8009,
        unk_0f80 = $800f,
        unk_1080 = $8001,
        unk_1380 = $8013,
        unk_1a80 = $801a,
        unk_1b80 = $801b,
        unk_1e80 = $801e,
        unk_1480 = $8014,
        unk_1580 = $8015,
        unk_2280 = $8022,
        unk_2380 = $8023,
        unk_2480 = $8024,
        unk_2880 = $8028,
        unk_3c00 = $003c,
        unk_3d00 = $003d,
        unk_3e00 = $003e,
        unk_3f00 = $003f,
        unk_4200 = $0042,
        unk_4900 = $0049,
        unk_4a00 = $004a,
        unk_4f00 = $004f,
        unk_5800 = $0058,
        teleport = $800a
    }

    //what type of game install we've autodetected.
    //this is where you would add your own game id
    //if you want to modify the logic for game
    //detection.
    enum installtype {
        floppy  =   0,
        cd      =   1,
        first   =   2,
        unknown =   3
    }
    
    //which cardinal direction something wants to move in
    enum movedir {
        none = 0,
        east = 1,
        north = 2,
        west = 3,
        south = 4
    }
    
    //future expansion, maybe?
    enum state_e {
        engine   = 0,
        graphics = 1,
        game     = 2
    }
    
//
// begin shadowcaster-specific enums
//

    //which shape the player is currently in (shadowcaster)
    enum morph {
        human   =   0,
        cat     =   1,
        caun    =   2,
        opsis   =   3,
        frog    =   4
    }

    //the height of the player's eyes in each shape
    enum morpheyes {
        human   =   36,
        cat     =   36,
        caun    =   16,
        opsis   =   32,
        frog    =   28
    }
    
    //default relative-Z of the player when morphing into a shape
    enum morphfeet {
        human   =   0,
        cat     =   0,
        caun    =   0,
        opsis   =   8,
        frog    =   0
    }
    
    //shadowcaster music list
    enum musics {
        g_castle = 0,
        g_combt1 = 1,
        g_combt2 = 2,
        g_defeat = 3,
        g_drkman = 4,
        g_end = 5,
        g_intro = 6,
        g_intro2 = 7,
        g_rock = 8,
        g_ruins = 9,
        g_shape = 10,
        g_shpchg = 11,
        g_shrin1 = 12,
        g_shrin2 = 13,
        g_telprt = 14,
        g_temple = 15,
        g_title = 16,
        g_undgnd = 17,
        g_undwtr = 18,
        g_victry = 19,
        g_voice = 20,
        NUMMUSICS = 21
        }


    //shadowcaster game level
    enum gamelevels {
        ruinsa      = 0,
        ruinadrn    = 1,
        ruinawat    = 2,
        ruinsb      = 3,
        ruinbwat    = 4,
        ruinbtem    = 5,
        temple      = 6,
        castwine    = 7,
        castthrn    = 8,
        castmoon    = 9,
        undrmine    = 10,
        underspi    = 11,
        wateraci    = 12,
        watercan    = 13,
        waterdra    = 14,
        waterobe    = 15,
        lavamine    = 17,
        lavamud     = 16,
        vestetst    = 18,
        vestebld    = 19,
        vestefin    = 20,
        NUMLEVELS   = 21
    }
