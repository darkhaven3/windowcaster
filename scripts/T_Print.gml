///T_Print(str, linenum, indent);

var str     = argument0;
var linenum = argument1;
var indent  = argument2;    //in pixels

__TextModeManager.line     = linenum;
__TextModeManager.line_ofs = __TextModeManager.line * __TextModeManager.font_height;

draw_set_font(font);
draw_set_color(c_white);
draw_set_alpha(255);

draw_text(indent, line_ofs, str);
