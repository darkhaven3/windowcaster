{
    var cfg=0;

    if(!file_exists("caster.cfg")) {
        cfg=file_text_open_write("caster.cfg");
        file_text_close(cfg);
        return -1;
    }
    
    else if(file_exists("caster.cfg")) {
        ini_open("caster.cfg");
    }

}
