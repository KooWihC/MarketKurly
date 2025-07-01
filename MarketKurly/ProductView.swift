//
//  Product.swift
//  MarketKurly
//
//  Created by 안치욱 on 7/1/25.
//


import SwiftUI


struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let originalPrice: Double
    let discountPercent: Int
    
    var discountedPrice: Double {
        (originalPrice * Double(100 - discountPercent) / 100).rounded()
    }
}

let sampleProducts: [Product] = [
    .init(imageName: "product1", title: "[3개 사면 33%] 비비고 통 새우만두 200g", originalPrice: 6_980, discountPercent: 33),
    .init(imageName: "product2", title: "[사리원] 소불고기 전골", originalPrice: 15_900, discountPercent: 35),
    .init(imageName: "product3", title: "아삭하고 달콤한 황금사과 1.3kg (5~7입)", originalPrice: 19_900, discountPercent: 25),
    .init(imageName: "product4", title: "[제각각] 당도선별 제주 점보 감귤 3kg", originalPrice: 15_900, discountPercent: 18),
    .init(imageName: "product5", title: "[골라담기][네스프레소] 캡슐 25종", originalPrice: 7_600, discountPercent: 10),
]


struct ProductView: View {
    let product: Product
    
    var body: some View {
        VStack(spacing: 4) {
            
            Image(product.imageName)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 145, height: 188)
                .clipped()
                .cornerRadius(8)
            
            Button(action: {
                
            }) {
                Label("담기", systemImage: "cart")
                    .font(.system(size: 14, weight: .regular))
                    .frame(maxWidth: .infinity, minHeight: 28)
                    .foregroundColor(Color(hex: "#333333"))
            }
            .buttonStyle(.plain)
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1))
            
            Text(product.title)
                .font(.system(size: 13))
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(height: 36, alignment: .top)
            HStack {
                Text("\(Int(product.originalPrice))원")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .strikethrough()
                Spacer()
            }
            
            HStack(spacing: 4) {
                Text("\(product.discountPercent)%")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color(hex: "#FA622F"))
                Text("\(Int(product.discountedPrice))원")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
            
                
            }
        }
        .frame(width: 140)
        .padding(.vertical, 8)
    }
}


struct ProductCarouselView: View {
    let products: [Product]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(products) { item in
                    ProductView(product: item)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
