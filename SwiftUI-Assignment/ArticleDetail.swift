//
//  ArticleDetail.swift
//  SwiftUI-Assignment
//
//  Created by Sanket Bhandekar on 28/09/26.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(article.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Text(article.content)
                    .font(.body)
                    .padding()
            }
            .padding()
        }
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let article = getArticles()
    ArticleDetailView(article: article[1])
}
