//
//  AddBookView.swift
//  Bookworm
//
//  Created by Edwin Przeźwiecki Jr. on 27/01/2023.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    /// Challenge 1:
    @State private var genre: String?
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        /// Challenge 1:
                        newBook.genre = genre ?? "Fantasy"
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                    /// Challenge 1:
                    .disabled(hasNoMissingAttributes() == false)
                    
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    /// Challenge 1:
    func hasNoMissingAttributes() -> Bool {
        
        if title.isTrulyEmpty || author.isTrulyEmpty {
            return false
        }
        
        return true
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
