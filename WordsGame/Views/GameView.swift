//
//  GameView.swift
//  WordsGame
//
//  Created by Мадина Валиева on 24.06.2024.
//

import SwiftUI

struct GameView: View {
    
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
            
            Text("Хоровод")
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(.white)
            
            HStack (spacing: 12) {
                VStack{
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Вася")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(26)
                    .shadow(color: .blue, radius: 4, x: 0, y: 0)
                VStack{
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Петя")
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
                print("Готово")
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
    GameView()
}
