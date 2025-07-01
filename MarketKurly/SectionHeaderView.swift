//
//  SectionHeaderView.swift
//  MarketKurly
//
//  Created by 안치욱 on 7/1/25.
//

import SwiftUI

struct SectionHeaderView: View {

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("👑 도기워커님을 위해 엄선했어요")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                Text("찜해 놓은 그 상품, 지금 빅세일로 저렴하게!")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button() {
            } label: {
                HStack(spacing: 2) {
                    Text("전체보기")
                        .font(.system(size: 14, weight: .semibold))
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(Color(hex: "#5F0080"))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}
