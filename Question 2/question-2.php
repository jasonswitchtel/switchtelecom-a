<?php
/* Please refer to notes in readme.md */

require __DIR__ . '/SwitchTel/EmailFromString.php';

$string = "This is a string that contains an email address, and it has to be found, find the email find@me.com in it";
$emailFromString = new SwitchTel\EmailFromString($string);

//Output the email if found, or a message to indicate that no email was found.
echo $emailFromString->getEmail();