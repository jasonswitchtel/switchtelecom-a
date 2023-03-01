<?php
//Import classes
require __DIR__ . '/SwitchTel/Widget.php';
require __DIR__ . '/SwitchTel/Doodad.php';
use SwitchTel\Widget;
use SwitchTel\Doodad;

//Instantiate classes
$widget = new Widget(10);
$doodad = new Doodad(100);

//Do a 50% increase on each
increasePrice($widget, 50);
increasePrice($doodad, 50);

//Output new prices
echo $widget->getPrice() . "\n\r";
echo $doodad->getPrice();

/**
 * @param Widget|Doodad $object
 * @param int $increasePercentage
 *
 * @return void
 *
 * Type allows for both Widget and Doodad, and they both have a getPrice and a setPrice method which we can use to increase the price by the passed percentage.
 */
function increasePrice( Widget | Doodad $object, int $increasePercentage): void {
	$price = $object->getPrice();
	$price += $price * $increasePercentage / 100;
	$object->setPrice($price);
}