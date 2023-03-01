<?php


/**
 * Example sting: "This is a string that contains an email address, and it has to be found, find the email find@me.com in it"
 *
 * Here is my thought process:
 * First I want to find the position of the @ in the string, and from that select the "word" around it using the position of the space before and after.
 *
 * After finding the @ and the "word" around it, I would still need to do some basic validation to ensure it is actually a email address and not just a random @ in the input string.
 *
 * The word should have the following to be a valid email
 * - min 2 characters before the @
 * - the following series of characters after the @
 * -- min two characters - Domain
 * -- a '.' (full stop)
 * -- min two characters - Top level domain
 * !!! I don't think email validation is the focus of this assessment, so the above should suffice, and I won't need to extend into edge-cases such as validating "find@me....m".
 *
 * Having a look at the above approach, it would lead to a lot of strpos and substr functions, which can end it somewhat hard to read code.
 * I think it might be better convert the string to a array first using explode on spaces. Then we already have the string broken up into words. I should be able to use array_filter to find all words containing a "@" symbol, and then from those results validate them until the first valid email is found.
 *
 * So the process will be:
 * - Input a string containing exactly one email address.
 * - Explode string into words.
 * - Find words containing a "@" symbol.
 * - Validate these words, stop and return on first valid email.
 * 
 * I do enjoy functional programing like in question 1, but this being php, lets create a class for this.
 */