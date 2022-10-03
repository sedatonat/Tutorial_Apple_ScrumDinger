//
//  ContentView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 3.10.2022.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        ProgressView(value:5, total:15)
    }
}

//test

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
