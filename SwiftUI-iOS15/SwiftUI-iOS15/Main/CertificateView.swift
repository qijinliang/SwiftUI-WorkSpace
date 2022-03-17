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
                Text("SwiftUI 开发")
                    .font(.title3.weight(.semibold))
                Text("iOS程序员")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("2022年4月1号".uppercased())
                    .font(.footnote.weight(.semibold))
                Text("作者: 金亮")
                    .font(.footnote.weight(.medium))
            }
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10)
                .padding(9)
                .background(Color(UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        )
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView()
    }
}

