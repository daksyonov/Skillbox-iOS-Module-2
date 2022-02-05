///*:
// # Функции с дженерик ограничением
// Дженерик констрейнты помогают написать функции, принимающие ряд типов, подчиненных
// одинаковым протоколам.
// */
//
//
///// Сравнивает структуры и возвращает результат
///// - Returns: Boolean, отражающий результат
///// - Note: Принимает структуры, реализующие протокол `SuffixableContainer`
///// - Note: Ассоциированный тип `Item` у структур должен совпадать и реализовывать `Equatable`
//func matchAll<S1: SuffixableContainer, S2: SuffixableContainer>(
//	_ lhs: S1,
//	_ rhs: S2
//) -> Bool where S1.Item == S2.Item, S1.Item: Equatable {
//	guard lhs.count == rhs.count
//	else {
//		return false
//	}
//
//	for i in 0..<lhs.count {
//		guard lhs.wrappedValue[i] == rhs.wrappedValue[i]
//		else {
//			return false
//		}
//	}
//	return true
//}
//
//let lhs = ConformingStruct(wrappedValue: [1,2,3])
//let rhs = ConformingStruct(wrappedValue: [1,2,3])
//let _rhs = ConformingStruct(wrappedValue: [1,1,3])
//
//matchAll(lhs, rhs)
//matchAll(lhs, _rhs)
//
///*:
// # Расшиения с дженерик ограничением
// Также можно расширять, используя дженерик ограничения.
// К примеру можно добавить расширение, определяющее, являяется ли элемент последним
// */
//
//extension SuffixableContainer where Item: Equatable {
//
//	func isLast(_ item: Int) -> Bool {
//		item == wrappedValue.last
//	}
//}
//
//_rhs.isLast(1)
//_rhs.isLast(3)
