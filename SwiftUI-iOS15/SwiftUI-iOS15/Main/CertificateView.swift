//
//  CertificateView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/17.
//

import SwiftUI

struct CertificateView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("SwiftUI学习中心")
                    .font(.title3.weight(.semibold))
                Text("iOS程序员")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("2022年3月22".uppercased())
                    .font(.footnote.weight(.semibold))
                Text("作者: 醉看红尘这场梦")
                    .font(.footnote.weight(.medium))
            }
            .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(LogoView().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing))
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView()
    }
}

