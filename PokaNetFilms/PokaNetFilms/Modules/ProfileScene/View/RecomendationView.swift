//
//  RecomendationView.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 19.03.2024.
//

import SwiftUI


struct RecomendationView: View{
    var body: some View {
        HStack {
            Image(systemName: "book.pages.fill")
                .padding(.top, 100)
                .foregroundStyle(.blue)
            Text("Моя статистика")
                .font(.title)
                .padding(.top, 100)
                .foregroundStyle(.blue)
        }
        List{
            ForEach(0..<10){i in
                Text("hello \(i)")
            }
            .font(.title2)
        }
    }
}

#Preview {
    RecomendationView()
}
