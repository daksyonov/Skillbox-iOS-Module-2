import UIKit

// MARK: - Context

/// Мок "контекста игры"
public struct ChessGameContext {

	/// Просто какие-то свойства, которые прокидываем в контекст (к примеру):
	/// - размер сетки
	/// - цвет, за который играет игрок
	/// - счет
	var contextProperty0, contextProperty1, contextProperty2: Any
}

// MARK: - Other

/// Мок словарика с "опциями" для игры, прокидываемых, в момент, когда делегирющий объект
public typealias ChessGameOptions = [String: Any]

/// У каждой фигуры есть свои координаты
public typealias FigureCoordinates = CGPoint
