//
//  BlurView.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-12.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
    }
}
