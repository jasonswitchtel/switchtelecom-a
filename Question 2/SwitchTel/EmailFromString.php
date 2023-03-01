<?php
namespace SwitchTel;
class EmailFromString {

	private string $email = 'String does not contain a email'; //This will be the default message if no matches are found.
	/**
	 * @param string $string
	 */
	public function __construct(private readonly string $string) {
		$this->findFirstEmail();
	}

	private function findFirstEmail(): void {
		$words = explode(" ", $this->string);
		foreach ($words as $word) {
			if ($this->isValidEmail($word)) {
				$this->email = $word;
				break; //Only need to find first match
			}
		}
	}

	/**
	 * @param string $email
	 *
	 * @return bool
	 *
	 * Very basic email matching. Will not reject emails with invalid characters.
	 * An alternative would be to use filter_var($email, FILTER_VALIDATE_EMAIL), but that feels equal to using a regular expression.
	 * - min 2 characters before the @
	 * - the following series of characters after the @
	 * -- min two characters - Domain
	 * -- a '.' (full stop)
	 * -- min two characters - Top level domain
	 */
	private function isValidEmail(string $email): bool {
		$email = trim($email, ",.!?()[]{}\t\n\r\0\x0B'\""); //Trim some potential troublemaker characters.
		$atPos = strpos($email, "@");
		$dotPos = strpos($email, ".");
		return (
			$atPos >= 2  // >= 2 makes sure that the word has at least two characters before the "@"
			&& $dotPos >= $atPos + 3
			&& strlen($email) >= $dotPos + 3
		);
	}


	/**
	 * @return string
	 * Return the matched email if found, or the default message.
	 */
	public function getEmail(): string {
		return $this->email;
	}



}