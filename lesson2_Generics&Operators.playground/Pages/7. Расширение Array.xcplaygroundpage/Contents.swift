//: [Previous](@previous)

// MARK: - (a) Array Comparable Max Extension

extension Array where Element: Comparable {

	/// Возвращает максимальный элемент массива
	var maxValue: Element? {
		guard !isEmpty else { return nil }
		return self.max()
	}

}

/// Пример использования
let elements = [1.1, 2.2, 3.2, 4.2, 5.2]
elements.maxValue

// MARK: - (b) Array Equatable Remove Duplicates

extension Array where Element: Equatable & Hashable {

	/// Возвращает максимальный элемент массива
	var unduplicated: [Element]? {
		guard !isEmpty else { return nil }
		guard count > 1 else { return self }

		var dict = [Element: Bool]()

		return filter {
			dict.updateValue(true, forKey: $0) == nil
		}
	}

}

/// Пример использования
let duplicatedArray = [1, 2, 2, 4, 5, 1, 2 , 6, 5 , 4]
duplicatedArray.unduplicated

//: [Next](@next)
