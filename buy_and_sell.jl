# https://youtu.be/K8iHi8AW1ls
# Given a list of stock prices, choose days (indexes) to buy and sell to maximize final profit
# After buying, you must sell before buying again

prices = [7,1,5,3,6,4] # buy on 2 for $1, sell on 3 for $5, buy on 4 for $3, sell on 5 for $6; profit = 7

function buysell(prices, day=0, buy=Nothing, profit=0, orders="")
    day += 1
    if day > length(prices)
        return (profit, orders)
    else
        results = []
        if buy == Nothing
            # skip day
            push!(results, buysell(prices, day, buy, profit,
                    string(orders, "day $day: do nothing\n")))
            if day < length(prices)
                # buy
                push!(results, buysell(prices, day, day, profit,
                        string(orders, "day $day: buy at $(prices[day])\n")))
            end

        else
            # sell
            push!(results, buysell(prices, day, Nothing, profit+prices[day]-prices[buy],
                    string(orders, "day $day: sell at $(prices[day])\n")))
            if day < length(prices)
                # skip day
                push!(results, buysell(prices, day, buy, profit,
                        string(orders, "day $day: do nothing\n")))
            end
        end
    end
    # return the result with the highest profit
    maximum(results)
end
