//
//  CreatePost.swift
//  SwiftUI-Assignment
//
//  Created by Sanket Bhandekar on 28/09/26.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var articles: [Article]

    @State private var postTitle: String = ""
    @State private var postContent: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Enter a title for your post", text: $postTitle)
                    .textFieldStyle(.roundedBorder)

                TextField("Enter content", text: $postContent, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(10...18)

                Spacer()

                Button {
                    savePost()
                } label: {
                    Text("Create Post")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .padding()
            .navigationTitle("Create Post")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func savePost() {
        let newArticle = Article(
            id: UUID().uuidString,
            title: postTitle,
            content: postContent,
            imageName: "random"
        )
        articles.insert(newArticle, at: 0)
        dismiss()
    }
}

#Preview {
    CreatePostView(articles: .constant([]))
}
