//
//  Tutorial_Apple_ScrumDingerApp.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 3.10.2022.
//

import SwiftUI

@main
struct Tutorial_Apple_ScrumDingerApp: App {
    
    // Tutorial Note: "The @StateObject property wrapper creates a single instance of an observable object for each instance of the structure that declares it." #learn
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        
        // Uygulama ilk açıldığında ekrana ilk gelmesi istenen View 'un seçildiği alan
        WindowGroup {
            NavigationView {
                //MeetingView()
                ScrumsView(scrums: $store.scrums) // "DailyScrum.sampleData" $scrums oldu neden? #learn
                //ScrumsView() Bu şekilde çalışmıyor. Yukarıdaki gibi çalısamsı gerekiyor ama yukarıdaki yazımı anlayamadım. #learn
            }
            .onAppear {
                ScrumStore.load { result in
                    
                    // Guncel doayalari yukle veya hata mesaji ver
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                    
                    
                }
            }
        }
    }
}
