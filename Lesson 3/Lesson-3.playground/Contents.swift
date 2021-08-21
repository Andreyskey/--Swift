import UIKit


// Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

struct SprotCar {
    let brand : String
    let yearOfRelease: Int
    let bodyVolume : Int
    var isLaunch : Actions
    var windowState : Actions
    
    mutating func action(action: Actions) {
        switch action {
        case .MototrIsOff:
            print("Мотор заглушен")
            isLaunch = .MototrIsOff
        case .motorIsOn:
            print("Мотор запущен")
            isLaunch = .motorIsOn
        case .windowIsOpen:
            print("Окна октрыты")
            windowState = .windowIsOpen
        case .windowsIsClose:
            print("Окна закрыты")
            windowState = .windowsIsClose
        default:
            break
        }
    }
}

struct TrunkCar {
    let brand : String
    let yearOfRelease: Int
    let bodyVolume : Int
    var isLaunch : Actions
    var windowState : Actions
    
    mutating func action(action: Actions) {
        switch action {
        case .MototrIsOff:
            print("Мотор заглушен")
            isLaunch = .MototrIsOff
        case .motorIsOn:
            print("Мотор запущен")
            isLaunch = .motorIsOn
        case .windowIsOpen:
            print("Окна открыты")
            windowState = .windowIsOpen
        case .windowsIsClose:
            print("Окна закрыты")
            windowState = .windowsIsClose
        case .load:
            print("Загрузка в багажник")
        case .upload:
            print("Выгрузка из багажника")
        }
    }
}

// Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum Actions {
    case motorIsOn, MototrIsOff
    case windowIsOpen, windowsIsClose
    case load, upload
}

// Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var car = SprotCar(brand: "BMW", yearOfRelease: 1992, bodyVolume: 500, isLaunch: .MototrIsOff, windowState: .windowsIsClose)

car.action(action: .motorIsOn)
car.action(action: .windowIsOpen)

var trunk = TrunkCar(brand: "Volvo", yearOfRelease: 1992, bodyVolume: 5000, isLaunch: .MototrIsOff, windowState: .windowsIsClose)

trunk.action(action: .motorIsOn)
trunk.action(action: .windowIsOpen)
trunk.action(action: .load)

// Вывести значения свойств экземпляров в консоль.

print(car)
print(trunk)
