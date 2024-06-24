//
//  ContentView.swift
//  WordsGame
//
//  Created by Мадина Валиева on 24.06.2024.
//

import SwiftUI

struct StartView: View {
    @State var bigWord = ""
    @State var playerOne = ""
    @State var playerTwo = ""
    
    @State var isShowedGame = false
    
    var body: some View {
        
        VStack {
      TitleText(text: "WordsGame")
            
        WordsTextField(word: $bigWord, placeholder: "Введите большое слово")
                .padding(20)
                .padding(.top, 32)
            
            WordsTextField(word: $playerOne, placeholder: "Игрок 1")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            WordsTextField(word: $playerTwo, placeholder: "Игрок 2")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            
            Button{
                isShowedGame.toggle()
            } label: {
                Text("Старт")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(100)
                    .padding(.top)
                
            }
            
        }.background(Image("background"))
            .fullScreenCover(isPresented: $isShowedGame) {
                GameView()
            }
        
        }
   
        
    }


#Preview {
    StartView()
}
