/*  Usage: size = string_split(data,sep);
**  Arguments:
**      data        array data, string
**      sep         seperator character, string
**  Returns: size        size of the array of data
**  Notes: Converts a string of data with elements seperated by a delimiter into an array of strings.
**  Original was GMLscripts.com */
{
    var sep,dat,len,ind,pos;
    sep = argument1;
    dat = argument0 + sep;
    len = string_length(sep);
    ind = 0;
    repeat (string_count(sep,dat)) {
        pos = string_pos(sep,dat)-1;
        global.script_string_split[ind]=string_copy(dat,1,pos);
        dat = string_delete(dat,1,pos+len);
        ind += 1;
    }
    return ind;
}
