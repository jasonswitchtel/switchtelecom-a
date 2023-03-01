<?php
namespace SwitchTel;
class EmailFromString {

	private string $email = 'String does not contain a email';
	private array $potentialMatches = []; //Words containing the @ symbol
	/**
	 * @param string $string
	 */
	public function __construct(private string $string) {
		$this->findAtWords();
	}


	private function findAtWords() {
		$words = explode(" ", $this->string);

		$this->potentialMatches = array_filter($words, function($word)
		{
			return strpos($word, "@");
		});
		var_dump($this->potentialMatches);
	}


	public function getEmail() {
		return $this->email;
	}



}