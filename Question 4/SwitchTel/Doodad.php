<?php

namespace SwitchTel;

class Doodad {
	public function __construct(private $price = 10) {}
	public function getPrice(): int {
		return $this->price;
	}
	public function setPrice(int $newPrice): void {
		$this->price = $newPrice;
	}
}