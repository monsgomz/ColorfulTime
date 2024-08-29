//
//  ExtensionTimeInterval.swift
//  ColorfulTime
//
//  Created by Montserrat Gomez on 29/08/24.
//

import Foundation

extension TimeInterval {
	init?(minutesAndSeconds: String) {
		let components = minutesAndSeconds.split(separator: ":")
		guard components.count == 2,
			  let minutes = Double(components[0]),
			  let seconds = Double(components[1]) else {
			return nil
		}
		
		self = (minutes * 60) + seconds
	}
}

