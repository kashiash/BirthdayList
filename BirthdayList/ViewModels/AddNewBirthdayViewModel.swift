//
//  AddNewBirthdayViewModel.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import Foundation

final class AddNewBirthdayViewModel {
    func saveBirthday(birthday: BirthdayViewModel) {
        DataManager.shared.saveBirthday(id: birthday.id, name: birthday.name, date: birthday.date)
    }
}
