//
//  ContentView.swift
//  Memorize
//
//  Created by Eryn Li on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚗", "🚄", "🚀", "🚛", "🚁", "🚌", "🛴", "🛵", "🛸", "🚲", "🚎", "🚕", "🏎️", "🚜", "🏍️","🚙"]
    @State var emojiCount = 16
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    /* CARDS */
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.pink)
            Spacer()
            HStack {
                /* BUTTONS */
                remove
                Spacer()
                // Grabs as much space it can
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

// Modularization my friends!!
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    // changes var to a pointer that points to a bool
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}



// How the preview looks
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
