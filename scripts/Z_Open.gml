///Z_Open(filename);
{
    var filename = argument0;
    var num=0;
    if(file_exists(filename) && filename_ext(filename) == ".pk3") {
        num=zip_unzip(filename,PATH_BASE);
        return num;
    }
    else {
        return -1;
    }
    
}
