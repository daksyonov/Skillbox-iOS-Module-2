//: [Previous](@previous)

import UIKit

// MARK: - (a) Оператор возведения в степень <^^>

infix operator ^^

/// Инфиксный оператор возведения в степень
/// - Parameters:
///   - lhs: Основание
///   - rhs: Степень
/// - Returns: Число, возведенное в степень
/// - Complexity: `O(n)`, где `n` – степень
func ^^(base: Int, exponent: Int) -> Int {
	guard exponent != 0
	else {
		return 1
	}

	switch exponent > 0 {
	case true:
		return exponentiatePositive(base, exponent)
	case false:
		return exponentiateNegative(base, exponent)
	}
}

/// Возводит число в степень
/// - Parameters:
///   - lhs: Основание
///   - rhs: Степень
/// - Returns: Число, возведенное в степерь
/// - Complexity: `O(n)`, где `n` – степень
private func exponentiatePositive(_ base: Int, _ exponent: Int) -> Int {
	var result = base

	for _ in 2...exponent {
		result *= base
	}

	return result
}

/// Возводит число в отрицательную степень
/// - Parameters:
///   - lhs: Основание
///   - rhs: Степень
/// - Returns: Число, возведенное в отрицательную степерь
/// - Complexity: `O(n)`, где `n` – степень
private func exponentiateNegative(_ base: Int, _ exponent: Int) -> Int {
	var result = base
	let upperBound = -1

	for _ in exponent...upperBound {
		result /= exponent
	}

	return result
}

/// Пример использования
-2 ^^ -3
1^^0
0^^3
2^^3

// MARK: - (a) Оператор удвоенного присваивания <->>

/// - Note: символ `–` у меня почепму-то был недоступен
infix operator ~>

/// Присваивает удвоенное значение переменной
/// - Parameters:
///   - source: Удваиваемое значение
///   - destination: Переменная, в которую будет записано значние
func ~>(_ source: Int, _ destination: inout Int) {
	destination = source * 2
}

/// Пример использования
var a = 0
4 ~> a

// MARK: - Оператор присваивания UItableView <<*>

infix operator <*
typealias TableViewController = UITableViewController

/// Устанавливает делегат для инстанса viewController
/// - Parameters:
///   - viewController: viewController
///   - tableView: таблица, делегатом который будет `viewController`
func <*(_ viewController: TableViewController, _ tableView: UITableView) {
	tableView.delegate = viewController
}

/// Пример использования: создадим вьюКонтроллер  и таблицу
let viewController = UITableViewController()
let tableView = UITableView()

/// Запишем адрес вьюКонтроллера
let viewAddress = Unmanaged.passRetained(
	viewController
).toOpaque().debugDescription

/// Совершим операцию присвоения
viewController <* tableView

/// Запишем адрес делегата таблицы после присвоения
let tableViewDelegateAddress = Unmanaged.passRetained(
	tableView.delegate!
).toOpaque().debugDescription

/// Сравним адрес вьюКонтроллера с адресом делегата таблицы
viewAddress == tableViewDelegateAddress

// MARK: - Оператор суммирования Int и String <+>

infix operator +

/// Инфиксный оператор сцепления строки и числа
/// - Parameters:
///   - lhs: Целочисленное значение
///   - rhs: Строка
/// - Returns: Сцепленную строку
func +(lhs: Int, rhs: String) -> String {
	String(lhs) + rhs
}

/// Пример использования
1 + "fsd"

//: [Next](@next)
