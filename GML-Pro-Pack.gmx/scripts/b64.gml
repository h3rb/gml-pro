/*
**  Usage:
**      bytes_to_b64(str)
**
**  Arguments:
**      str     a string of bytes
**
**  Returns:
**      a string of base64 digits (RFC 3548), six bits per character
**
**  GMLscripts.com
*/
{
    var str,len,pad,tab,b,i,bin;
    str = argument0;
    len = string_length(str);
    pad = "=";
    tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    b = "";
    for (i=0;i<len;i+=3) {
        bin[0] = ord(string_char_at(str,i+1));
        bin[1] = ord(string_char_at(str,i+2));
        bin[2] = ord(string_char_at(str,i+3));
        b += string_char_at(tab,1+(bin[0]>>2));
        b += string_char_at(tab,1+(((bin[0]&3)<<4)|(bin[1]>>4)));
        if (i+1>=len) b += pad;
        else b += string_char_at(tab,1+(((bin[1]&15)<<2)|(bin[2]>>6)));
        if (i+2>=len) b += pad;
        else b += string_char_at(tab,1+(bin[2]&63));
    }
    return b;
}
