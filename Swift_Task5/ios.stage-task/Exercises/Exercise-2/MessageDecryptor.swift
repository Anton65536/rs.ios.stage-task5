import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
       
        var encryptedMessage: String = ""
       
        var tempString: [String] = []
        for char in message {
            tempString.append(String(char))
        }
        
        if (tempString.first == "[") {
            return (tempString[ 1 ... tempString.count-2].joined(separator: ""))
        }
        
        while (tempString.contains("[")) {
        
            let firstCharToExchange = tempString.lastIndex(of: "[")!
       
            let lastCharToExchange = tempString[firstCharToExchange... ].firstIndex(of: "]")!
        
        var tempArr = Array(tempString[firstCharToExchange...lastCharToExchange])
        
        var i = 1
        while ( ((firstCharToExchange - i) > -1) )
                 {
            if (tempString[firstCharToExchange - i ] == "]" || tempString[firstCharToExchange - i ] == "[") {
                break
            }
            if ( Int(String(tempString[firstCharToExchange - i ])) != nil   ) {
          
                tempArr.insert( tempString[firstCharToExchange - i] , at: 0 )
            }
           i += 1
       }
        
      
           
            let repeatCount = Int(tempArr[ 0 ..< tempArr.firstIndex(of: "[")!].joined(separator: ""))
            let repeatStr =  tempArr[tempArr.firstIndex(of: "[")! + 1 ... tempArr.count-2 ].joined(separator: "")
        
     tempString.replaceSubrange( ((firstCharToExchange-1) ... lastCharToExchange) , with: repeatElement(repeatStr, count: repeatCount!)  )
        
    }
        
        encryptedMessage = tempString.joined(separator: "")
        return encryptedMessage
    }
}
