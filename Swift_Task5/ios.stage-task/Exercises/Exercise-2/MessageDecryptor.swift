import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        var codedMassage = message
        var decodedMassage: String = ""
        
        while codedMassage.count > 0 {
            var digit = String(codedMassage.prefix(while: {$0 != "["}))
            if let multiplier = Int(digit) {
                let firstRange = codedMassage.range(of: digit)
                codedMassage = codedMassage.replacingCharacters(in: firstRange!, with: "")
                
                let subMessage = getText(of: codedMassage)
                let decryprted = decryptMessage(subMessage)
                
                decodedMassage.append(String(repeating: decryprted, count: multiplier))
                
                let secondRange = codedMassage.range(of: subMessage)
                codedMassage = codedMassage.replacingCharacters(in: secondRange!, with: "")
            } else {
                digit = String(codedMassage.first!)
                if digit != "]" && digit != "[" {
                    decodedMassage.append(digit)
                }
                codedMassage = String(codedMassage.dropFirst())
            }
        }
        
        return decodedMassage
    }
    
    private func getText(of message: String) -> String {
        
        var text = ""
        var counter = 0
        
        for i in message {
            text.append(i)
            if i != "]" {
                if i == "[" {
                    counter += 1
                }
            } else {
                counter -= 1
                if counter == 0 {
                    break
                }
            }
        }
        return text
    }
}
