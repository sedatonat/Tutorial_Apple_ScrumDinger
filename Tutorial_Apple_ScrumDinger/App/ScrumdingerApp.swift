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
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            fatalError("Error saving scrums.")
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
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    fatalError("Error loading scrums.")
                }
            }
        }
    }
}
