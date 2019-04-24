
import Foundation

enum CalculationError: Error {
    case divisionByZero
    case negativeRoot
}

class Calculator {
    func addition (_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
    func subtraction (_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
    func multiplication (_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
    func division (_ firstNumber: Double, _ secondNumber: Double) throws -> Double {
        guard secondNumber != 0  else {
            throw CalculationError.divisionByZero
        }
        return firstNumber / secondNumber
    }
    func root (_ firstNumber: Double) throws -> Double {
        guard firstNumber >= 0  else {
            throw CalculationError.negativeRoot
        }
        return sqrt(firstNumber)
    }
}

let calculator1 = Calculator ()

do {
    let result1 = try calculator1.division(420, 0)
    let result2 = try calculator1.root(-5)
} catch CalculationError.divisionByZero {
    print ("Деление на 0 не определено")
} catch CalculationError.negativeRoot {
    print ("Взятие корня из отрицательного действительного числа не определено")
}
