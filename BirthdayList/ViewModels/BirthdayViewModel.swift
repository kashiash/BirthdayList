//
//  BirthdayViewModel.swift
//  BirthdayList
//
//  Created by DevTechie on 12/30/22.
//

import Combine
import Foundation

final class BirthdayViewModel {
    var id: UUID
    var name: String
    var date: Date
    
    init(id: UUID, name: String, date: Date) {
        self.id = id
        self.name = name
        self.date = date
    }
    
    init(birthday: Birthday) {
        self.id = birthday.id ?? UUID()
        self.name = birthday.name ?? ""
        self.date = birthday.date ?? Date()
    }
    
    var monthFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .short
        f.dateFormat = "MMM"
        return f
    }()
    
    var dayFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .short
        f.dateFormat = "dd"
        return f
    }()
    
    var remainingDays: Int {
        var nextBdayComponents = Calendar.current.dateComponents([.day, .month], from: date)
        let todayComponent = Calendar.current.dateComponents([.year], from: Date())
        nextBdayComponents.year = todayComponent.year!
        var nextBday = Calendar.current.date(from: nextBdayComponents)
        if Date() > nextBday! {
            nextBday = Calendar.current.date(byAdding: .year, value: 1, to: nextBday!)
        }
        return Calendar.current.dateComponents([.day], from: Date(), to: nextBday!).day ?? 0
    }
    
    var turningYear: Int {
        (Calendar.current.dateComponents([.year], from: date, to: Date()).year ?? 0) + 1
    }
    
    var monthString: String {
        monthFormatter.string(from: date)
    }
    
    var dayString: String {
        dayFormatter.string(from: date)
    }
}
