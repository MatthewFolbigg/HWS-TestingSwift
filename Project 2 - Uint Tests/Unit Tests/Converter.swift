import Foundation

struct Converter {
//    func convertToCelsius(_ fahrenheit: Double) -> Double {
//        return (fahrenheit - 32) * 5 / 9
//    }
    
    func convertToCelsius(_ fahrenheit: Double) -> Double {
        let fahrenheitMeasurement = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheitMeasurement.converted(to: .celsius)
        return celsius.value
    }
    
    func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
            let quotient = number / dividedBy
            let remainder = number % dividedBy
            return (quotient, remainder)
    }

}
