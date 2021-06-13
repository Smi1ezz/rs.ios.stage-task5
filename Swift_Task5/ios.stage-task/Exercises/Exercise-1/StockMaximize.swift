import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var mySales = [Int]()
        var lastDayPrice = 0
        
        for i in prices {
            if i != lastDayPrice {
                while i > lastDayPrice {
                    lastDayPrice = i
                    mySales.append(i)
                }
            } else {
                lastDayPrice = i
            }
        }
        var result = 0
        mySales.forEach { result += lastDayPrice - $0 }
        return result
    }
}
