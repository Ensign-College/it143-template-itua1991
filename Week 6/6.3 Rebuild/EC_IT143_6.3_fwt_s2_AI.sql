/*
    EC_IT143 6.3 Fun with Triggers - S2
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Explain why a default constraint is not enough.
*/
/*
    A default value can record a value when a row is inserted,
    but it does not automatically change when the row is updated.
    An AFTER UPDATE trigger can set LastModifiedDate on updates.
*/
