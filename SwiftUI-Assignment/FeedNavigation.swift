//
//  FeedNavigation.swift
//  SwiftUI-Assignment
//
//  Created by Sanket Bhandekar on 28/09/26.
//

import SwiftUI

// Custom View Modifier for Article (Requirement 4)
struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

struct FeedNavigationView: View {
    @State private var articles: [Article]
    @State private var isShowingCreatePost = false

    init(articles: [Article] = getArticles()) {
        _articles = State(initialValue: articles)
    }

    var body: some View {
        NavigationStack {
            List(articles) { article in
                NavigationLink(value: article) {
                    HStack(alignment: .top, spacing: 12) {
                        Image(article.imageName)
                            .resizable()
                            .scaledToFill()
                            .modifier(ImageModifier())

                        VStack(alignment: .leading, spacing: 4) {
                            Text(article.title)
                                .font(.headline)

                            Text(article.content)
                                .font(.subheadline)
                                .lineLimit(3)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    isShowingCreatePost = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title.bold())
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
            }
            .navigationDestination(for: Article.self) { article in
                ArticleDetailView(article: article)
            }
            .navigationTitle("SwiftUI Learning")
            .sheet(isPresented: $isShowingCreatePost) {
                CreatePostView(articles: $articles)
            }
        }
    }
}

// Preview Macro with "Learn SwiftUI" article (Requirement 5)
#Preview {
    FeedNavigationView(articles: [
        Article(
            id: "preview-1",
            title: "Learn SwiftUI",
            content: "SwiftUI is Apple's modern declarative framework for building user interfaces across iOS, iPadOS, macOS, watchOS, tvOS, and visionOS. It makes UI development quick and intuitive.",
            imageName: "flower"
        )
    ])
}
