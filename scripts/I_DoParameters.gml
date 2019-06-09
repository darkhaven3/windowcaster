///I_DoParameters();
// enumerate startup parameters (unused atm)

    var i=0;
    for(i=0; i< global.numargs; i += 1) {
        global.args[i]=parameter_string(i+1);
    }
