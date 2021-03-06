import UIKit

let string = "This is a test string"
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

let atributtedString = NSAttributedString(string: string, attributes: attributes)
 
let attributedString = NSMutableAttributedString(string: string)
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))

extension String {
    
    func withPrefix(_ prefix: String) -> String {
        guard !self.isEmpty else { return "" }
        
        if self.hasPrefix(prefix) {
            return self
        } else {
            return prefix + self
        }
    }
    
}

let pet = "pet"

pet.withPrefix("car")
pet.withPrefix("pet")

extension String {
    var isNumeric: Bool {
        let numbers = "1234567890"
        
        return self.contains(where: numbers.contains)
        
    }
}
let stringWithNumber = "Hello, doggy 1"

pet.isNumeric
stringWithNumber.isNumeric

extension String {
    var lines: [String] {
        return self.components(separatedBy: "/")
    }
}

var linesString = "One/two/three TEST/lol"
linesString.lines
