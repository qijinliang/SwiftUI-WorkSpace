//
//  PathShowVIew.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/5/27.
//

import SwiftUI

struct PathShowVIew: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Path1()) {
                    Text("Path")
                }
                
                NavigationLink(destination: Path2()) {
                    Text("Path2")
                }
            }
        }
    }
}

struct PathShowVIew_Previews: PreviewProvider {
    static var previews: some View {
        PathShowVIew()
    }
}
