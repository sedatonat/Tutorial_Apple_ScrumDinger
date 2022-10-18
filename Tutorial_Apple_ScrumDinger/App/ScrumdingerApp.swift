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
                                
                ScrumsView(scrums: $store.scrums) {
                    ScrumStore.save(scrums: store.scrums) { result in
                        
                        // Tutorial Note: "If the call results in failure, bind the error to a local constant and stop execution." #learn
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                            
                        }
                    }
                }

                
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
