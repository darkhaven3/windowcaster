///G_CreatePalette(lumpname);
{

    var lumpname=argument0;
    var num = CA_CheckNumForNameDat(lumpname);

    var i=0;
    var rr=0;
    var gg=0;
    var bb=0;
    var gmc=0;

    var tmpobj = global.ravdata_info[num];
    var tmpofs = tmpobj.offset;
    
    //debug
    //show_message("palette found at "+string(tmpofs));

    buffer_seek(global.ravdata,buffer_seek_start,tmpofs);

    for(i=0;i<256;i++) {
    
        //the game's palette is unusually dark.
        //this should be faithful to dos behavior,
        //but it's hard to eyeball.
        rr = buffer_read(global.ravdata,buffer_u8) * 4;
        gg = buffer_read(global.ravdata,buffer_u8) * 4;
        bb = buffer_read(global.ravdata,buffer_u8) * 4;
        
        gmc = make_color_rgb(rr,gg,bb);
        global.palette[i]=gmc;
    }
    
}
