///P_Teleport(cellx,celly,teledir);
{
    //pull in arguments
    var cellx = argument0;
    var celly = argument1;
    var teledir=argument2;

    //setup variables
    var telex=(cellx*64) + 32;
    var teley=(celly*64) + 32;

    if(global.playerteleported) {   //hack name: if player came here by cheating
    player.x = telex;
    player.y = teley;
    player.direction = teledir;
    global.playerteleported = 0;
    }
    
    else {
        global.playerteleported=0;
    }
}
