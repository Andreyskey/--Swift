import UIKit

// Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
// Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
// Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
// Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
// Создать несколько объектов каждого класса. Применить к ним различные действия.
// Вывести сами объекты в консоль.

enum Actions {
    case on, off
    case open, close
    case back, full, front
}

protocol Car {
    var brand: String { get }
    var year: Int { get }
    var windowState: Actions { get set }
    var isLaunch: Actions { get set }
    var carIsAlarmSystem: Actions { get set }
    
    func action(action: Actions)
}


extension Car {
    mutating func windows(state: Actions) {
        if state == .open && windowState != .open{
            print("Окна открываются")
            windowState = .open
        } else if state == .close && windowState != .close {
            print("Окна закрываются")
            windowState = .close
        } else {
            print("Невозможно выполнить данное действие")
        }
    }
    
    mutating func motor(state: Actions) {
        if state == .on && isLaunch != .on{
            print("Двигатель запущен")
            isLaunch = .on
        } else if state == .off && isLaunch != .off {
            print("Двигатель заглушен")
            isLaunch = .off
        } else {
            print("Невозможно выполнить данное действие")
        }
    }
    
    mutating func alarmSystem(state: Actions) {
        if state == .on && carIsAlarmSystem != .on{
            print("Сигнализация включена")
            carIsAlarmSystem = .on
        } else if state == .off && carIsAlarmSystem != .off {
            print("Сигнализация выключена")
            carIsAlarmSystem = .off
        } else {
            print("Невозможно выполнить данное действие")
        }
    }
}

class SportCar: Car {
    var brand: String
    var year: Int
    var windowState: Actions
    var isLaunch: Actions
    var carIsAlarmSystem: Actions
    var drive: Actions
    var nitro: Actions
    init(brand: String, year: Int, windowState: Actions, isLaunch: Actions, carIsAlarmSystem: Actions, drive: Actions, nitro: Actions) {
        self.brand = brand
        self.year = year
        self.windowState = windowState
        self.isLaunch = isLaunch
        self.carIsAlarmSystem = carIsAlarmSystem
        self.drive = drive
        self.nitro = nitro
    }
    
    func action(action: Actions) {
        if action == .on && nitro != .on {
            print("Нитро включен")
            nitro = .on
        } else if action == .off && nitro != .off {
            print("Нитро выключен")
            nitro = .off
        } else {
            print("Невозможно выполнить данное действие")
        }
    }
    
    
}

class TrunkCar: Car {
    var brand: String
    var year: Int
    var windowState: Actions
    var isLaunch: Actions
    var carIsAlarmSystem: Actions
    var trailer: Actions
    init(brand: String, year: Int, windowState: Actions, isLaunch: Actions, carIsAlarmSystem: Actions, trailer: Actions) {
        self.brand = brand
        self.year = year
        self.windowState = windowState
        self.isLaunch = isLaunch
        self.carIsAlarmSystem = carIsAlarmSystem
        self.trailer = trailer
    }
    
    func action(action: Actions) {
        if action == .open && trailer != .open {
            print("Прицеп открыт")
            trailer = .open
        } else if action == .close && trailer != .close {
            print("Прицеп закрыт")
            trailer = .close
        } else {
            print("Невозможно выполнить данное действие")
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return String(describing: brand)
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return String(describing: brand)
    }
}



var car1 = SportCar(brand: "BMW", year: 1999, windowState: .close, isLaunch: .off, carIsAlarmSystem: .off, drive: .full, nitro: .off)

car1.action(action: .on)
car1.alarmSystem(state: .on)
car1.motor(state: .on)

print(car1)



var trunk1 = TrunkCar(brand: "Volvo", year: 2010, windowState: .close, isLaunch: .off, carIsAlarmSystem: .off, trailer: .close)

trunk1.action(action: .open)
trunk1.alarmSystem(state: .on)
trunk1.motor(state: .on)
trunk1.motor(state: .off)

print(trunk1)


