

import Foundation

enum EngineState {
    case run, stop
}
enum WindowsState {
    case open, close
}

enum TrunkVolumeFilled {
    case load, unload
}

enum BodyVolumeFilled {
    case load, unload
}

struct Car {
    let model: String
    let yearOfIssue: Int
    let trunkVolume: Double
    var trunkVolumeFilled: Double
    mutating func trunkFilled (volumeFilled: TrunkVolumeFilled, cargoVolume: Double) {
        if volumeFilled == .load {
            if self.trunkVolume >= cargoVolume + self.trunkVolumeFilled {
                self.trunkVolumeFilled += cargoVolume
            } else {
                print ("Попытка загрузить груз больше максимального объема")
            }
        } else {
            if self.trunkVolumeFilled >= cargoVolume {
                self.trunkVolumeFilled -= cargoVolume
            } else {
                print ("Попытка выгрузить груз больше допустимого")
            }
        }
    }
    var engineState: EngineState
    var windowsState: WindowsState
}

struct Truck {
    let model: String
    let yearOfIssue: Int
    let bodyVolume: Double
    var bodyVolumeFilled: Double
    mutating func bodyFilled (volumeFilled: BodyVolumeFilled, cargoVolume: Double) {
        if volumeFilled == .load {
            if self.bodyVolume >= cargoVolume + self.bodyVolumeFilled {
                self.bodyVolumeFilled += cargoVolume
            } else {
                print ("Попытка загрузить груз больше максимального объема")
            }
        } else {
            if self.bodyVolumeFilled >= cargoVolume {
                self.bodyVolumeFilled -= cargoVolume
            } else {
                print ("Попытка выгрузить груз больше допустимого")
            }
        }
    }
    var engineState: EngineState
    var windowsState: WindowsState
}

var car1 = Car(model: "Toyota", yearOfIssue: 2001, trunkVolume: 150, trunkVolumeFilled: 0, engineState: .stop, windowsState: .close)
var truck1 = Truck(model: "КАМАЗ", yearOfIssue: 2005, bodyVolume: 10000, bodyVolumeFilled: 0, engineState: .stop, windowsState: .open)

car1.engineState = .run
car1.trunkFilled(volumeFilled: .load, cargoVolume: 125)
car1.trunkFilled(volumeFilled: .unload, cargoVolume: 25)
print(car1.trunkVolumeFilled)

truck1.windowsState = .close
truck1.bodyFilled(volumeFilled: .unload, cargoVolume: 5)
print(truck1.bodyVolumeFilled)

print (car1)
print (truck1)

