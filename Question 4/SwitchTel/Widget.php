<?php

namespace SwitchTel;

class Widget {
	public function __construct(private $price = 100) {}
	public function getPrice(): int {
		return $this->price;
	}
	public function setPrice(int $newPrice): void {
		$this->price = $newPrice;
	}
}