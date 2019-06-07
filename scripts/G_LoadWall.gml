///G_LoadWall(lumpnum, transparency);
//returns the index of the reconstructed wall graphic.

{
    var lumpnum = argument0;
    var transparency = argument1;

    var j,k;
    var image=0;
    var height=0;
    var brush=0;
    var tmpobj = global.ravdata_info[lumpnum];
    var tmpread=0;
    var texture=0;
    
    buffer_seek(global.ravdata,buffer_seek_start,tmpobj.offset);   //header contains 129 bytes of garbage (?)
    height = buffer_peek(global.ravdata,tmpobj.offset,buffer_u16);
    height *= 4;

    buffer_seek(global.ravdata,buffer_seek_relative,SC_WALL_OFFSET);
    image = surface_create(64,height);
    if(!image) I_Quit("G_LoadWall: couldn't create surface");
    else {
        surface_set_target(image);
        draw_clear_alpha(c_white,0);

        //main draw loop
        for(j=0;j<64;j++) {
            for(k=0;k<height;k++) {
                tmpread = buffer_read(global.ravdata,buffer_u8);
                //transparency test (hack)
                if(transparency) {
                    if(tmpread == 0) continue;
                }
                
                brush = global.palette[tmpread];
                
                draw_set_color(brush);
                draw_point(j,k);
            }
        }
        //end draw loop
        
        texture = background_create_from_surface(image,0,0,64,height,false,false);
        surface_reset_target();
        surface_free(image);
        
        return texture;
        
    }
}
