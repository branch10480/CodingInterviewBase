import Common

public func doFloydWarshall() {
    let result = floydWarshall(graph: graph)
    print("===== ワーシャルフロイド法 =====")
    print("2点間の距離をすべて出力します。")
    for i in 0..<result.count {
        for j in 0..<result.count {
            if result[i][j] == INF {
                print("INF", terminator: " ")
            } else {
                print(result[i][j], terminator: " ")
            }
        }
        print("\n")
    }
}

/*
 ワーシャルフロイド法
 ----------------------
 各頂点同士の距離をすべて求めることができる。
 マイナスのエッジがあっても計算が可能。

 */

// 距離行列を作る
//  1 2 3 4
// 1
// 2
// 3
// 4
//
// (1,2) は 1 -> 2 へ行くときの距離を表す
// INF(十分に大きい数)は経路が隣接する経路がないことを表す
private let INF = 100_000
private var graph: [[Int]] = [
    [0, 5, INF, 10],
    [INF, 0, 3, INF],
    [INF, INF, 0, 1],
    [INF, INF, INF, 0]
]

private func floydWarshall(graph: [[Int]]) -> [[Int]] {
    var graph = graph
    for k in 0..<graph.count {
        for i in 0..<graph.count {
            for j in 0..<graph.count {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
    return graph
}
