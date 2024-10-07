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
    @State var isAlertPresented = false
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
                if bigWord.count > 7 {
                isShowedGame.toggle()            
                }else{
                    self.isAlertPresented.toggle()
                }
              
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
            
        }
            .background(Image("background"))
            .alert("Длинное слово слишком короткое", isPresented: $isAlertPresented, actions: {
                Text("ОК")
            })
            .fullScreenCover(isPresented: $isShowedGame) {
                let name1 = playerOne == "" ? "Игрок 1" : playerOne
                let name2 = playerTwo == "" ? "Игрок 2" : playerTwo
                
                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
                let gameViewModel = GameViewModel(player1: player1, player2: player2, word: bigWord)
                GameView(viewModel: gameViewModel)
            }
            }
        
        }
   
        
    


#Preview {
    StartView()
}
