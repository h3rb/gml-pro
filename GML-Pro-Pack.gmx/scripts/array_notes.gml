/*
Advanced Arrays Extension Documentation
By Jonah 

Quick Reference:

array_create()                                      - Creates an array and returns an ID to be used with other functions
array_set(arrayId, value, key1, key2, key3...)      - Sets a value to an array
array_set2(arrayId, arrayId2, key1, key2, key3...)  - Sets an array to an array (merges them kinda)
array_get(arrayId, key1, key2, key3...)             - Retrieves a value or sub-array id from an array
array_copy(arrayId)                                 - Copies an array, Returns New array ID

array_destroy(arrayId, key1, key2, key3...)
Destroys an array or part of one. Does not work when you put a
sub-array as the first argument. Use array_destroy2 for that.
Take care to destroy instance's arrays when the instances get destroyed.

array_destroy2(arrayId)
Just like array_destroy but works for sub-arrays as the argument.
It does not allow for keys though and can be much slower if you
have a lot of arrays set

array_print(arrayId)
This function show_messages()'s the arrays contents (useful for debugging).
It also saves it to the file Array_print.txt 

array_size(arrayId)        - Gets the size of an array. Counts branches to, but is not recursive. Returns size
array_isSet(arrayId, key1, key2, key3...)    - Tests if key(s) are set

Description:

Advanced Arrays is an extension which adds a new artificial type of array
to Game Maker. Although I would like to say that this extension greatly
extends the GML language (it sure seems like it does when you use it),
I believe that would be a lie considering this extension was made in GML.
It does, however greatly ease programming by more than a few miles.

Contents:
-Creating and Setting Arrays
-Using array_print() for Debugging
-Retrieving Values from Arrays
-Using array_copy()
-Using "[]"
-Using array_size() to loop through arrays
-Do not use 0 (real) as a key!
-Quick function lookup

Lets call these artificial arrays "Advanced Arrays". 
First, lets go over the syntax of this "new" array type.

Creating and Setting Arrays

In Game Maker you can normally create arrays as so:

array[0] = "this"
array[1] = "that"

In Game Maker you can even create 2-dimensional arrays as so:

array[1, 2] = "value" or, in general we could say,
array[key1, key2] = value

An identical version of that but using "Advanced Arrays" is as follows:

array = array_create(); // Creates array

array_set(array, value, key1, key2);

The main difference here besides the syntax is that is that
you must officially create the array with array_create()
before using it. array_create() simply creates an array and
returns a unique id that can be used in future operations to
refer to it. This is very similar to the built-in data
structures in Game Maker.

Believe it or not though, "Advanced Arrays" actually allows
for more than two keys. In fact, you can have up to 14 keys.
Although you can't actually do the following in Game Maker,
you could imagine this:

array[1, 5, 2, 8] = 6000

Although that's not possible for normal Game Maker arrays, you
can actually do this with this extension. Example:

array = array_create(); // Creates array
array_set(array, 6000, 1, 5, 2, 8);

"Advanced Arrays" also allows for keys to be strings, not just numbers. Example:

array = array_create(); // Creates array
array_set(array, 6000, "first key", "second key", "third key");

Using array_print() for Debugging

This extension also comes with a nice function to show_message()
all of the data inside of an array at once. This is especially
useful for debugging. An example to start:

array = array_create(); // Creates array
array_set(array, 6000, "first key", "second key", "third key");
array_print(array);

This will output the following code using show_message()
Dumping data in array with id# 1
Array
(
     [first key] => Array
     (
          [second key] => Array
          (
               [third key] => 6000
          )
     )
)

That just kind of gives you a visual of what the array looks like.
It's very similar to the php function print_r(). Here is another
example of the array_print() function.

array = array_create(); // Creates array
array_set(array, 4000, "first key", "a key");
array_set(array, 6000, "first key", "second key", "third key");
array_set(array, 5000, "first key", "second key", "another key key");
array_print(array);

This will output the following text:

Array
(
     [first key] => Array
     (
          [a key] => 4000
          [second key] => Array
          (
               [another key key] => 5000
               [third key] => 6000
          )
     )
)

It's also worth noting that it not only show_message()s 
it but it also will save it to a file called Array_print.txt,
so you can look at it after you close your Game Maker program.

To retrieve a value from an array we have another function:

array_get(array, key1, key2, key3...);

Example of use:

array = array_create(); // Creates array
array_set(array, 4000, "first key", "a key");
array_set(array, 6000, "first key", "second key", "third key");
array_set(array, 5000, "first key", "second key", "another key key");
value = array_get(array, "first key", "a key");
show_message( string( value ) ) // Prints 4000 to screen

You can also use array_get() to retrieve part of an array, or a sub-array.

array = array_create(); // Creates array
array_set(array, 4000, "first key", "a key");
array_set(array, 6000, "first key", "second key", "third key");
array_set(array, 5000, "first key", "second key", "another key key");
value = array_get(array, "first key", "second key");
array_print(value)

This will output the following text:

Array
(
     [another key key] => 5000
     [third key] => 6000
)

See how it returned a section of the array instead of a flat value?
This is why we had to use array_print() to view it.

Something important to note though is that this function does not
actually return a copy of the sub-array, but an id to the sub-array
itself. Any changes made to the sub-array will be made to the whole
array. To copy an array you can use the array_copy() function.

Using array_copy():

array_copy() is a simple function that takes a single argument,
an array ID, and then duplicates the array and returns the new
array's id. Here is a single example:

array = array_create(); // Creates array
array_set(array, 4000, "first key", "a key");
array_set(array, 6000, "first key", "second key", "third key");
array_set(array, 5000, "first key", "second key", "another key key");
subArray = array_get(array, "first key", "second key");
copy = array_copy(subArray);
array_set(copy, "New Value", "third key");
array_print(copy);
array_print(array); 

This will output the following text:

Array
(
     [another key key] => 5000
     [third key] => New Value
)
And then the following text:

Array
(
     [first key] => Array
     (
          [a key] => 4000
          [second key] => Array
          (
               [another key key] => 5000
               [third key] => 6000
          )
     )
)

Notice how since you copied the array, when you set the key "third key"
to a new value it only changed in the copied array.

Using "[]"

If you use "[]" as a key in array_set() the extension will automatically
make the key be equal to the size of the array (non-recursively). An
example will make this the most clear.

array = array_create(); // Creates array
array_set(array, "Sword", "[]");
array_set(array, "Knife", "[]");
array_set(array, "Bow", "[]");
array_print(array); 

This will output the following text:

Array
(
     [1] => Sword
     [2] => Knife
     [3] => Bow
)

Using array_size() to loop through arrays:

array = array_create(); // Creates array
array_set(array, "Sword", "[]");
array_set(array, "Knife", "[]");
array_set(array, "Bow", "[]");
for(n=1;n<=array_size(array);n+=1) {
    value = array_get(array, n);
    show_message(value);
} 

This will output the following:

Sword
Knife
Bow

Do not use 0 (real) as a key!

One last thing I need to mention is that you can not set a key to 0. 
It will seem to work sometimes but it will cause errors. 
"0" (string), on the other hand is ok. When I need my keys to be
consecutive numbers I just start with 1.

*/
