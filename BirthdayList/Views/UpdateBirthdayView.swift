//
//  UpdateBirthdayView.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import SwiftUI

final class UpdateBirthdayData: ObservableObject {
    @Published var id = UUID()
    @Published var name: String = ""
    @Published var date = Date()
}

struct UpdateBirthdayView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var data = UpdateBirthdayData()
    
    private var viewModel = UpdateBirthdayViewModel()
    
    init(birthdayVM: BirthdayViewModel) {
        data.id = birthdayVM.id
        data.name = birthdayVM.name
        data.date = birthdayVM.date
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Update Birthday")
                    .font(.title)
                Spacer()
            }
            .padding(.bottom, 10)
            
            TextField("name", text: $data.name)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 10)
            
            HStack {
                Text("Date of birth")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    
                
                DatePicker("", selection: $data.date, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
            }
            .background(Color.red.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
                .background(Color.red.opacity(0.3))
                
                Button("Save") { update() }
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    private func update() {
        let birthday = BirthdayViewModel(id: data.id, name: data.name, date: data.date)
        viewModel.updateBirthday(birthday: birthday)
        dismiss()
    }
}

struct UpdateBirthdayView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateBirthdayView(birthdayVM: BirthdayViewModel(id: UUID(), name: "Random", date: Date()))
    }
}
