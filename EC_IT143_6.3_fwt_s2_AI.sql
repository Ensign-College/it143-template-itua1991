
/*
    EC_IT143 6.3 Fun with Triggers
    Step 2 - Begin Creating an Answer
    Author: AI
    Date: 2026-10-05

    Question:
    How do you keep track of when a record was last modified?
*/

-- Current position:
-- A default constraint could record a date when a row is
-- initially inserted, but it would not automatically change
-- when the row is updated.
--
-- Next logical step:
-- Create an AFTER UPDATE trigger that changes the
-- LastModifiedDate whenever a customer record is updated.