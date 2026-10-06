/*
    EC_IT143 6.3 Fun with Functions
    Step 2 - Begin Creating an Answer
    Author: AI
    Date: 2026-10-05

    Question:
    How do you extract the first name from the contact name?
*/

-- Current position:
-- The ContactName column contains a person's first and last name.
-- For example, 'Maria Anders' should return 'Maria'.
--
-- My first thought is to find the position of the first space
-- in ContactName and then return everything before that space.
--
-- Next logical step:
-- Test this idea with an ad hoc SELECT statement using
-- LEFT() and CHARINDEX().