//
//  RandomNameService.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 01.03.2022.
//

import Foundation

enum RandomNameService {

	private var header: String { "X-API-KEY" }
	private var value: String { "ec59da2cd636492b912223b7d0f200c2" }
	private var baseURL: String { "https://randommer.io/api/Name" }

	func getRandomNames(
		namePart: String = NamePart.firstname.rawValue,
		quantity: Int = 100,
		_ completion: @escaping ([String]) -> Void
	) {
		let address = baseURL

		guard let url = URL(string: address)
		else {
			return
		}

		var request = URLRequest(url: url)
		request.setValue(value, forHTTPHeaderField: header)
		request.que
	}
}
