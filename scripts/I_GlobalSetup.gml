///I_GlobalSetup();
// global variable initialization.

// startup related
global.numargs=parameter_count();
global.args[0]=0;
global.modpk3[0]=0;
global.skipintro = 0;
global.autoskipconsole = 0;
global.drawver=0;

//config file
global.cfgfile=-1;

//globally visible pk3 information
global.ravenpk3 = Z_Open(working_directory+"raven.pk3");

// globally visible texture pages
// TODO: move this stuff to __TextureManager
global.originscreen = 0;
global.introscreen = 0;
global.optionscreen = 0;
global.backdropscreen = 0;
global.sevensixtwoscreen = 0;
global.font = font_add_sprite(casterfont,ord('!'),false,0);
global.numtextures=0;
global.numflats=0;
global.TextureReference = ds_map_create();  //TODO: move these into __TextureManager
global.SpriteReference  = ds_map_create();

// renderer related
global.palette[0]=0;
global.numlights=0;
global.tmpsurf=0;
global.tmptexture[0]=0;

//game window related
global.systemmsg="";

// map data
// TODO: refactor related code to deal with other map formats
global.mapbuf_tile_floors[0]=0;
global.mapbuf_tile_floorh[0]=0;
global.mapbuf_tile_ceils[0]=0;
global.mapbuf_tile_ceilh[0]=0;
global.mapbuf_tile_wallv[0]=0;
global.mapbuf_tile_unkdata_wv[0]=0;
global.mapbuf_tile_wallh[0]=0;
global.mapbuf_tile_unkdata_wh[0]=0;
global.mapbuf_tile_packdoors[0]=0;
global.mapbuf_tile_unused[0]=0;

//audio related
global.musiclist[0]=0;
global.musfiles[0]=0;
global.musicinstalled=0;
global.musicenabled=1;
global.currentmusic=0;

// shadowcaster specific
// TODO: move most of this into __GameManager
// lib/dat handles
global.ravdata = 0;
global.shadowlib = 0;
global.shadow2lib = 0;
global.hdcastr = 0;
global.cdcastr = 0;

//number of entries in each
global.ravdata_numentries = 0;
global.shadowlib_numentries = 0;
global.shadow2lib_numentries = 0;
global.hdcastr_numentries = 0;
global.cdcastr_numentries = 0;

//info tables
//TODO: remove this
global.shadowlib_info[0]=0;
global.ravdata_info[0]=0;

//shadowcaster specific rpg elements
//TODO: move this into the appropriate objects
//i.e. __GameManager for maparcs/itemtypes
global.xptonext    = 1500;
global.maparcs[0]  = 0;
global.itemtype[0] = 0;

//uhhh? i think this is for player level ups?
//TODO: if so, move it to the player object
global.maxlevel = 20;
global.currentlevel = 0;

//the following code is probably not necessary.
//i'm keeping it around for a little bit for debugging purposes.

    //now we have to init all this shit because GML
    // --do we really though?

/*
    var i=0;

    for(i=0;i<1024;i++) {
        global.mapbuf_tile_floors[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_floorh[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_ceils[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_ceilh[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_wallv[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_unkdata_wv[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_wallh[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_unkdata_wh[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_packdoors[i]=0;
    }
    for(i=0;i<1024;i++) {
        global.mapbuf_tile_unused[i]=0;
    }
    for(i=0;i<64*200;i++) {
        global.tmptexture[i]=0;
    }
    for(i=0;i<256;i++) {
        global.texturelist[i]=0;
    }

    for(i=0;i<musics.NUMMUSICS;i++) {
        global.musiclist[i]=0;
    }
*/

//mod list zeroing, also probably unnecessary
//TODO: totally rewrite how mods work
/*
for(i=0;i < 8; i+=1) {
    global.modpk3[i]=0;
}
*/
