// ==== FUNCTION ====================================================================
// scr_file_bin_read_ext(file,count,endian);
// ==================================================================================
// Extended byte reading mechanism.
// Argument0 is the binary file being read.
// Argument1 is the number of bytes being read from the file.
// Argument2 tells whether to reads in little or big-endian. (0: Big-endian, 1: little-endian)
// Argument3 tells whether the resulting number is signed. (0: Unsigned, 1: Signed)

var ret; ret=0; // Real value returned.

switch(argument2)
{
    case 0: // Big Endian format
    {
        var shift; shift=8*(argument1-1);   // The amount to shift the bits of the number. Decreases with every count.
        repeat(argument1)
        {
            ret+=file_bin_read_byte(argument0)<<shift;
            shift-=8;
        }
    } break;
    case 1: // Little Endian format
    {
        var shift; shift=0;             // The amount to shift the bits of the number. Increases with every count.
        repeat(argument1)
        {
            ret+=file_bin_read_byte(argument0)<<shift;
            shift+=8;
        }
    } break;
}

if (argument3) // If user wants a signed value
{
    if ret&($80<<(8*(argument1-1))) return ret-($100<<(8*(argument1-1))); // Return negative value if needed.
}

return ret; // Otherwise, return value as is.
