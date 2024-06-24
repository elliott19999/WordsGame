//
//  WordsTextField.swift
//  WordsGame
//
//  Created by Мадина Валиева on 24.06.2024.
//

import SwiftUI

struct WordsTextField: View {
    @State var word: Binding<String>
    var placeholder:String
    var body: some View {
        
        TextField(placeholder, text: word)
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
}

