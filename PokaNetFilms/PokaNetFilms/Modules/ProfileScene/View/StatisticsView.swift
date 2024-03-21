//
//  RecomendationView.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 19.03.2024.
//

import SwiftUI


struct StatisticsView: View{
    //View Properties
    @State var tapsOnOpenSettings = UserDefaults.standard.integer(forKey: "tapsOnOpenSettings")
    @State var tapsOnOpenRecomendation = UserDefaults.standard.integer(forKey: "tapsOnOpenRecommendation")
    @State var tapsOnSearchBarButton = UserDefaults.standard.integer(forKey: "tapsOnSearchBarButton") / 2
    @State var tapsOnSearchScene = UserDefaults.standard.integer(forKey: "tapsOnSearchScene")
    @State var tapsOnMovieCell = UserDefaults.standard.integer(forKey: "tapsOnMovieCell")
    @State var tapsOnBuyTicket = UserDefaults.standard.integer(forKey: "tapsOnBuyTicket")
    @State var tapsOnPlayVideo = UserDefaults.standard.integer(forKey: "tapsOnPlayVideo")
    @State var likedFilmsCount = UserDefaults.standard.integer(forKey: "likedFilmsCount")
    
    var body: some View {
        var likedGenres: String = makeGenres()
        HStack {
            Image(systemName: "book.pages.fill")
                .padding(.top, 50)
                .foregroundStyle(.blue)
            Text("Моя статистика")
                .font(.title)
                .padding(.top, 50)
                .foregroundStyle(.blue)
        }
        ScrollView{
            VStack(alignment: .leading,spacing: 16){
                Text("Статистика фильмов")
                    .font(.title2)
                    .foregroundStyle(.blue)
                VStack(alignment: .leading,spacing: 8){
                    Text("Количество просмотров детального описания: \(tapsOnMovieCell)")
                    Text("Количество фильмов в избранном: \(likedFilmsCount)")
                    Text("Жанры в избранном: \(likedGenres)")
                    Text("Количество переходов по кнопке покупки билета: \(tapsOnBuyTicket)")
                    Text("Количество переходов по кнопке просмотра трейлера: \(tapsOnPlayVideo)")
                }
                Text("Статистика поиска")
                    .font(.title2)
                    .foregroundStyle(.blue)
                VStack(alignment: .leading,spacing: 8){
                    Text("Количество переходов в поиск: \(tapsOnSearchScene)")
                    Text("Количество нажатий на поиск по жанру: \(tapsOnSearchBarButton)")
                }
                Text("Статистика пользователя")
                    .font(.title2)
                    .foregroundStyle(.blue)
                VStack(alignment: .leading,spacing: 8){
                    Text("Переходы в мои рекомендации: \(tapsOnOpenRecomendation)")
                    Text("Количество редактирований профиля: \(tapsOnOpenSettings)")
                       
                }
            }
            .padding(.top, 30)
            .padding(.leading, 8)
        }
    }
    
    private func makeGenres(likedGenres:[String] = UserDefaults.standard.array(forKey: "likedGenres") as? [String] ?? []) -> String{
        var answer = ""
        if likedGenres != [] {
            for item in likedGenres{
                answer += " " + String(item)
            }
        }
        return answer
    }
}

#Preview {
    StatisticsView()
}
