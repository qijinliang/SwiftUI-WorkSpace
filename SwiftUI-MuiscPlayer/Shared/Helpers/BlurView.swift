//
//  BlurView.swift
//  SwiftUI-MuiscPlayer
//
//  Created by Cheney on 2021/5/20.
//

import Foundation
import SwiftUI

public struct BlurView: UIViewRepresentable {
    
    public init(style: UIBlurEffect.Style = .regular) {
        self.style = style
    }
    
    let style: UIBlurEffect.Style
    
    public func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView{
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
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        
    }
}

//public struct Expand: ViewModifier {
//    
//    var edge: Edge.Set
//    
//    public init(edge: Edge.Set = .all) {
//        self.edge = edge
//    }
//    
//    public func body(content: Content) -> some View {
//        VStack(spacing: 0) {
//            
//            if edge.contains(.vertical) {
//                Spacer(minLength: 0)
//            }
//            
//            HStack(spacing: 0) {
//                if edge.contains(.vertical) {
//                    Spacer(minLength: 0)
//                }
//                
//                content
//                
//                if edge.contains(.vertical) {
//                    Spacer(minLength: 0)
//                }
//            }
//            
//            if edge.contains(.vertical) {
//                Spacer(minLength: 0)
//            }
//        }
//        .background(Color.white.opacity(0.001))
//    }
//}

public class Haptics {
    
    static private var shared = Haptics()
    private let softHammer = UIImpactFeedbackGenerator(style: .soft)
    private let hardHammer = UIImpactFeedbackGenerator(style: .light)
    
    public init() {
        softHammer.prepare()
        hardHammer.prepare()
    }
    
    public static func softRoll() {
        shared.softHammer.impactOccurred(intensity: 0.8)
    }
    
    public static func hit() {
        shared.hardHammer.impactOccurred(intensity: 0.9)
    }
}
