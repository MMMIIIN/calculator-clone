import Foundation
import SwiftUI

enum Calculator: CaseIterable {
    case AC
    case plusMinus
    case percent
    case division
    case seven
    case eight
    case nine
    case multiplication
    case four
    case five
    case six
    case minus
    case one
    case two
    case three
    case plus
    case zero
    case point
    case equal
}

extension Calculator {
    enum CalulatorType {
        case number
        case oper
        case etc
    }
        
    var text: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .zero:
            return "0"
        case .AC:
            return "AC"
        case .plusMinus:
            return "+/-"
        case .percent:
            return "%"
        case .division:
            return "÷"
        case .multiplication:
            return "×"
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .equal:
            return "="
        case .point:
            return "."
        }
    }

    var backgroundColor: Color {
        switch self {
        case .one:
            return Color.numberBackColor
        case .two:
            return Color.numberBackColor
        case .three:
            return Color.numberBackColor
        case .four:
            return Color.numberBackColor
        case .five:
            return Color.numberBackColor
        case .six:
            return Color.numberBackColor
        case .seven:
            return Color.numberBackColor
        case .eight:
            return Color.numberBackColor
        case .nine:
            return Color.numberBackColor
        case .zero:
            return Color.numberBackColor
        case .AC:
            return Color.grayColor
        case .plusMinus:
            return Color.grayColor
        case .percent:
            return Color.grayColor
        case .division:
            return Color.primaryColor
        case .multiplication:
            return Color.primaryColor
        case .plus:
            return Color.primaryColor
        case .minus:
            return Color.primaryColor
        case .equal:
            return Color.primaryColor
        case .point:
            return Color.numberBackColor
        }
    }

    var textColor: Color {
        switch self {
        case .one:
            return Color.whiteColor
        case .two:
            return Color.whiteColor
        case .three:
            return Color.whiteColor
        case .four:
            return Color.whiteColor
        case .five:
            return Color.whiteColor
        case .six:
            return Color.whiteColor
        case .seven:
            return Color.whiteColor
        case .eight:
            return Color.whiteColor
        case .nine:
            return Color.whiteColor
        case .zero:
            return Color.whiteColor
        case .AC:
            return Color.blackColor
        case .plusMinus:
            return Color.blackColor
        case .percent:
            return Color.blackColor
        case .division:
            return Color.whiteColor
        case .multiplication:
            return Color.whiteColor
        case .plus:
            return Color.whiteColor
        case .minus:
            return Color.whiteColor
        case .equal:
            return Color.whiteColor
        case .point:
            return Color.whiteColor
        }
    }
    
    var type: CalulatorType {
        switch self {
        case .one:
            return .number
        case .two:
            return .number
        case .three:
            return .number
        case .four:
            return .number
        case .five:
            return .number
        case .six:
            return .number
        case .seven:
            return .number
        case .eight:
            return .number
        case .nine:
            return .number
        case .zero:
            return .number
        case .AC:
            return .etc
        case .plusMinus:
            return .oper
        case .percent:
            return .oper
        case .division:
            return .oper
        case .multiplication:
            return .oper
        case .plus:
            return .oper
        case .minus:
            return .oper
        case .equal:
            return .etc
        case .point:
            return .etc
        }
    }
}
