//
//  TitleText.swift
//  WordsGame
//
//  Created by Мадина Валиева on 24.06.2024.
//

import SwiftUI

struct TitleText: View {
    @State var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .foregroundColor(.white)
    }
}

#Preview {
    TitleText(text: "Хоровод")
}
