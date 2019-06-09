///Z_Cleanup();
// destroys the temp directory if one is found.

if(directory_exists(PATH_BASE))
    directory_destroy(PATH_BASE);
