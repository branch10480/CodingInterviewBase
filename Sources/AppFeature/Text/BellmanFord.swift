import Common

public func doBellmanFord() {
    let result = shortestPathBellmanFord(edges: edges, numberOfVertices: 5, start: 0)
    print("===== ベルマンフォード法 =====")
    print(result ?? [])
}

private struct Edge {
    let from: Int
    let to: Int
    let cost: Int
}

// 十分に大きい数
private let INF: Int = 1000_000

/*
 頂点数が5つ、辺が6つの有向グラフです。頂点は 0 から 4 までの数字で表され、辺とその重みは次のように定義します。

 辺 0-1 の重みは -1
 辺 0-2 の重みは 4
 辺 1-2 の重みは 3
 辺 1-3 の重みは 2
 辺 1-4 の重みは 2
 辺 3-2 の重みは 5
 辺 3-1 の重みは 1
 辺 4-3 の重みは -3

 ベルマンフォード法にて、頂点0から拡張店への最短距離を求める
 */

private let edges: [Edge] = [
    Edge(from: 0, to: 1, cost: -1),
    Edge(from: 0, to: 2, cost: 4),
    Edge(from: 1, to: 2, cost: 3),
    Edge(from: 1, to: 3, cost: 2),
    Edge(from: 1, to: 4, cost: 2),
    Edge(from: 3, to: 2, cost: 5),
    Edge(from: 3, to: 1, cost: 1),
    Edge(from: 4, to: 3, cost: -3)
]

private func shortestPathBellmanFord(edges: [Edge], numberOfVertices: Int, start: Int) -> [Int]? {
    var distances: [Int] = [Int](repeating: INF, count: numberOfVertices)
    distances[start] = 0
    // 最大「頂点の総数-1」だけ繰り返す
    for _ in 0..<numberOfVertices {
        var updated = false
        for edge in edges {
            // distances[edge.from] != INF はその経路が存在することを表す
            // INF の場合はそこにつながる経路がないということ
            guard distances[edge.from] != INF else { continue }
            let d = distances[edge.from] + edge.cost
            if distances[edge.to] > d {
                updated = true
                distances[edge.to] = d
            }
        }

        if !updated {
            break
        }
    }

    // 負の重みの閉路
    // ... 閉路が負のとき、その区間をぐるぐる回っていれば経路が無限に小さくなってしまい、最短経路が求まらない
    //
    // 本来であれば頂点の数分辺をみれば各頂点間の最短経路は求まる。
    // もう一度辺を見て、まだ最短経路が見つかるということは負の閉路が存在することを意味する。
    for edge in edges {
        if distances[edge.from] != INF, distances[edge.to] > distances[edge.from] + edge.cost {
            // 負の閉路が存在するため、最短経路の算出は不可能となり、エラーとする
            return nil
        }
    }

    return distances
}
