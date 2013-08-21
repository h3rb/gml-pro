/*
**  Usage:
**      vigenere_cipher(in,key,mode)
**
**  Arguments:
**      in      input, string
**      key     enciphering key, string
**      mode    0 = decipher, 1 = encipher
**
**  Returns:
**      a string, deciphered or enciphered
**      using a Vigenere style cipher
**
**  GMLscripts.com
*/
{
    var in,key,mode,out;
    in = argument0;
    key = argument1;
    mode = argument2;
    out = "";
    var inLen,keyLen,pos,inChar,keyChar,outChar;
    var inVal,keyVal,outVal;
    inLen = string_length(in);
    keyLen = string_length(key);
    for (pos=0;pos<inLen;pos+=1) {
        inChar = string_char_at(in,pos+1);
        keyChar = string_char_at(key,(pos mod keyLen)+1);
        inVal = ord(inChar);
        keyVal = ord(keyChar);
        if (mode) {
            outVal = (inVal + keyVal) mod 256;
        }else{
            outVal = (256 + inVal - keyVal) mod 256;
        }
        outChar = chr(outVal);
        out = out + outChar;
    }
    return out;
}
