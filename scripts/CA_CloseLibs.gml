{
    //floppy version
    if(global.gameversion == 0) {
            buffer_delete(global.shadowlib);
            buffer_delete(global.shadow2lib);
            buffer_delete(global.ravdata);
    }
    
    else if(global.gameversion == 1) {
            buffer_delete(global.shadowlib);
            buffer_delete(global.shadow2lib);
            buffer_delete(global.hdcastr);
            buffer_delete(global.cdcastr);
    }
    draw_text(1,40,"CA_CloseLibs: success");
}
