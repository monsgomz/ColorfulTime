//
//  ContentView.swift
//  ColorfulTime
//
//  Created by Montserrat Gomez on 26/08/24.
//

import SwiftUI

struct ContentView: View {
	
	//MARK: Propiedades
	@State private var timeRemaining: TimeInterval = 1500 //TimeInterval es representacion de segundos
	@State private var timer: Timer?
	@State private var isRunning: Bool = false
	@State private var setMinutes: String = "00"
	@State private var setSeg: String = "00"
	@State private var pause: Bool = false
	@State private var start: Bool = false
	
    var body: some View {
		ZStack{
			CircleTimer(play: $pause)
			
			HStack(spacing: 2){
				Spacer()
				TextField("Minutes", text: $setMinutes)
					.frame(width: 30, height: 15, alignment: .center)
				Text(":")
				TextField("Seconds", text: $setSeg)
					.frame(width: 30, height: 15, alignment: .center)
				Spacer()
			}
			.font(.title2)
			.offset(y: UIScreen.main.bounds.height - 1000 )
			
			
			VStack (alignment: .center){
				
				Text(formattedTime()).opacity(start ? 1.0 : 0.0)
				
				HStack{
					Image(systemName: "restart.circle")
						.onTapGesture {
							startTimer()
						}
						.padding()
					
					Image(systemName: "pause.fill")
						.onTapGesture {
							pauseTimer()
						}
						.padding()
					
					Image(systemName: "stop.circle")
						.onTapGesture {
							stopTimer()
						}
						.padding()
				}
				
				WaterShape(progress: 0.9)
					.stroke(Color.red, lineWidth: 5)
					.fill(Color.red)
					.opacity(start ? 1.0 : 0.0)
				
				
			}
			.padding()
			.ignoresSafeArea(.container)
		}
		
    }
	
	//MARK: Funciones
	
	/// Formatea el tiempo para mostrarlo en cadena
	/// - Returns: Retorna una cadena en forma "00:00"
	private func formattedTime() -> String { //Para mostrarlo en un texto
		let minutes = Int(timeRemaining) / 60
		let sec = Int(timeRemaining) % 60
		return String(format: "%02d:%02d", minutes, sec)
	}
	
	
	/// Inicializa el timer
	private func startTimer() {
		let time = "\(setMinutes):\(setSeg)"
		if !pause {
			timeRemaining = TimeInterval(minutesAndSeconds: time) ?? 0.0
		}
		start.toggle()
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			if timeRemaining > 0 {
				timeRemaining -= 1
			} else {
				stopTimer()
			}
			
		}
	}
	
	/// Pausa el timer manteniendo el tiempo
	private func pauseTimer() {
		isRunning = false
		timer?.invalidate()
		pause.toggle()
		if timeRemaining <= 0 {
			timeRemaining = 1500
		}
		
	}
	
	///Cancela el timer
	private func stopTimer() {
		isRunning = false
		timer?.invalidate()
		timeRemaining = 1500
		start.toggle()
	}
}

#Preview {
    ContentView()
}
