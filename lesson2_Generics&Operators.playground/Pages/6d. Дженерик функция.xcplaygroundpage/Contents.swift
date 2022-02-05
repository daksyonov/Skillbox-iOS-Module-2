//: [Previous](@previous)

// MARK: - (d) Дженерик функция

/// Объединяет вызовы функций-аргументов, заполняя их
/// дженерик параметром
///  - Parameters:
///  - first: произвольная функция типа `(T) –> Void`
///  - second: произвольная функция типа `(T) –> Void`
/// - Returns: замыкание, в котором вызовы функций-аргументов
/// объединятся, будучи заполненными дженерик-параметром
func genericFunc<V> (
	first: @escaping (V) -> Void,
	second: @escaping (V) -> Void
) -> (V) -> Void
{
	return { v in
		first(v)
		second(v)
	}
}

/// Пример использования
genericFunc(
	first: {
		(any: String) in
		print(any)
	},
	second: {
		(any: String) in
		print(any)
	}
)

//: [Next](@next)
