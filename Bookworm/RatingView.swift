//
//  RatingView.swift
//  Bookworm
//
//  Created by Edwin Przeźwiecki Jr. on 27/01/2023.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating = 5
    
    var offimage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
                /// Project 15:
                    /* .accessibilityLabel("\(number == 1 ? "1 star": "\(number) stars")")
                    .accessibilityRemoveTraits(.isImage)
                    .accessibilityAddTraits(number > rating ? .isButton : [.isButton, .isSelected]) */
            }
        }
        /// Project 15:
        .accessibilityElement()
        .accessibilityLabel("Rating")
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maximumRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offimage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
