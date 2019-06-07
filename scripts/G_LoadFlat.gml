///G_LoadFlat(lumpnum);
//returns the index of the reconstructed flat.

{
    var lumpnum = argument0;

    var j,k;
    var image=0;
    var brush=0;
    var tmpobj = global.ravdata_info[lumpnum];
    var tmpread=0;
    var texture=0;
    
    buffer_seek(global.ravdata,buffer_seek_start,tmpobj.offset);   //header contains 129 bytes of garbage (?)

    image = surface_create(64,64);
    if(!image) I_Quit("G_LoadFlat: couldn't create surface");
    else {
        surface_set_target(image);

        //main draw loop
        for(j=0;j<64;j++) {
            for(k=0;k<64;k++) {
                tmpread = buffer_read(global.ravdata,buffer_u8);
                brush = global.palette[tmpread];
                
                draw_set_color(brush);
                draw_point(k,j);
            }
        }
        //end draw loop
        
        texture = background_create_from_surface(image,0,0,64,64,false,false);
        surface_reset_target();
        surface_free(image);
        
        return texture;
        
    }
}
