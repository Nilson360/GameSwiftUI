//
//  ContentView.swift
//  Shared
//
//  Created by Noslin on 01/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    @State private var score: Int = 0
    @State private var round: Int  = 1
    @State private var speed: CGFloat = 50.0
    @State private var showAlert: Bool = false
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("🎯🎯🎯")
            Text("PUT THE BULLSEYE CLOSE AS YOU CAN DO")
                .padding(0.5)
            Text("\(number)")
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 9/255, green: 35/255, blue: 39/255))
                .font(.system(size: 30))
            HStack{
                Text("1")
                //Slider
                Slider (
                        value: $speed,
                        in: 1...100
                )
               
                Text("100")
        
            }
//            Button(action:{
//            //  number = Int.random(in: 1...100)
//
//                //score = 100 - speed
//            }){
//                Text("Hit me")
//                Text("\(Int(speed))")
//            }
            
            //ALERT POP-UP
            Button("Hit me") {
                    showAlert = true
                    score = calculeScore(target:number, speed:Int(speed))
                    number = Int.random(in: 1...100)
                    round = round + 1
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Hello there!"),
                        message: Text("The slider value is \(Int(speed)) \nYour scored \(score) points this round.")
                    )
                    
                }
            //FIN  ALERT POP-UP
            
            Spacer()
            HStack{
                Button(action: {
                    number = Int.random(in: 1...100)
                    round = 1
                    score = 0
                }){
                    Text("Start over ")
                }
                Spacer()
                Text("Score: \(score) ")
                Spacer()
                Text("Round: \(round) ")
            }
        } .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 9/255, green: 198/255, blue: 230/255), Color(red: 160/255, green: 244/255, blue: 168/255)]), startPoint: .top, endPoint: .bottom)
        )
    }
}

 // Fonction pour calculer le score
func calculeScore(target: Int, speed: Int ) -> Int {
    var score: Int
    var targ = target - speed
    
    if targ < 0 {
       targ = targ * (-1)
    }
    score = 100 - targ
    return score
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
