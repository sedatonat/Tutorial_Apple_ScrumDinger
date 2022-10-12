//
//  DetailEditView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 11.10.2022.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data()
    @State private var newAttendeeName=""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField ("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step:1) {
                    }
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
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
                    }
                    .disabled(newAttendeeName.isEmpty) // Attendee girilmemis ise pasif yap
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
