import Foundation

// MARK: - Моки

/// Контекст полета
public struct FlyingContext {

	var temperature: UnitTemperature
	var windSpeed: WindSpeed
	var direction: Direction
	var timeInFlight: TimeInterval
	var eta: TimeInterval
	var naturalSpeed: Int
	var lightLevel: Double

	/// etc, любые другие переменные, допустимые к контексту
}

extension FlyingContext {

	public init(
		temp: UnitTemperature,
		windSpeed: WindSpeed,
		direction: Direction,
		timeInFlight: TimeInterval,
		eta: TimeInterval,
		naturalSpeed: Int,
		lightLevel: Double
	)
	{
		self.temperature = temp
		self.windSpeed = windSpeed
		self.direction = direction
		self.timeInFlight = timeInFlight
		self.eta = eta
		self.naturalSpeed = naturalSpeed
		self.lightLevel = lightLevel
	}
}

/// Скорость ветра
public struct WindSpeed {
	/* ... */
}

extension WindSpeed {

	/// Нужен был паблик инит, поэтому тут такой трюк
	public init(any: Any? = nil) {
		guard let any = any else {
			print("nil")
			return
		}

		print(String(describing:any))
	}
}

/// Направление полета
public enum Direction {
	case north, east, south, west
}
