import Foundation

enum EmployeeType: String {
    case food = "Food Services"
    case ride = "Ride Services"
    case maintenance = "Maintenance"
}

extension EmployeeType {
    static func all() -> [String] {
        return [EmployeeType.food.rawValue, EmployeeType.ride.rawValue, EmployeeType.maintenance.rawValue]
    }
}

class Employee: Passable {
    
    var name: Name?
    var address: Address?
    var dateOfBirth: Date?
    var socialSecurityNumber: Int?
    let type: EmployeeType
    
    init(name: Name?, address: Address?, dateOfBirth: Date?, socialSecurityNumber: Int?, type: EmployeeType) throws {
        guard dateOfBirth != nil else {
            throw FormError.invalidDateOfBirth("Your birth date is not in the correct format.")
        }
        
        guard let number = socialSecurityNumber, String(number).count == 9 else {
            throw FormError.invalidSocialSecurityNumber("Your social security number is not in the correct format.")
        }
        
        self.name = name
        self.address = address
        self.dateOfBirth = dateOfBirth
        self.socialSecurityNumber = socialSecurityNumber
        self.type = type
    }
    
}
