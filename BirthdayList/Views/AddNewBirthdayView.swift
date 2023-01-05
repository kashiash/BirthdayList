//
//  AddNewBirthdayView.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import SwiftUI

final class NewBirthdayData: ObservableObject {
    @Published var name: String = ""
    @Published var date = Date()
}

struct AddNewBirthdayView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var newData = NewBirthdayData()
    
    private let model = AddNewBirthdayViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Birthday")
                    .font(.title)
                
                Spacer()
            }
            .padding(.bottom, 10)
            
            TextField("Enter name", text: $newData.name)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 10)
            
            HStack {
                Text("Date of birth")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                
                DatePicker("", selection: $newData.date, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
            }
            .background(Color.red.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
                .background(Color.red.opacity(0.3))
                
                Button("Save") {
                    addNew()
                }
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
        }
        .padding()
        .background(Color.black, in: RoundedRectangle(cornerRadius: 20))
        .padding()
    }
    
    private func addNew() {
        let birthday = BirthdayViewModel(id: UUID(), name: newData.name, date: newData.date)
        model.saveBirthday(birthday: birthday)
        dismiss()
    }
}

struct AddNewBirthdayView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewBirthdayView()
            .preferredColorScheme(.dark)
    }
}
