///G_LoadSprite(num);
// loads a shadowcaster sprite. experimental and dangerous.
// basically broken right now. do not use.
{
    var num = argument0;
    var img = 0;    //surface id
    
    var info = global.ravdata_info[num];
    
    var colofs   = 0;   //offset in ravdata to coldir
    var colstart = 0;   //start of column directory in this lump
    var height = 0;
    var width  = 0;
    var hackofs = 0;
    
    var spr = 0;
    
    var brush = 0;
    
    var j=0;
    var k=0;
    var colpos=0;   //for height calculation
    var colinstart=0; //for height calculation
    var start=0;
    var stop =0;
    var diff =0;
    
    buffer_seek(global.ravdata, buffer_seek_start, info.offset);
    
    colstart = buffer_read(global.ravdata, buffer_u16);
    width    = buffer_read(global.ravdata, buffer_u16);
    
    colofs = info.offset + 4;   //is the column start offset garbage??
    
    buffer_seek(global.ravdata,buffer_seek_start, colofs);
    
    start = buffer_read(global.ravdata,buffer_u16);
    stop  = buffer_read(global.ravdata,buffer_u16);
    
    height = stop - start;
    
    hackofs = (colofs + 4 + (width*2));
    
    buffer_seek(global.ravdata, buffer_seek_start, hackofs);
    
    img = surface_create(width, height);
    surface_set_target(img);
    draw_clear_alpha(0,0);
    
    for(j = 0;j < width; j++) {
        for(k = 0;k < height; k++) {
            brush = buffer_read(global.ravdata, buffer_u8);
            
            if(brush == 0) continue;
            
            draw_set_color(global.palette[brush]);
            draw_point(j,k);
        }
    }
    
    surface_reset_target();
    spr = sprite_create_from_surface(img,0,0,width,height,false,false,0,0);
    surface_free(img);
    
    return spr;
    //global.systemmsg = "G_loadsprite: w="+string(width)+" h="+string(height)+" col:"+string(colstart);
    
}
