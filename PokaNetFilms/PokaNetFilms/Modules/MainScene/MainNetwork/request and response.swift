////
////  request and response.swift
////  PokaNetFilms
////
////  Created by Кирилл Давыденков on 27.12.23..
////
//
//
//import Foundation
//
//let headers = [
//  "accept": "application/json",
//  "X-API-KEY": "T2ZRT4Z-82M49QD-HM64Y1X-6HBP3X9"
//]
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://api.kinopoisk.dev/v1.4/movie?page=1&limit=10&selectFields=name&selectFields=ageRating&selectFields=genres&selectFields=poster&selectFields=persons&selectFields=premiere&sortField=premiere.russia&sortType=1&status=filming")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                    timeoutInterval: 10.0)
//request.httpMethod = "GET"
//request.allHTTPHeaderFields = headers
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//  if (error != nil) {
//    print(error as Any)
//  } else {
//    let httpResponse = response as? HTTPURLResponse
//    print(httpResponse)
//  }
//})
//
//dataTask.resume()
//
//
//{
//  "docs": [
//    {
//      "name": null,
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "мультфильм"
//        }
//      ],
//      "premiere": {
//        "world": "2024-04-25T00:00:00.000Z"
//      }
//    },
//    {
//      "name": "Мэри и Джордж",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "драма"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 2708276,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2708276.jpg",
//          "name": "Райан Олива",
//          "enName": "Ryan Oliva",
//          "description": "Wearstrap",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 6096949,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6096949.jpg",
//          "name": "Лидия Флеминг",
//          "enName": "Lydia Fleming",
//          "description": "Anne Turner",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2669,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2669.jpg",
//          "name": "Джулианна Мур",
//          "enName": "Julianne Moore",
//          "description": "Mary Villiers",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 56850,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_56850.jpg",
//          "name": "Никола Уокер",
//          "enName": "Nicola Walker",
//          "description": "Lady Hatton",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2877736,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2877736.jpg",
//          "name": "Нив Алгар",
//          "enName": "Niamh Algar",
//          "description": "Sandie",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 10034,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10034.jpg",
//          "name": "Тони Кёрран",
//          "enName": "Tony Curran",
//          "description": "King James I",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 45776,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_45776.jpg",
//          "name": "Трине Дюрхольм",
//          "enName": "Trine Dyrholm",
//          "description": "Queen Anne",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 24180,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_24180.jpg",
//          "name": "Саймон Расселл Бил",
//          "enName": "Simon Russell Beale",
//          "description": "Sir George Villiers",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 17770,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_17770.jpg",
//          "name": "Шон Джилдер",
//          "enName": "Sean Gilder",
//          "description": "Sir Thomas Compton",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 5073551,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5073551.jpg",
//          "name": "Амелия Гетинг",
//          "enName": "Amelia Gething",
//          "description": "Frances Coke",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 3777292,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3777292.jpg",
//          "name": "Оливер Коутс",
//          "enName": "Oliver Coates",
//          "description": null,
//          "profession": "композиторы",
//          "enProfession": "composer"
//        },
//        {
//          "id": 1986992,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1986992.jpg",
//          "name": "Хелен Скотт",
//          "enName": "Helen Scott",
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 1987861,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1987861.jpg",
//          "name": "Адам Маршалл",
//          "enName": "Adam Marshall",
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 3168225,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3168225.jpg",
//          "name": "Джек Берк",
//          "enName": "Jack Berk",
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 71121,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_71121.jpg",
//          "name": "Энни Саймонс",
//          "enName": "Annie Symons",
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 1253816,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1253816.jpg",
//          "name": "Флориан Коссен",
//          "enName": "Florian Cossen",
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 1689298,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1689298.jpg",
//          "name": "Алекс Винклер",
//          "enName": "Alex Winckler",
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 1853750,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1853750.jpg",
//          "name": "Оливер Херманус",
//          "enName": "Oliver Hermanus",
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 2000983,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2000983.jpg",
//          "name": "Крис Уайатт",
//          "enName": "Chris Wyatt",
//          "description": null,
//          "profession": "монтажеры",
//          "enProfession": "editor"
//        },
//        {
//          "id": 4041862,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4041862.jpg",
//          "name": "Ив Доэрти",
//          "enName": "Eve Doherty",
//          "description": null,
//          "profession": "монтажеры",
//          "enProfession": "editor"
//        },
//        {
//          "id": 5026308,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5026308.jpg",
//          "name": "Бен Уайтхед",
//          "enName": "Ben Whitehead",
//          "description": null,
//          "profession": "монтажеры",
//          "enProfession": "editor"
//        },
//        {
//          "id": 1169687,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1169687.jpg",
//          "name": "Франк Ламм",
//          "enName": "Frank Lamm",
//          "description": null,
//          "profession": "операторы",
//          "enProfession": "operator"
//        },
//        {
//          "id": 4227320,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4227320.jpg",
//          "name": "Александр Дайнан",
//          "enName": "Alexander Dynan",
//          "description": null,
//          "profession": "операторы",
//          "enProfession": "operator"
//        },
//        {
//          "id": 1972094,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1972094.jpg",
//          "name": "Адам Скэрт",
//          "enName": "Adam Scarth",
//          "description": null,
//          "profession": "операторы",
//          "enProfession": "operator"
//        },
//        {
//          "id": 3011502,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3011502.jpg",
//          "name": null,
//          "enName": "Thérèsa Ryan",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 1331489,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1331489.jpg",
//          "name": "Скотт Бассетт",
//          "enName": "Scott Bassett",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 1277794,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1277794.jpg",
//          "name": "Лиза Маршалл",
//          "enName": "Liza Marshall",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 10379,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10379.jpg",
//          "name": "Джонатан Финн",
//          "enName": "Jon Finn",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 3401147,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3401147.jpg",
//          "name": "Д.С. Мур",
//          "enName": "D.C. Moore",
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 10131192,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10131192.jpg",
//          "name": null,
//          "enName": "Benjamin Woolley",
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        }
//      ]
//    },
//    {
//      "name": "Лотерея",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "комедия"
//        }
//      ],
//      "premiere": {},
//      "persons": []
//    },
//    {
//      "name": "Пощады не будет",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "триллер"
//        },
//        {
//          "name": "боевик"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 493926,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_493926.jpg",
//          "name": "Со Джи-соп",
//          "enName": "So Ji-seop",
//          "description": "Nam Gi-joon",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 482302,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_482302.jpg",
//          "name": "Хо Джун-хо",
//          "enName": "Heo Joon-ho",
//          "description": "Lee Joo-woon",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 482255,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_482255.jpg",
//          "name": "Ан Гиль-ган",
//          "enName": "An Gil-gang",
//          "description": "Koo Bong-san",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 484558,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_484558.jpg",
//          "name": "Ли Бом-су",
//          "enName": "Lee Beom-soo",
//          "description": "Shim Seong-won",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 3877207,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3877207.jpg",
//          "name": "Кон Мён",
//          "enName": "Kong Myeong",
//          "description": "Joon-mo",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 6500376,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6500376.jpg",
//          "name": "Чху Ён-у",
//          "enName": "Choo Yeong-woo",
//          "description": "Lee Geum-son",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2097556,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2097556.jpg",
//          "name": "Чо Хан-чхоль",
//          "enName": "Jo Han-cheol",
//          "description": "Choi Seong-cheol",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 484608,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_484608.jpg",
//          "name": "Чха Сын-вон",
//          "enName": "Cha Seung-won",
//          "description": "Mr. Kim",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2352872,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2352872.jpg",
//          "name": "Ли Джун-хёк",
//          "enName": "Lee Joon-hyeok",
//          "description": "Nam Gi-seok",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 5278698,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5278698.jpg",
//          "name": "Ан Сэ-хо",
//          "enName": "An Se-ho",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 10123162,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10123162.jpg",
//          "name": "О Се-хён",
//          "enName": "Oh Se-hyeong",
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        }
//      ]
//    },
//    {
//      "name": "Монохром",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "триллер"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 5377638,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5377638.jpg",
//          "name": "Елизавета Шакира",
//          "enName": null,
//          "description": "Клаудия Новак",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 6135097,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6135097.jpg",
//          "name": "Егор Заховаев",
//          "enName": null,
//          "description": "Павел Смирнов",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2843440,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2843440.jpg",
//          "name": "Стася Толстая",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 251184,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_251184.jpg",
//          "name": "Алексей Серебряков",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 102357,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_102357.jpg",
//          "name": "Андрей Ургант",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 1951977,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1951977.jpg",
//          "name": "Владимир Мишуков",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 5000305,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5000305.jpg",
//          "name": "Александра Киселева",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 4135329,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4135329.jpg",
//          "name": "Сергей Волков",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 6337681,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6337681.jpg",
//          "name": "Анатолий Анциферов",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 1705568,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1705568.jpg",
//          "name": "Сергей Агафонов",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 6516036,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6516036.jpg",
//          "name": "Виктор Ужаков",
//          "enName": null,
//          "description": null,
//          "profession": "композиторы",
//          "enProfession": "composer"
//        },
//        {
//          "id": 5355288,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5355288.jpg",
//          "name": "Злата Калмина",
//          "enName": null,
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 4512755,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4512755.jpg",
//          "name": "Ольга Городецкая",
//          "enName": null,
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 2711501,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2711501.jpg",
//          "name": "Александр Иванов",
//          "enName": null,
//          "description": null,
//          "profession": "монтажеры",
//          "enProfession": "editor"
//        },
//        {
//          "id": 3697807,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3697807.jpg",
//          "name": "Антон Громов",
//          "enName": null,
//          "description": null,
//          "profession": "операторы",
//          "enProfession": "operator"
//        },
//        {
//          "id": 6879900,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6879900.jpg",
//          "name": "Федор Щербаков",
//          "enName": null,
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 5662848,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5662848.jpg",
//          "name": "Сергей Касатов",
//          "enName": null,
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 4512755,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4512755.jpg",
//          "name": "Ольга Городецкая",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        }
//      ]
//    },
//    {
//      "name": "Амура",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "боевик"
//        },
//        {
//          "name": "драма"
//        },
//        {
//          "name": "приключения"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 5138353,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5138353.jpg",
//          "name": "Алёна Михайлова",
//          "enName": null,
//          "description": "Аня Вдовина / Надя Вдовина",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 230534,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_230534.jpg",
//          "name": "Юрий Колокольников",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 1258688,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1258688.jpg",
//          "name": "Екатерина Вилкова",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 3922532,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3922532.jpg",
//          "name": "Аскар Ильясов",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 231402,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_231402.jpg",
//          "name": "Амаду Мамадаков",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 1705610,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1705610.jpg",
//          "name": "Валентин Цзин",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 1772887,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1772887.jpg",
//          "name": "Мурат Бисенбин",
//          "enName": "Murat Bissenbin",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2383893,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2383893.jpg",
//          "name": "Жаргал Бадмацыренов",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 10121611,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10121611.jpg",
//          "name": "Юта Кога",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 3628689,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3628689.jpg",
//          "name": "Идзуми Сано",
//          "enName": "Izumi Sano",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2811124,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2811124.jpg",
//          "name": "Максим Малеев",
//          "enName": null,
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 6515317,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6515317.jpg",
//          "name": "Андрей Абраменков",
//          "enName": null,
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 4173704,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4173704.jpg",
//          "name": "Наталия Седицкая",
//          "enName": null,
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 1610382,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1610382.jpg",
//          "name": "Андрей Джунковский",
//          "enName": null,
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 1755643,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1755643.jpg",
//          "name": "Илья Овсенев",
//          "enName": null,
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 1755643,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1755643.jpg",
//          "name": "Илья Овсенев",
//          "enName": null,
//          "description": null,
//          "profession": "операторы",
//          "enProfession": "operator"
//        },
//        {
//          "id": 2138354,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2138354.jpg",
//          "name": "Игорь Мишин",
//          "enName": null,
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 1634861,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1634861.jpg",
//          "name": "Максим Филатов",
//          "enName": null,
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 2322851,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2322851.jpg",
//          "name": "Альберт Рябышев",
//          "enName": null,
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 2802221,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2802221.jpg",
//          "name": "Иван Голомовзюк",
//          "enName": null,
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 6635619,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6635619.jpg",
//          "name": "Кирилл Дышловой",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 6635620,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6635620.jpg",
//          "name": "Софья Шигина",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 4468931,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4468931.jpg",
//          "name": "Ольга Рябышева",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 3234709,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3234709.jpg",
//          "name": "Роман Владыкин",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        }
//      ]
//    },
//    {
//      "name": "Чистильщик",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "боевик"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 4691846,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4691846.jpg",
//          "name": "Таз Скайлар",
//          "enName": "Taz Skylar",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 3016071,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3016071.jpg",
//          "name": "Дейзи Ридли",
//          "enName": "Daisy Ridley",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2933,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2933.jpg",
//          "name": "Клайв Оуэн",
//          "enName": "Clive Owen",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 6879889,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6879889.jpg",
//          "name": null,
//          "enName": "Robert Smith",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 10302,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10302.jpg",
//          "name": "Мартин Кэмпбелл",
//          "enName": "Martin Campbell",
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 1398344,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1398344.jpg",
//          "name": "Том Фаннинг",
//          "enName": "Thomas Fanning",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 6629263,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6629263.jpg",
//          "name": "Гэвин Глендиннинг",
//          "enName": "Gavin Glendinning",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 7198015,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_7198015.jpg",
//          "name": null,
//          "enName": "Callum Grant",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 25585,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_25585.jpg",
//          "name": "Майкл Кун",
//          "enName": "Michael Kuhn",
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 1699717,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1699717.jpg",
//          "name": "Саймон Аттли",
//          "enName": "Simon Uttley",
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        }
//      ]
//    },
//    {
//      "name": "Подслушано в Рыбинске",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "детектив"
//        },
//        {
//          "name": "комедия"
//        },
//        {
//          "name": "триллер"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 3296690,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3296690.jpg",
//          "name": "Илья Аксенов",
//          "enName": null,
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        }
//      ]
//    },
//    {
//      "name": "Haideu",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "триллер"
//        },
//        {
//          "name": "детектив"
//        },
//        {
//          "name": "драма"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 772473,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_772473.jpg",
//          "name": "Ли Бо-ён",
//          "enName": "Lee Bo-yeong",
//          "description": "Na Moon-yeong",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 1631042,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1631042.jpg",
//          "name": "Ли Му-сэн",
//          "enName": "Lee Moo-saeng",
//          "description": "Cha Seong-jae",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 572012,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_572012.jpg",
//          "name": "Ли Чхон-а",
//          "enName": "Lee Cheong-ah",
//          "description": "Ha Yeon-joo",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 6976258,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6976258.jpg",
//          "name": "Ли Мин-джэ",
//          "enName": "Lee Min-jae",
//          "description": "Do Jin-woo",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 922619,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_922619.jpg",
//          "name": "Ким Сан-хо",
//          "enName": "Kim Sang-ho",
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 4531427,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4531427.jpg",
//          "name": "Ким Дон-хви",
//          "enName": "Kim Dong-hwi",
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 10119333,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10119333.jpg",
//          "name": "Ли Хи-су",
//          "enName": "Lee Hee-soo",
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 927148,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_927148.jpg",
//          "name": "Пип Бротон",
//          "enName": "Pip Broughton",
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 703219,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_703219.jpg",
//          "name": "Мэттью Холл",
//          "enName": "Matthew Hall",
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        }
//      ]
//    },
//    {
//      "name": "Маня и Груня",
//      "ageRating": null,
//      "poster": {
//        "url": null,
//        "previewUrl": null
//      },
//      "genres": [
//        {
//          "name": "детектив"
//        },
//        {
//          "name": "мелодрама"
//        }
//      ],
//      "premiere": {},
//      "persons": [
//        {
//          "id": 1209730,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1209730.jpg",
//          "name": "Екатерина Копанова",
//          "enName": null,
//          "description": "Марина Пичугина",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 10118669,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10118669.jpg",
//          "name": "Вера фон Марс Итали",
//          "enName": null,
//          "description": "Груня",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 10119666,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_10119666.jpg",
//          "name": "Эрос Тим Торретта",
//          "enName": null,
//          "description": "Груня",
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 552292,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_552292.jpg",
//          "name": "Илья Носков",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2782698,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2782698.jpg",
//          "name": "Антон Денисенко",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 2379585,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2379585.jpg",
//          "name": "Максим Белбородов",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 251224,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_251224.jpg",
//          "name": "Елена Панова",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 1689811,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_1689811.jpg",
//          "name": "Дмитрий Блохин",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 256836,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_256836.jpg",
//          "name": "Владимир Зайцев",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 3682337,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_3682337.jpg",
//          "name": "Ася Домская",
//          "enName": null,
//          "description": null,
//          "profession": "актеры",
//          "enProfession": "actor"
//        },
//        {
//          "id": 4564140,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_4564140.jpg",
//          "name": "Агнесса Ткачёва",
//          "enName": null,
//          "description": null,
//          "profession": "художники",
//          "enProfession": "designer"
//        },
//        {
//          "id": 2677667,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2677667.jpg",
//          "name": "Кирилл Седухин",
//          "enName": null,
//          "description": null,
//          "profession": "режиссеры",
//          "enProfession": "director"
//        },
//        {
//          "id": 6198759,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_6198759.jpg",
//          "name": "Станислав Амбарцумов",
//          "enName": null,
//          "description": null,
//          "profession": "операторы",
//          "enProfession": "operator"
//        },
//        {
//          "id": 231201,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_231201.jpg",
//          "name": "Федор Попов",
//          "enName": null,
//          "description": null,
//          "profession": "продюсеры",
//          "enProfession": "producer"
//        },
//        {
//          "id": 2507278,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2507278.jpg",
//          "name": "Дарья Булатникова",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 5258422,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_5258422.jpg",
//          "name": "Карен Газарян",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        },
//        {
//          "id": 2646644,
//          "photo": "https://st.kp.yandex.net/images/actor_iphone/iphone360_2646644.jpg",
//          "name": "Константин Ворончихин",
//          "enName": null,
//          "description": null,
//          "profession": "редакторы",
//          "enProfession": "writer"
//        }
//      ]
//    }
//  ],
//  "total": 3617,
//  "limit": 10,
//  "page": 1,
//  "pages": 362
//}
