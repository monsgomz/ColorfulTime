//
//  CircleTime.swift
//  ColorfulTime
//
//  Created by Montserrat Gomez on 29/08/24.
//

import SwiftUI

struct CircleTimer: View {
	@State private var flag = false
	@Binding var play: Bool
	
    var body: some View {
		VStack(alignment: .center){
			Circle()
				.fill(Color.blue)
				.frame(width: 100, height: 100, alignment: .center)
				.scaleEffect(flag ? 1.5 : 1.0)
				.offset(x: 0, y: flag ? UIScreen.main.bounds.height - 1000 : -300)
			
				.onTapGesture {
					flag.toggle()
				}
				.animation(Animation.bouncy, value: flag)
		}
    }
}

#Preview {
	CircleTimer(play: .constant(false))
}
