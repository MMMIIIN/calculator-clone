import SwiftUI

struct ContentView: View {
    private static let initialColumns = 4
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    var item = GridItem(.flexible(minimum: 30, maximum: 30))
    @State private var isOper: Bool = false
    @State private var isPlus: Bool = false
    @State private var result: String = "0"
    @State private var resultArr: [String] = []

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .trailing, spacing: 20) {
                resultText()
                LazyVGrid(columns: gridColumns, alignment: .leading) {
                    ForEach(Calculator.allCases, id: \.self) { value in
                        if value == .zero {
                            Button(action: { addNumber(value: value) }, label: {
                                    Text(value.text)
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
                            Button(action: {
                                if isOper {
                                    result = ""
                                    addNumber(value: value)
                                    isOper = false
                                } else {
                                    addNumber(value: value)
                                }
                            }, label: {
                                    Text(value.text)
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
            .minimumScaleFactor(0.3)
            .lineLimit(1)
    }

    func addNumber(value: Calculator) {
        if result == "0" {
            result = ""
            result += value.text
            resultArr.append(value.text)
            print(resultArr)
        } else if value.type == .number {
            result += value.text
            resultArr.append(value.text)
            print(resultArr)
        } else if value.type == .oper {
            operating(value: value)
            resultArr.append(value.text)
            print(resultArr)
        } else if value.type == .etc {
            etc(value: value)
            print(resultArr)
        }
    }

    func operating(value: Calculator) {
        if value == .plus {
            isPlus = true
            isOper = true
            print("isPlus")

        } else if value == .minus {

        } else if value == .multiplication {

        } else if value == .division {

        }
    }

    func etc(value: Calculator) {
        if value == .AC {
            result = "0"
            resultArr.removeAll()
        } else if value == .equal {
            let getResult = getEqual()
            result = String(getResult)
            resultArr.removeAll()
            resultArr.append(result)
        }
    }

    func getEqual() -> Int {
        var result = 0
        let testArr = resultArr.split(separator: "+")
        var stringAsIntArr: [String] = []
        for index in testArr {
            var temp = ""
            for i in index {
                temp += i
            }
            stringAsIntArr.append(temp)
        }
        for index in stringAsIntArr {
            let castingInt = Int(index)
            result += castingInt!
        }
        return result
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
