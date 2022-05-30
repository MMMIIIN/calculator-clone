import SwiftUI

struct ContentView: View {
    private static let initialColumns = 4
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    var item = GridItem(.flexible(minimum: 30, maximum: 30))
    @State private var result: Int = 0

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .trailing, spacing: 20) {
                resultText()
                LazyVGrid(columns: gridColumns, alignment: .leading) {
                    ForEach(Calculator.allCases, id: \.self) { value in
                        if value == .zero {
                            Button(action: { }, label: {
                                    Text(value.value)
                                        .font(.system(size: 35))
                                        .padding(.leading, 30)
                                        .frame(width: geo.size.width * 0.42, height: geo.size.width * 0.19, alignment: .leading)
                                        .foregroundColor(value.textColor)
                                        .background(RoundedRectangle(cornerRadius: 50)
                                            .fill(value.backgroundColor))
                                })
                            Circle()
                                .fill(Color.numberBackColor)
                        }
                        else {
                            Button(action: { }, label: {
                                    Text(value.value)
                                        .font(.system(size: 35))
                                        .frame(width: geo.size.width * 0.19, height: geo.size.width * 0.19, alignment: .center)
                                        .foregroundColor(value.textColor)
                                        .background(RoundedRectangle(cornerRadius: 50)
                                            .fill(value.backgroundColor))
                                })

                        }

                    }
                }
            }
                .padding()
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottomTrailing)
                .background(Color.blackColor)
        }
    }

    private func resultText() -> some View {
        Text("\(result)")
            .font(.system(size: 80))
            .foregroundColor(.whiteColor)
            .padding(.trailing, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
