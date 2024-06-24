//
//  GameView.swift
//  WordsGame
//
//  Created by Мадина Валиева on 24.06.2024.
//

import SwiftUI

struct GameView: View {
    
    var viewModel: GameViewModel
    
    @State private var word = ""
    var body: some View {
        VStack (spacing: 16) {
            HStack {
                Button {
                    print("Выход")
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("blue"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Bold", size: 16))
                }
                Spacer()
            }
            
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 30))
                .foregroundColor(.white)
            
            HStack (spacing: 12) {
                VStack{
                    Text("\(viewModel.player1.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text(viewModel.player1.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(26)
                    .shadow(color: .blue, radius: 4, x: 0, y: 0)
                VStack{
                    Text("\(viewModel.player2.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text(viewModel.player2.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(26)
                    .shadow(color: .purple, radius: 3, x: 0, y: 0)
            }
            WordsTextField(word: $word, placeholder: "Ваше слово...")
                .padding(.horizontal)
            Button {
                let score = viewModel.check(word: word)
                if score > 1 {
                    self.word = ""
                }
            } label: {
                Text("Готово")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity)
                    .background(Color("blue"))
                    .cornerRadius(12)
                    .font(.custom("AvenirNext-Bold", size: 26))
                    .padding(.horizontal)
       
            }
            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
         

            
        }.background(Image("background"))
    }
}

#Preview {
    GameView(viewModel: GameViewModel(player1: Player(name: "вася"), player2: Player(name: "петя"), word: "хоровод"))
}
