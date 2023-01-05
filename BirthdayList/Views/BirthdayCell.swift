//
//  BirthdayCell.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import SwiftUI

struct BirthdayCell: View {
    
    var birthdayVM: BirthdayViewModel
    
    var body: some View {
        HStack {
            VStack {
                Text(birthdayVM.monthString)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 60, height: 20)
                    .background(Rectangle().fill(Color.red))
                
                Text(birthdayVM.dayString)
                    .bold()
                    .foregroundColor(.black)
                    .frame(height: 40)
            }
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
            
            Text(birthdayVM.name)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 20)
            
            Spacer()
            
            VStack(spacing: 2) {
                Text("Turning")
                    .font(.caption.bold())
                    .foregroundColor(.black)
                    .padding(5)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("\(birthdayVM.turningYear)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                
                Text("In \(birthdayVM.remainingDays) days")
                    .font(.caption)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .clipped()
    }
}

struct BirthdayCell_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayCell(birthdayVM: BirthdayViewModel(id: UUID(), name: "Random", date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!))
            .preferredColorScheme(.dark)
    }
}
