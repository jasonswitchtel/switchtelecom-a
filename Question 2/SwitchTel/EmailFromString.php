<?php
namespace SwitchTel;
class EmailFromString {

	private string $email = 'String does not contain a email';
	private array $potentialEmails = []; //Words containing the @ symbol
	/**
	 * @param string $string
	 */
	public function __construct(private string $string) {
		$this->findPotentialEmails();
	}


	private function findPotentialEmails(): void {
		$words = explode(" ", $this->string);

		$this->potentialEmails = array_filter($words, function($word)
		{
			return strpos($word, "@");
		});
		var_dump($this->potentialEmails);
	}


	public function getEmail(): string {
		return $this->email;
	}



}