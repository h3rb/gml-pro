/*

Instance messages are passed to object after frame 1, and can be responded to only at that time.  Similar 
to object semaphores, instances from a particular game location are deactivated and cannot be touched
so data between them must be stored and examined at the appropriate time/context.

Messages created for "noone" default to the target room, whereas messages created for a target room with
a specific UID that is present are received by that instance when the instance is reactivated upon
room refocus.

A call to check_instance_messages(id) checks the object's messages, but does not update their delay factor.

A call to delta_instance_message_time() should occur only once per frame, and occurs in End Step of o_global

*/
