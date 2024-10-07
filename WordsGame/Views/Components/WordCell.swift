//
//  WordCell.swift
//  WordsGame
//
//  Created by Мадина Валиева on 30.06.2024.
//

import SwiftUI

struct WordCell: View {
    var word: String
    var body: some View {
        HStack {
            Text(word)
                .foregroundColor(.white)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .font(.custom("AvenirNext-Bold", size: 20))
            Text("\(word.count)")
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    WordCell(word: "ghbvth")
}
