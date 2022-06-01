import SwiftUI

struct ContentView: View {
    private static let initialColumns = 4
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private var isOper: Bool = false
    @State private var isPlus: Bool = false
    @State private var result: String = "0"
    @State private var operList: [Calculator] = []
    @State private var tempResult: String = ""

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
            tempResult += value.text
        } else if value.type == .number {
            result += value.text
            tempResult += value.text
        } else if value.type == .oper {
            operating(value: value)
            tempResult += value.text
        } else if value.type == .etc {
            etc(value: value)
        }
    }

    func operating(value: Calculator) {
        if value == .plus {
            isPlus = true
            isOper = true
            print("isPlus")
            operList.append(.plus)
        } else if value == .minus {
            isOper = true
        } else if value == .multiplication {
            isOper = true
        } else if value == .division {
            isOper = true
        }
    }

    func etc(value: Calculator) {
        if value == .AC {
            result = "0"
            tempResult = ""
        } else if value == .equal {
            let getResult = getEqual()
            result = String(getResult)
            tempResult = ""
            tempResult += result
        }
    }

    func getEqual() -> Int {
        var result = 0
        let separators = CharacterSet(charactersIn: " ")
        let tempList = tempResult.components(separatedBy: separators)
        for index in 0..<tempList.count {
            if tempList[index] == "+" {
                let castingInt = Int(tempList[index + 1])
                result += castingInt!
                break;
            } else if tempList[index] == "-" {
                let castingInt = Int(tempList[index + 1])
                result -= castingInt!
                break;
            } else if tempList[index] == "÷" {
                let castingInt = Int(tempList[index + 1])
                result /= castingInt!
                break;
            } else if tempList[index] == "×" {
                let castingInt = Int(tempList[index + 1])
                result *= castingInt!
                break;
            } else {
                let castingInt = Int(tempList[index])
                result += castingInt!
            }
        }
        return result
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
