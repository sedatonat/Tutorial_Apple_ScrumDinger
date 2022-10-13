//
//  ScrumsView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 6.10.2022.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    

    
    var body: some View {
        List {
            ForEach($scrums) { $scrum in // "ForEach(scrums, id: \.title)" neden boyle oldu anlamadim? #learn
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums") //Neden bir üst seviyeye yazamadığımı anlamadım. #learn
        .toolbar {
            Button (action:{}){
                Image(systemName:"plus")
            }
            .accessibilityLabel("New Scrum") // Bunu nasıl test edebiliriz? #learn
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData)) // her bir view un altina .constant neden ekleniyor? #learn
        }
    }
}
