import Common

public func doKnapsack() {
    print("==== DP(Knapsack) ====")
}

/*
 |  アイテム  |  重さ (kg)  |  価値 ($)  |
 |  ----  |  ----  |  ----  |
 |  1  |  3  |  20  |
 |  2  |  4  |  24  |
 |  3  |  5  |  30  |
 |  4  |  7  |  45  |
 |  5  |  8  |  50  |

 15kg入るナップザックに↑のアイテムを詰めて価値を最大化する。
 */

private struct Item {
    let weight: Int
    let value: Int
}
private let items: [Item] = [
    .init(weight: 3, value: 20),
    .init(weight: 4, value: 24),
    .init(weight: 5, value: 30),
    .init(weight: 7, value: 45),
    .init(weight: 8, value: 50)
]
