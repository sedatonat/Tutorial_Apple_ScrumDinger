//
//  ScrumsView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 6.10.2022.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase // Inactive oldugunda kayit eder #learn
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()
    let saceAction: ()->Void
    
    
    
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
            Button (action:{
                isPresentingNewScrumView = true
            }) {
                Image(systemName:"plus")
            }
            
            /* Bu da benim yaptigim Action Button :)))
             .toolbar {
             Button (Image(systemName:"plus")) {
             isPresentingNewScrumView = true
             data = newScrumData
             }
             */
            
            .accessibilityLabel("New Scrum") // Bunu nasıl test edebiliriz? #learn
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data() // Bir nevi refresh
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data() // Bir nevi refresh
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saceAction() }
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
