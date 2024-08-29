//
//  WaterShape.swift
//  ColorfulTime
//
//  Created by Montserrat Gomez on 29/08/24.
//

import SwiftUI

struct WaterShape: Shape {
	
	let progress: CGFloat
	var applitude: CGFloat = 10
	var waveLenght: CGFloat = 20
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		let width = rect.width
		let height = rect.height
		let progressHeight = height * progress
		
		path.move(to: CGPoint(x: 0, y: progressHeight))
		
		for x in stride(from: 0, to: width, by: 10) {
			let y = progressHeight + sin(x/waveLenght) * applitude
			path.addLine(to: CGPoint(x: x, y: y))
		}
		
		path.addLine(to: CGPoint(x: width, y: progressHeight))
		path.addLine(to: CGPoint(x: width, y: height))
		path.addLine(to: CGPoint(x: 0, y: height))
		path.addLine(to: CGPoint(x: 0, y: progressHeight))
		
				
		return path
	}

}

struct vista: View {
	var body: some View{
		WaterShape(progress: 0.98)
			.stroke(Color.red, lineWidth: 5)
			.fill(Color.red)
	}
}

#Preview {
    vista()
}
