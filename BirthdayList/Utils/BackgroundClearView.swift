//
//  BackgroundClearView.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import SwiftUI
import UIKit

struct BackgroundClearView: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .black.withAlphaComponent(0.4)
        }
        return view
    }
}
