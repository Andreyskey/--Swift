import UIKit

// Homework Lesson-4

// Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
// Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
// Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
// В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
// Создать несколько объектов каждого класса. Применить к ним различные действия.
// Вывести значения свойств экземпляров в консоль.

class Car {
    let brand: String
    let year: Int
    let fuelMax: Int
    let maxSpeed: Int
    var motorState: Actions = .motorIsOff
    var windowsState: Actions = .windowsIsClose
    init(brand: String, year: Int, fuelMax: Int, maxSpeed: Int) {
        self.brand = brand
        self.year = year
        self.fuelMax = fuelMax
        self.maxSpeed = maxSpeed
    }
    
    func actions(action: Actions) {
        
    }
}


class SportCar: Car {
    var racesCount: Int = 0
    var turboMode: Bool = false
    var nitro: Bool = false
    var drive: Actions
    init(brand: String, year: Int, fuelMax: Int, maxSpeed: Int, drive: Actions) {
        self.drive = drive
        super.init(brand: brand, year: year, fuelMax: fuelMax, maxSpeed: maxSpeed)
    }
    
    override func actions(action: Actions) {
        switch action {
        case .motorIsOff where motorState == .motorIsOn:
            print("Мотор у \(brand) заглушен")
            motorState = .motorIsOff
        case .motorIsOn where motorState == .motorIsOff:
            print("Мотор у \(brand) заведен")
            motorState = .motorIsOn
        case .nitroOff where nitro:
            print("Нитро у \(brand) деактивирован")
            nitro = false
        case .nitroOn where !nitro:
            print("Нитро у \(brand) активирован")
            nitro = true
        case .turboOff where turboMode:
            print("Турбо у \(brand) деактивирован")
            turboMode = false
        case .turboOn where !turboMode:
            print("Турбо у \(brand) активирован")
            turboMode = true
        case .goRace:
            print("\(brand) поучавстовал(а) в гонках")
            racesCount += 1
        case .windowIsOpen where windowsState == .windowsIsClose:
            print("Окна \(brand) открыты")
            windowsState = .windowIsOpen
        case .windowsIsClose where windowsState == .windowIsOpen:
            print("Окна \(brand) закрыты")
            windowsState = .windowsIsClose
        default:
            print("Невозможно применить данное дейсвтие")
            break
        }
    }
}

class TrunkCar: Car {
    var transportationCount: Int = 0
    var superLight: Bool = false
    
    override func actions(action: Actions) {
        switch action {
        case .motorIsOff where motorState == .motorIsOn:
            print("Мотор у \(brand) заглушен")
            motorState = .motorIsOff
        case .motorIsOn where motorState == .motorIsOff:
            print("Мотор у \(brand) заведен")
            motorState = .motorIsOn
        case .windowIsOpen where windowsState == .windowsIsClose:
            print("Окна \(brand) открыты")
            windowsState = .windowIsOpen
        case .windowsIsClose where windowsState == .windowIsOpen:
            print("Окна \(brand) закрыты")
            windowsState = .windowsIsClose
        case .superLightOn where !superLight:
            print("Фанари дальнего вида у \(brand) включены")
            superLight = true
        case .superLoghtOff where superLight:
            print("Фанари дальнего вида у \(brand) выключены")
            superLight = false
        case .goTrans:
            print("\(brand) перевез товары")
            transportationCount += 1
        default:
            print("Невозможно применить данное дейсвтие")
            break
        }
    }
}

enum Actions {
    case motorIsOn, motorIsOff
    case windowIsOpen, windowsIsClose
    case load, upload
    case superLightOn, superLoghtOff
    case nitroOn, nitroOff
    case turboOn, turboOff
    case goRace, goTrans
    case full, back, front
}



var superCarOne = SportCar(brand: "BMW", year: 2004, fuelMax: 50, maxSpeed: 300, drive: .full)

superCarOne.actions(action: .motorIsOn)
superCarOne.actions(action: .windowIsOpen)
superCarOne.actions(action: .goRace)
superCarOne.actions(action: .motorIsOn)

var trunkCarOne = TrunkCar(brand: "Volvo", year: 1990, fuelMax: 100, maxSpeed: 130)
trunkCarOne.actions(action: .goTrans)
trunkCarOne.actions(action: .superLightOn)
trunkCarOne.actions(action: .goRace)


print(superCarOne)
print(trunkCarOne)
