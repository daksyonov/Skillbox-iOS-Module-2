//: [Previous](@previous)

/*:
 # Ассоциированные типы являются своего рода дженериками, но отличаются, потому что используются в протоколах

 # Ассоциированные типы
 Наделяют объявления протоколов возможонстью принимать некоторый тип, не определенный
 на момент объявления протокола.
 
 Зачем это нужно? К примеру разработчик того или иного АПИ хочет продемонстрировать намерение
 АПИ работать с застримлайненым типом по всем всем структурным составляющим:
 - единый Entity
 - работающий со всеми методами АПИ
 - как в VIPER примерно
 
 Либо же мы говорим, что наше АПИ может выполнять одинаковые операции с какии угодно типом, в
 случае, когда такой тип используется в АПИ ака "ассоциируется" с ним.
 */

/// Устанавливает ассоциированный тип + асбтрактные ограничения
protocol ContainerProtocol {
	
	/// Ассоц тип – это как "дженерик" для протокола
	///  - Note: можно добавить дженерик констрейнт:
	///
	///  	typealias Item: Equatable
	associatedtype Item
	
	/// Здесь какие-то методы
	mutating func push(_ item: Item)
	mutating func pop(_ 	 item: Item)
	mutating func dropLast() -> Item

	var count: Int { get }
	var wrappedValue: [Int] { get set }
	
}

/// Некоторая структура, которая просто что-то хранит
struct ConformingStruct {
	
	var wrappedValue: [Int]
}

/// Подписываемся на протокол
extension ConformingStruct: ContainerProtocol {
	
	/// Определяем плейсхолдерный протокольный тип, как `Int
	///  - Note: здесь может быть любой тип, по аналогии с дженериком
	typealias Item = Int

	var count: Int {
		return wrappedValue.count
	}
	
	mutating func push(_ item: Item) {
		wrappedValue.append(item)
	}

	mutating func push(_ items: [Item]) {
		items.forEach { push($0) }
	}

	mutating func push(_ items: Item...) {
		items.forEach { push($0) }
	}

	mutating func pop(_ item: Item) {
		return
	}
	
	mutating func dropLast() -> Item {
		0
	}
	
}

var itemStruct = ConformingStruct(wrappedValue: [4])
itemStruct.push(3)
itemStruct.pop(1)

/*:
 # Ассоциированные типы с generic ограничением
 Протокол может выступать частью своих же собственных ограничений
 */

protocol SuffixableContainer: ContainerProtocol {

	/// Протокол указывает, что ассоц. тип:
	/// - реализует его же самого
	/// - `Item`
	associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
	associatedtype Prefix: SuffixableContainer where Prefix.Item == Item

	func suffix(_ size: Int) -> Suffix
	func prefix(_ size: Int) -> Prefix
}

extension ConformingStruct: SuffixableContainer {

	typealias Suffix = ConformingStruct

	func suffix(_ size: Int) -> ConformingStruct {
		var result = [Int]()
		var output = ConformingStruct(wrappedValue: [])
		let count = wrappedValue.count

		for i in count-size..<count {
			result.append(wrappedValue[i])
		}

		output.push(result)
		return output
	}

	func prefix(_ size: Int) -> ConformingStruct {
		var result = [Int]()
		var output = ConformingStruct(wrappedValue: [])

		for i in 0..<size {
			result.append(wrappedValue[i])
		}

		output.push(result)
		return output
	}

}

itemStruct.wrappedValue
itemStruct.push(1,2,3,4,5,6,7,8,9)
itemStruct.wrappedValue
itemStruct.prefix(2).wrappedValue
itemStruct.suffix(3).wrappedValue

//: [Next](@next)
