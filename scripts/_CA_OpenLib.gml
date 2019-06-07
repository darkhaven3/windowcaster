///_CA_OpenLib(filename);
//
// new version of CA_OpenLib that doesn't mess with global variables.
// expects a string filename: a lib or a dat, i.e. _CA_OpenLib("SHADOW.LIB");
// returns a buffer id to the opened lib/dat, if it exists.
// if the file was not found or couldn't be loaded, returns -1.
//
{
    //import arguments
    var filename=argument0;

    //local vars
    var tmp = 0;

    //if file does not exist...
    if(!file_exists(working_directory+filename)) {
        return -1;
    }
    
    //if it does exist, make sure it is a lib/dat
    else if(file_exists(working_directory+filename)) {
            //load it and get the buffer id
            tmp = buffer_load(filename);
            return tmp;
    }
    
}
