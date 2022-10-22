//
//  DetailView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 9.10.2022.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var data = DailyScrum.Data() // Bu kismi DetailEdit ten sildik buraya yazdik. neden? #learn
    @State private var isPresentingEditView = false // Burayi anlamadim #learn
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink (destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor) // Bu rengi değiştiremedim. #learn
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine) // Bu şekilde Label ve Text elementlerini birlikte okuyor.
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section (header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage:"person")
                }
            }
            Section (header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) {history in
                    NavigationLink(destination: HistoryView(history: history)) {
                        HStack{
                            Image(systemName: "calendar")
                            Text(history.date, style: .date) // buradaki "style: .date" local tarih ve saati veriyor
                            // Buraya Meeting Duration ekleyecegim #learn
                        }
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        
        // Edit menusunu ac
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = scrum.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(scrum.title)
                
                // Edit menusunu kapa
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                                
                            }
                        }
                        // Yapilan degisikligi onayla
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                scrum.update(from: data) // Editlenen veryi geri gonderiyor
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
