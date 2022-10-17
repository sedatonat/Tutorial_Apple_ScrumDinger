//
//  Tutorial_Apple_ScrumDingerApp.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 3.10.2022.
//

import SwiftUI

@main
struct Tutorial_Apple_ScrumDingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //MeetingView()
                ScrumsView(scrums: $scrums) // "DailyScrum.sampleData" $scrums oldu neden? #learn
                //ScrumsView() Bu şekilde çalışmıyor. Yukarıdaki gibi çalısamsı gerekiyor ama yukarıdaki yazımı anlayamadım. #learn
            }
            // Uygulama ilk açıldığında ekrana ilk gelmesi istenen View 'un seçildiği alan
        }
    }
}
