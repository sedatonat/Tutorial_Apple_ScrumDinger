//
//  DetailEditView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 11.10.2022.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data:  DailyScrum.Data // State 'ten Binding e dondu neden? #learn
    @State private var newAttendeeName=""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField ("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step:1) {
                        Text("Length") // Bunun burada olmasinin ne anlami oldugunu anlamadim.
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true) // Bu kodu anlamadim #learn
                }
                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                } // Swipe-left yapinca ilgili row siliniyor.
                HStack{
                    TextField("New Attendee", text: $newAttendeeName) // "@State Private var" ile yukarida tanimlanmisti
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName) // Bu kismi DailyScrum extension kimina eklemistik
                            data.attendees.append(attendee)
                            newAttendeeName="" // Default olarak ne yazilacagini belirliyor
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendees")
                    }
                    .disabled(newAttendeeName.isEmpty) // Attendee girilmemis ise pasif yap
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
        // son kisma ".data" eklemeden evvel verdigi hata: "Cannot convert value of type 'DailyScrum' to expected argument type 'DailyScrum.Data'"
    }
}
