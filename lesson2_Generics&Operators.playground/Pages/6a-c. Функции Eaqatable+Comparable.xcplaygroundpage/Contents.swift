//: [Previous](@previous)

// MARK: - (а) Сравнить два Equatable объекта

/// Выводит в консоль сообщение о равенстве объектов
/// - Parameters:
///  - lhs:левая сторона сравнения
///  - rhs: правая сторона сравнения
func matchValues<T: Equatable>(_ lhs: T, _ rhs: T) {
	switch lhs == rhs {
	case true:
		print("Objects are equal")
	case false:
		print("Objects are not equal")
	}
}

/// Пример использования
matchValues("XXX","YYY")
matchValues(2,2)

// MARK: - (b) Вывести наибольшее Comparable значение

/// Выводит в консоль наибольшее число
/// - Parameters:
///  - lhs:левая сторона сравнения
///  - rhs: правая сторона сравнения
func getMax<T: Comparable>(_ lhs: T, _ rhs: T) {
	print(max(lhs, rhs))
}

/// Пример использования
getMax(1,3)
getMax("A","V")

// MARK: - (c) Заменить наибольшее Comparable значение

///  Сравнивает входные значения и
///  перезаписывает первый входной параметр
///  меньшим из двух значений, а второй параметр большим
/// - Parameters:
///  - lhs:левая сторона сравнения
///  - rhs: правая сторона сравнения
func swapWithMax<T: Comparable>(_ lhs: inout  T, _ rhs: inout T) {
	let minValue = min(lhs, rhs)
	let maxValue = max(lhs, rhs)

	lhs = minValue
	rhs = maxValue
}

/// Пример использования
var a = 3
var b = 2

swapWithMax(&a, &b)
print(a,b)

//: [Next](@next)
