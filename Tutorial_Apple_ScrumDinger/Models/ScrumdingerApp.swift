//
//  Tutorial_Apple_ScrumDingerApp.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 3.10.2022.
//

import SwiftUI

@main
struct Tutorial_Apple_ScrumDingerApp: App {
    var body: some Scene {
        WindowGroup {
            //MeetingView()
            ScrumsView(scrums: DailyScrum.sampleData)
            //ScrumsView() Bu şekilde çalışmıyor. Yukarıdaki gibi çalılamsı gerekiyor ama yukarıdaki yazımı anlayamadım. #learn
        }
        // Uygulama ilk açıldığında ekrana ilk gelmesi istenen View 'un seçildiği alan
    }
}

