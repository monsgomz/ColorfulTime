//
//  ContentView.swift
//  ColorfulTime
//
//  Created by Montserrat Gomez on 26/08/24.
//

import SwiftUI

struct ContentView: View {
	@State private var timeRemaining: TimeInterval = 1500 //TimeInterval es representacion de segundos
	@State private var timer: Timer?
	@State private var isRunning: Bool = false
	@State private var setMinutes: String = "00"
	@State private var setSeg: String = "00"
	
    var body: some View {
		VStack (alignment: .center){
           Text("Timer")
				.font(.title)
			
			HStack{
				
				Spacer()
				TextField("Valor timer", text: $setMinutes)
					.frame(width: 40, height: 15, alignment: .center)
				Text(":")
				TextField("Valor timer", text: $setSeg)
					.frame(width: 40, height: 15, alignment: .center)
				Spacer()
			}
			
			Text(formattedTime())
			
			Image(systemName: "restart.circle")
				.onTapGesture {
					startTimer()
				}
			
			Image(systemName: "stop.circle")
				.onTapGesture {
					stopTimer()
				}

        }
        .padding()
    }
	
	private func formattedTime() -> String { //Para mostrarlo en un texto
		let minutes = Int(timeRemaining) / 60
		let sec = Int(timeRemaining) % 60
		return String(format: "%02d:%02d", minutes, sec)
	}
	
	private func startTimer() {
		
		let time = "\(setMinutes):\(setSeg)"
		
		timeRemaining = TimeInterval(minutesAndSeconds: time) ?? 0.0
		
//		timeRemaining = (TimeInterval(setMinutes) ?? 0.0) * 60 //convertir a minutos
		
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			if timeRemaining > 0 {
				timeRemaining -= 1
			} else {
				stopTimer()
			}
			
		}
	}
	
	private func stopTimer() {
		isRunning = false
		timer?.invalidate()
		timeRemaining = 1500
	}
}

#Preview {
    ContentView()
}
