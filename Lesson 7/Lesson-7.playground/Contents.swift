import UIKit

// Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
// Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

struct Item {
    var price: Int
    var count: Int
    var product: Product
}

struct Product {
    var name: String
}

class VendingMachine {

    var inventory = [
        "Candy Bar": Item(price: 12, count: 7, product: Product(name: "Candy Bar")),
        "Chips": Item(price: 10, count: 4, product: Product(name: "Chips")),
        "Pretzels": Item(price: 0, count: 11, product: Product(name: "Pretzels"))
    ]

    var coinsDeposited = 0

    func vend(itemNamed name: String) -> (Product?, VendingMachineError?) {

        guard let item = inventory[name] else {
            return (nil, VendingMachineError.invalidSelection)
        }

        guard item.count > 0 else {
            return (nil, VendingMachineError.outOfStock)
        }

        guard item.price <= coinsDeposited else {
            return (nil, VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited))
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        return (newItem.product, nil)
    }
}


