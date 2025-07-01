//
//  NavigationBar.swift
//  MarketKurly
//
//  Created by 안치욱 on 6/25/25.
//

import SwiftUI

struct NavigationBar: View {
        enum Segment: String, CaseIterable {
            case market = "마켓컬리"
            case beauty = "뷰티컬리"
        }
        @State private var selected: Segment = .market

        var body: some View {
            ZStack(alignment: .top) {
                Color(hex: "#5F0080")
                    .ignoresSafeArea()

                HStack {
                    Image("home_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 57, height: 32)

                    Spacer()
                    Spacer()

                    HStack(spacing: 0) {
                        ForEach(Segment.allCases, id: \.self) { seg in
                            let isOn = (seg == selected)
                            Text(seg.rawValue)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(isOn ? Color(hex: "#5F0080") : .white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 16)
                                .background(isOn ? Color.white : .clear)
                                .clipShape(Capsule())
                                .onTapGesture { selected = seg }
                        }
                    }
                    .padding(4)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Capsule())

                    Spacer()

                    HStack(spacing: 5) {
                        Button {
                        } label: {
                            Image("home_notification")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                        
                        Button {
                        } label: {
                            Image("home_cart")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                    }
                    .foregroundColor(.white)
                }
                .padding(.top, 32)
                .padding(.bottom, 6)
                .padding(.horizontal, 16)
            }
            .frame(height: 68)
        }
    }
