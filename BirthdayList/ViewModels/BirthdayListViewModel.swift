//
//  BirthdayListViewModel.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import Combine
import Foundation
import SwiftUI

final class BirthdayListViewModel: ObservableObject {
    @Published var birthdays = [BirthdayViewModel]()
    
    func fetchAllBirthdays() {
        birthdays = DataManager.shared.getBirthdays().map(BirthdayViewModel.init)
    }
    
    func removeBirthday(at index: Int) {
        let bday = birthdays[index]
        DataManager.shared.removeBirthday(id: bday.id)
    }
}
