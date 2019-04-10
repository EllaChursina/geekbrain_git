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

class Car {
    let model: String
    let yearOfIssue: Int
    let trunkVolume: Double
    var trunkVolumeFilled: Double
    func trunkFilled (volumeFilled: LoadCargo, cargoVolume: Double) {
        if volumeFilled == .load {
            if self.trunkVolume >= cargoVolume + self.trunkVolumeFilled {
                self.trunkVolumeFilled += cargoVolume
            } else {
                print ("попытка загрузить груз больше максимального объема")
            }
        } else {
            if self.trunkVolumeFilled >= cargoVolume {
                self.trunkVolumeFilled -= cargoVolume
            } else {
                print ("попытка выгрузить груз больше допустимого")
            }
        }
    }
    var engineState: EngineState
    var windowsState: WindowsState
    func windowsStateOpen() {
        self.windowsState = .open
    }
    func windowsStateClose() {
        self.windowsState = .close
    }
    init (model: String, yearOfIssue: Int, trunkVolume: Double, trunkVolumeFilled: Double, engineState: EngineState, windowsState: WindowsState){
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.trunkVolumeFilled = trunkVolumeFilled
        self.engineState = engineState
        self.windowsState = windowsState
    }
}
enum CraneBoomLiftState:String {
    case raise, lower
}


class TruckCar: Car {
    let truckCrane: Bool
    var craneBoomLiftState: CraneBoomLiftState // статус стрелы автокрана
    init (model: String, yearOfIssue: Int, trunkVolume: Double, trunkVolumeFilled: Double, engineState: EngineState, windowsState: WindowsState, truckCrane: Bool, craneBoomLiftState: CraneBoomLiftState){
        self.truckCrane = truckCrane
        self.craneBoomLiftState = craneBoomLiftState
        super.init (model: model , yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, trunkVolumeFilled: trunkVolumeFilled, engineState: engineState, windowsState: windowsState)
    }
    func craneBoomLiftRaise() {
        self.craneBoomLiftState = .raise
    }
    func craneBoomLiftLower() {
        self.craneBoomLiftState = .lower
    }
    override func windowsStateOpen() {
        self.windowsState = .open
        print ("Открытие окон грузового автомобиля")
    }
    override func windowsStateClose() {
        self.windowsState = .close
        print ("Закрытие окон грузового автомобиля")
}
}
enum Turbo: String  {
    case on, off
}
class SportCar: Car {
    let numberOfDoors: Int
    var turbo: Turbo
    init (
        model: String,
        yearOfIssue: Int,
        trunkVolume: Double,
        trunkVolumeFilled: Double,
        engineState: EngineState,
        windowsState: WindowsState,
        numberOfDoors: Int,
        turbo: Turbo)
    {
        self.numberOfDoors = numberOfDoors
        self.turbo = turbo
        super.init (model: model , yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, trunkVolumeFilled: trunkVolumeFilled, engineState: engineState, windowsState: windowsState)}
        func turboOn () {
            self.turbo = .on
        }
        func turboOff () {
            self.turbo = .off
        }
        override func windowsStateOpen() {
            self.windowsState = .open
            print ("Открытие окон спортивного автомобиля")
        }
        override func windowsStateClose() {
            self.windowsState = .close
            print ("Закрытие окон спортивного автомобиля")
        }
    }

var truckCar1 = TruckCar (model: "КАМАЗ", yearOfIssue: 1998, trunkVolume: 30, trunkVolumeFilled: 5, engineState: .stop, windowsState: .close, truckCrane: true, craneBoomLiftState: .lower)

var sportCar1 = SportCar (model: "Ferrari", yearOfIssue: 2018, trunkVolume: 2, trunkVolumeFilled: 2, engineState: .run, windowsState: .close, numberOfDoors: 2, turbo: .off)

truckCar1.trunkFilled(volumeFilled: .load, cargoVolume: 5)
truckCar1.windowsStateOpen()
truckCar1.craneBoomLiftRaise()

sportCar1.trunkFilled(volumeFilled: .unload, cargoVolume: 1)
sportCar1.windowsStateClose()
sportCar1.turboOn()

print(sportCar1)
print(truckCar1)



