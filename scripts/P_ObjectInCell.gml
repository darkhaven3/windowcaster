///P_ObjectInCell(instance);
//==========================
//takes an object instanceid as input
//and returns the cellid that object is in.
//

{
    //take in arguments.
    var instance=argument0;

    //do the math.
    var curx = floor(instance.x/64);
    var cury = floor(instance.y/64);
    var curc = (cury*32) + curx;
    
    return curc;
}
