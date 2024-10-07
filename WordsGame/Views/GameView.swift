//
//  GameView.swift
//  WordsGame
//
//  Created by Мадина Валиева on 24.06.2024.
//

import SwiftUI

struct GameView: View {
    
    var viewModel: GameViewModel
   
    @State private var confirmPresent = false
    @Environment(\.dismiss) var dismiss
    @State private var word = ""
    @State private var isAlertPresent = false
    @State  var alertText = ""
    var body: some View {
        VStack (spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
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
                    .shadow(color: viewModel.isFirst ? .blue : .clear, radius: 4, x: 0, y: 0)
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
                    .shadow(color: viewModel.isFirst ? .clear : .purple, radius: 3, x: 0, y: 0)
            }
            WordsTextField(word: $word, placeholder: "Ваше слово...")
                .padding(.horizontal)
            Button {
                var score = 0
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {
                    alertText = "опять?"
                    isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = "маленькое слово"
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = "эмм..."
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "что это?не понимаю"
                    isAlertPresent.toggle()
                } catch {
                    alertText = "неизвестная ошибка"
                    isAlertPresent.toggle()
                }
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
                ForEach(0..<self.viewModel.words.count, id: \.description) { item in
                    WordCell(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color ("FirstPlayer") : Color("SecondPlayer"))
                        .listRowInsets(EdgeInsets())
                        
                }
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
         

            
        }.background(Image("background"))
            .confirmationDialog("Вы уверены, что хотите закрыть игру?", isPresented: $confirmPresent, titleVisibility: .visible) {
                Button(role: .destructive) {
                    self.dismiss()
                } label: {
                    Text("Да")
                }
                Button(role: .cancel) {
                   
                } label: {
                    Text("Нет")
                }

            }
            .alert(alertText, isPresented: $isAlertPresent) {
                Text("ok")
            }
    }
}

#Preview {
    GameView(viewModel: GameViewModel(player1: Player(name: "вася"), player2: Player(name: "петя"), word: "хоровод"))
}
