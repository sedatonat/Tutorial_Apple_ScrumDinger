//
//  ScrumStore.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 17.10.2022.
//


// Bu bolumun nasil calistigini ogren #learn

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum]=[]
    
    // Dosyaya ulasmayi saglayacak fonksiyon
    private static func fileURL() throws -> URL { // verilen adresi URL 'e ceviriyor #learn
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    
    static func load() async throws -> [DailyScrum] { // Bir parametreden sonra ayns yazmak bu parametrenin async oldugunu belirtir
        try await withCheckedThrowingContinuation { continuation in
            // Tutorial Note: "Calling withCheckedThrowingContinuation suspends the load function, then passes a continuation into a closure that you provide. A continuation is a value that represents the code after an awaited function." Anlamadim #learn
            load {result in
                switch result {
                case .failure(let error): // hata olursa error yolla
                    continuation.resume(throwing: error)
                case .success(let scrums): // Hata olmazsa scrums calistir
                    continuation.resume(returning: scrums)
                    // Tutorial Note: "Add a switch statement to handle the result cases." #learn
                }
            }
        }
    }
    
    
    
    // Dosyayi yukluyor
    static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do { // Herhangi bir hata ile karsilasildiginda yapilacak olan islem icin kullaniliyor
                let fileURL = try fileURL() // Local constanr
                
                
                // Kullanici prpgrama ilk kez ver girdiginde cagiracagi bir veri olmadigindan dolayi hata vermesin diye asagigaki kod
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async { // Uygulamanin komutlari belirli bir sira ile uygulamasini sagliyor FIFO gibi. BU olmadan ne olurdu bilemiyorum. #learn
                        completion(.success([]))
                    }
                    return
                }
                
                
                // Dosyadan aldigi bilgiyi DailyScrum 'a aktariyor
                let dailyScrum = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                
                // Tutorial aciklamasi: "You perform the longer-running tasks of opening the file and decoding its contents on a background queue. When those tasks complete, you switch back to the main queue." #learn
                DispatchQueue.main.async{
                    completion(.success(dailyScrum))
                }
                
                
            } catch {
                
                // Tutorial aciklamasi: "In the catch clause, pass the error to the completion handler." #learn
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
                
            }
        }
    }
    
    
    // Dosyayi kayit ediyor
    static func save(
        scrums: [DailyScrum],
        completion: @escaping (Result<Int, Error>)->Void
    ) {
        
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    
    
}
