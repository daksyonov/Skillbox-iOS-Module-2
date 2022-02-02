//: [Previous](@previous)
// MARK: - Протокол: игра в шахматы

/// Устанавливает требования к делегату игры в шахматы
/// Для удобства выделено три этапа жизненного цикла шахматной фигурки:
/// - фигурка выбрана;
/// - фигурка будет перемещена
/// - фигрука перемещается
/// - фигурка перемещена
protocol ChessGameDelegate {

	// MARK: Properties

	/// Позиция фигуры
	var position: FigureCoordinates { get }

	/// Сообщение, посылаемое в момент, когда игрок "выбрал" фигуру
	/// - Parameters:
	///  - inContext: Абстрактный "контекст" игры, который содержит всякую всячину
	///  - coordinates: Координаты фигурки, которую необходимо передвинуть
	func chessGame(
		didSelectFigure inСontext: ChessGameContext,
		with coordinates: FigureCoordinates
	)

	/// Сообщение, посылаемое в момент, когда игрок собирается сделать ход
	/// - Parameters:
	///  - inContext: Абстрактный "контекст" игры, который содержит всякую всячину
	///  - cell: Ячейка шахматной доски, на которую нужно передвинуть фигуру (координаты х, у)
	///  - options: Дополнительные опции выполнения операции, присущие контексту
	/// - Returns: Boolean, показывающий можно ли переместить фигурку
	func chessGame(
		willMoveFigure inContext: ChessGameContext,
		to cell: FigureCoordinates,
		with options: ChessGameOptions
	) -> Bool

	/// Сообщение, посылаемое в момент, когда игрок собирается сделать ход
	/// - Parameters:
	///  - inContext: Абстрактный "контекст" игры, который содержит всякую всячину
	///  - cell: Ячейка шахматной доски, на которую передвигается фигура
	///  - options: Дополнительные опции выполнения операции, присущие контексту
	/// - Returns: Boolean, показывающий можно ли завершить операцию
	func chessGame(
		isMovingFigure inContext: ChessGameContext,
		to cell: FigureCoordinates,
		with options: ChessGameOptions
	) -> Bool

	/// Сообщение, посылаемое в момент, когда игрок собирается сделать ход
	/// - Parameters:
	///  - inContext: Абстрактный "контекст" игры, который содержит всякую всячину
	///  - options: Дополнительные опции выполнения операции, присущие контексту
	/// - Returns: Координаты ячейки на которую переместили фигуру
	func chessGame(
		didMoveFigure inContext: ChessGameContext,
		with options: ChessGameOptions
	) -> FigureCoordinates

}
//: [Next](@next)
