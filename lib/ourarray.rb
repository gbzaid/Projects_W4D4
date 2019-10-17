def my_uniq(array)
    result = []
    array.each do |ele|
        result << ele unless result.include?(ele)
    end
    result
end

class Array
    def two_sum
        positions = (0...self.length).to_a.combination(2)
        positions.select do |i, j|
            self[i] + self[j] == 0
        end
    end
end

def my_transpose(arr)
    new_arr = Array.new(arr.length) { [] }
    arr.each_with_index do |row, i|
        row.each_with_index do |ele, j|
            new_arr[j] << ele
        end
    end
    new_arr
end

def pick_stocks(stocks)
    profit = 0
    dates = []
    stocks.each_with_index do |price, buy_day|
        ((buy_day + 1)...stocks.length).each do |sell_day|
            buy = stocks[buy_day]
            sell = stocks[sell_day]
            if sell - buy > profit
                profit = sell - buy
                dates[0] = buy_day
                dates[1] = sell_day
            end
        end
    end
    dates
end