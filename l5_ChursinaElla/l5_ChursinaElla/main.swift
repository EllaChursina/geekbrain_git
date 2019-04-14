import Foundation

enum EngineState {
    case run, stop
}

enum WindowsState {
    case open, close
}

enum LoadCargo {
    case load, unload
}

enum Turbo: String  {
    case on, off
}

protocol Car {
    var model: String {get set}
    var yearOfIssue: Int {get set}
    var trunkVolume: Double {get set}
    var trunkVolumeFilled: Double {get set}
    var engineState: EngineState {get set}
    var windowsState: WindowsState {get set}
    mutating func trunkFilled (volumeFilled: LoadCargo, cargoVolume: Double) -> Double
    mutating func windowsStateOpen()
    mutating func windowsStateClose()
    mutating func engineStateRun()
    mutating func engineStateStop()
    
}



extension Car{
    mutating func trunkFilled (volumeFilled: LoadCargo, cargoVolume: Double) -> Double {
        if volumeFilled == .load {
            if trunkVolume >= cargoVolume + trunkVolumeFilled {
                trunkVolumeFilled += cargoVolume
            } else {
                print ("попытка загрузить больше максимального объема")
            }
        } else {
            if trunkVolumeFilled >= cargoVolume {
               trunkVolumeFilled -= cargoVolume
            } else {
                print ("попытка выгрузить больше допустимого")
            }
        }
        return trunkVolumeFilled
    }
    }

extension Car{
    mutating func windowsStateOpen() {
        windowsState = .open
        print ("Открытие окон автомобиля")
    }
}

extension Car{
    mutating func windowsStateClose() {
        windowsState = .close
        print ("Закрытие окон автомобиля")
    }
}
    
extension Car{
    mutating func engineStateRun() {
        engineState = .run
        print ("Включение двигателя")
    }
}

extension Car{
    mutating func engineStateStop() {
        engineState = .stop
        print ("Выключение двигателя")
    }
}

extension TruckCar : CustomStringConvertible {
    var description: String {
        return "Грузовая автоцистерна модели \(model) : год выпуска \(yearOfIssue), объем цистерны \(trunkVolume) л, цистерна заполнена на \(trunkVolumeFilled) л, состояние двигателя \(engineState), состояние окон \(windowsState), цвет цистерны \(colorTank), длина съемного шланга цистерны \(tankHoseLength))"
    }
}

extension SportCar : CustomStringConvertible {
    var description: String {
        return "Спортивная машина модели \(model) : год выпуска \(yearOfIssue), объем багажника \(trunkVolume) м3, багажник заполнен на \(trunkVolumeFilled) м3, состояние двигателя \(engineState), состояние окон \(windowsState), количество дверей  \(numberOfDoors), состояние режима Турбо \(turbo))"
    }
}

class TruckCar: Car {
 
    var model: String
    var yearOfIssue: Int
    var trunkVolume: Double
    var trunkVolumeFilled: Double
    var engineState: EngineState
    var windowsState: WindowsState
    let colorTank: String
    var tankHoseLength: Double // длина съемного шланга цистерны

    init(model: String, yearOfIssue: Int, trunkVolume: Double, trunkVolumeFilled: Double, engineState: EngineState, windowsState: WindowsState,  colorTank: String, tankHoseLength: Double) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.trunkVolumeFilled = trunkVolumeFilled
        self.engineState = engineState
        self.windowsState = windowsState
        self.colorTank = colorTank
        self.tankHoseLength = tankHoseLength
    }
}

class SportCar: Car {
    
    var model: String
    var yearOfIssue: Int
    var trunkVolume: Double
    var trunkVolumeFilled: Double
    var engineState: EngineState
    var windowsState: WindowsState
    let numberOfDoors: Int
    var turbo: Turbo
    
    init(model: String, yearOfIssue: Int, trunkVolume: Double, trunkVolumeFilled: Double, engineState: EngineState, windowsState: WindowsState, numberOfDoors: Int, turbo: Turbo) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.trunkVolumeFilled = trunkVolumeFilled
        self.engineState = engineState
        self.windowsState = windowsState
        self.numberOfDoors = numberOfDoors
        self.turbo = turbo
    }
}

var truckCar1 = TruckCar (model: "УРАЛСПЕЦМАШ", yearOfIssue: 2002, trunkVolume: 35000, trunkVolumeFilled: 5000, engineState: .run, windowsState: .close, colorTank: "желтый", tankHoseLength: 50)
var truckCar2 = TruckCar (model: "ЗИЛ", yearOfIssue: 2008, trunkVolume: 50000, trunkVolumeFilled: 0, engineState: .stop, windowsState: .close, colorTank: "красный", tankHoseLength: 100)
var sportCar1 = SportCar (model: "Ferrari", yearOfIssue: 2012, trunkVolume: 2, trunkVolumeFilled: 1, engineState: .run, windowsState: .open, numberOfDoors: 2, turbo: .off)
var sportCar2 = SportCar (model: "Lamborghini", yearOfIssue: 2018, trunkVolume: 3, trunkVolumeFilled: 0, engineState: .stop, windowsState: .close, numberOfDoors: 3, turbo: .on)

truckCar1.trunkFilled(volumeFilled: .unload, cargoVolume: 1000)
truckCar1.windowsStateOpen()
truckCar1.engineStateRun()

truckCar2.trunkFilled(volumeFilled: .load, cargoVolume: 1000)
truckCar2.windowsStateOpen()
truckCar2.engineStateStop()

sportCar1.trunkFilled(volumeFilled: .unload, cargoVolume: 1)
sportCar1.windowsStateClose()


sportCar2.trunkFilled(volumeFilled: .load, cargoVolume: 0)
sportCar2.windowsStateClose()

print(truckCar1)
print(truckCar2)
print(sportCar1)
print(sportCar2)



