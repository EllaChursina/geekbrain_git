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

func yearMoreThen2000 (car: Car) -> Bool {
    if car.yearOfIssue >= 2000 {
        return true
    } else {
        return false
    }
}

class Queue <T: Car> {
    var list = [T] ()
    func enqueue (_ element: T) {
        list.append(element)
    }
    
    func enqueue (_ element: T, predicate: (T) -> Bool) {
        if predicate(element){
            list.append(element)
        }
    }
    
    func dequeue() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    func peek () -> T? {
        if !list.isEmpty {
            return list [0]
        } else  {
            return nil
        }
    }
    var isEmpty: Bool  {
        return list.isEmpty
    }
    
    subscript(elements: Int ...) -> Double {  
        var trunkVolumeFilled = 0.0
        for index in elements where index < self.list.count {
            trunkVolumeFilled += self.list[index].trunkVolumeFilled
        }
        return trunkVolumeFilled
    }
}


var queueSportCar = Queue <SportCar> ()
var queueTruckCar = Queue <TruckCar> ()

queueSportCar.enqueue(SportCar(model: "Ferrari", yearOfIssue: 2018, trunkVolume: 2, trunkVolumeFilled: 1, engineState: .run, windowsState: .open, numberOfDoors: 2, turbo: .off))
queueSportCar.enqueue(SportCar(model: "Lamborghini", yearOfIssue: 1997, trunkVolume: 3, trunkVolumeFilled: 3, engineState: .stop, windowsState: .close, numberOfDoors: 3, turbo: .on))
queueSportCar.enqueue(
    SportCar(model: "Lada", yearOfIssue: 1897, trunkVolume: 3, trunkVolumeFilled: 0, engineState: .stop, windowsState: .close, numberOfDoors: 3, turbo: .on),
    predicate: yearMoreThen2000
)
queueTruckCar.enqueue(TruckCar (model: "УРАЛСПЕЦМАШ", yearOfIssue: 2002, trunkVolume: 35000, trunkVolumeFilled: 5000, engineState: .run, windowsState: .close, colorTank: "желтый", tankHoseLength: 50))
queueTruckCar.enqueue(TruckCar (model: "ЗИЛ", yearOfIssue: 2018, trunkVolume: 50000, trunkVolumeFilled: 0, engineState: .stop, windowsState: .close, colorTank: "красный", tankHoseLength: 100))

print(queueSportCar[0,1])

// должно вывестись только первых 2 автомобиля, потому что у 3-го год выпуска меньше 2000-го года, поэтому машина будет отфильтрована замыканием при добавлении
while(!queueSportCar.isEmpty){
    print(queueSportCar.dequeue())
}


