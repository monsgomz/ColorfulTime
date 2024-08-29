//
//  ContentView.swift
//  ColorfulTime
//
//  Created by Montserrat Gomez on 26/08/24.
//

import SwiftUI

struct ContentView: View {
	@State private var timeRemaining: TimeInterval = 10 //TimeInterval es representacion de segundos
	@State private var timer: Timer?
	@State private var isRunning: Bool = false
	
	
    var body: some View {
        VStack {
           Text("Timer")
				.font(.title)
			
			Text(formattedTime())
			
			Image(systemName: "restart.circle")
				.onTapGesture {
					startTimer()
				}

        }
        .padding()
    }
	
	private func formattedTime() -> String { //Para mostrarlo en un texto
		var minutes = Int(timeRemaining) / 60
		var sec = Int(timeRemaining) % 60
		return String(format: "%02d:%02d", minutes, sec)
	}
	
	private func startTimer() {
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
		timeRemaining = 10
	}
}

#Preview {
    ContentView()
}
