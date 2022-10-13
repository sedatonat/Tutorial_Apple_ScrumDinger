/*
 
 Burada renklere karar verdik.
 Ama aşağıdaki RawValue kısmını anlayamadım.
 
 Burada Foundation Library kullanamıyoruz çünkü onda Color yok
 
 */


import SwiftUI

enum Theme: String, CaseIterable, Identifiable { // bu yeni eklenenler nedir anlamadim #learn
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    case Askeri //Bu rengi ben ekledim. Assets kısmına eklenince buradan referans ile rengi alabiliyorsun.
    
    var accentColor: Color {
        switch self{
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple, .Askeri: return .white
        }
    }
    // Bu "rawValue" nereden geliyor anlayamadım. #learn
    var mainColor: Color {
        Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    } // Bunun ne yaptığını anlayamadım #learn
    
    var id: String { // yukaridaki CaseItarable ve Identifiable 'i ekleyince bunu eklemem gerekiyor anladigim. halen kopugum #learn
        name
    }
}
