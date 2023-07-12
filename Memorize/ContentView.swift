//
//  ContentView.swift
//  Memorize
//
//  Created by Eryn Li on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    let carEmojis = ["✈️", "🚗", "🚄", "🚀", "🚛", "🚁", "🚌", "🛴", "🛵", "🛸", "🚲", "🚎", "🚕", "🏎️", "🚜", "🏍️","🚙"]
    let sportEmojis = ["🏋️‍♀️","🏂","⛹️‍♀️","🏌️‍♀️","🏄‍♂️","🤼‍♂️","🚵‍♀️","🧗‍♀️","🚣‍♀️","🏊‍♀️"]
    let weatherEmojis = ["☀️","🌤️","☁️","🌧️","❄️","🌪️","⛄️","🌈","🌩️"]
    @State var emojis = ["✈️", "🚗", "🚄", "🚀", "🚛", "🚁", "🚌", "🛴", "🛵", "🛸", "🚲", "🚎", "🚕", "🏎️", "🚜", "🏍️","🚙"]
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(emojis, id: \.self){ emoji in
                        CardView(emoji: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.pink)
            Spacer()
            HStack{
                vehiclesButton
                sportsButton
                weathersButton
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehiclesButton: some View {
        Button {
            emojis = carEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.caption)
            }
        }.buttonStyle(.bordered)
    }
    
    var sportsButton: some View {
        Button {
            emojis = sportEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "figure.run")
                Text("Sports")
                    .font(.caption)
            }
        }.buttonStyle(.bordered)
    }
    
    var weathersButton: some View {
        Button{
            emojis = weatherEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "sun.max")
                Text("Weathers")
                    .font(.caption)
            }
        }.buttonStyle(.bordered)
    }
}


struct CardView : View{
    var emoji: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let card = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                card.fill().foregroundColor(.white)
                card.strokeBorder(lineWidth: 3)
                Text(emoji).font(.largeTitle)
            } else {
                card.fill()
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
