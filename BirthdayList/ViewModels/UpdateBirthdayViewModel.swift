//
//  UpdateBirthdayViewModel.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import Foundation

final class UpdateBirthdayViewModel {
    func updateBirthday(birthday: BirthdayViewModel) {
        DataManager.shared.updateBirthday(id: birthday.id, name: birthday.name, date: birthday.date)
    }
}
