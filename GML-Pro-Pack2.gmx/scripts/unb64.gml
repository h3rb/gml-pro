/*  Usage: b64_to_bytes(b64)
**  Arguments: b64     a string of base64 digits (RFC 3548)
**  Returns:   a string of bytes
**  Notes:  b64 strings with characters outside of the RFC 3548 standard or with
**          excess padding characters at the end will not decode correctly.
**  GMLscripts.com*/
{
    var b,len,pad,tab,str,i,bin;
    b = argument0;
    len = string_length(b);
    pad = "=";
    tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    str = "";
    while (string_length(b) mod 4) b += pad;
    for(i=0;i<len;i+=4) {
        bin[0] = string_pos(string_char_at(b,i+1),tab)-1;
        bin[1] = string_pos(string_char_at(b,i+2),tab)-1;
        bin[2] = string_pos(string_char_at(b,i+3),tab)-1;
        bin[3] = string_pos(string_char_at(b,i+4),tab)-1;
        str += chr(255&(bin[0]<<2)|(bin[1]>>4));
        if (bin[2] >= 0) str += chr(255&(bin[1]<<4)|(bin[2]>>2));
        if (bin[3] >= 0) str += chr(255&(bin[2]<<6)|(bin[3]));
    }
    return str;
}
