import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var profit = 0
        var mutablePrices = prices
        
        for price in prices {
            mutablePrices.removeFirst()
            if let max = mutablePrices.max() , max > price  {
                profit += max - price
            }
        }
        return profit
    }
}
