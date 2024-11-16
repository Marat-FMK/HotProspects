//
//  EditingProspectView.swift
//  HotProspects
//
//  Created by Marat Fakhrizhanov on 16.11.2024.
//

import SwiftData
import SwiftUI

struct EditingProspectView: View {
    
    @Bindable var prospect: Prospect
    
    @State private var name = ""
    @State private var email = ""
    
    init(prospect: Prospect) {
        self.prospect = prospect
        
        name = prospect.name
        email = prospect.emailAddress
    }
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(spacing: 40) {
                TextField(prospect.name, text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: name) { oldValue, newValue in
                        prospect.name = name
                        prospect.date = Date.now
                    }
                TextField(prospect.emailAddress, text: $email)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: email) { oldValue, newValue in
                        prospect.emailAddress = email
                        prospect.date = Date.now
                    }
                Spacer()
                Spacer()

            }
            .padding()
            .navigationTitle("Edit prospect")
        }
    }
}

//#Preview {
//    EditingProspectView()
//}
