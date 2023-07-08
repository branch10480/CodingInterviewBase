import Common

public func doDijkstra() {
    let edges: [Edge] = edges()
    print("===== ダイクストラ法 =====")
    print(dijkstra(edges: edges, start: "A", destination: "F"))
}

/*
 A -> F への最短経路を求める
 ---------------------------

 A -2- B -3- D
 |     |     |
 1     1     5
 |     |     |
 C -1- E -2- F
 */

private func edges() -> [Edge] {
    [
        .init(from: "A", to: "B", weight: 2),
        .init(from: "A", to: "C", weight: 1),
        .init(from: "B", to: "D", weight: 3),
        .init(from: "B", to: "E", weight: 1),
        .init(from: "C", to: "E", weight: 1),
        .init(from: "D", to: "F", weight: 5),
        .init(from: "E", to: "B", weight: 1),
        .init(from: "E", to: "F", weight: 2)
    ]
}

private struct Edge {
    let from: String
    let to: String
    let weight: Int
}

private func dijkstra(edges: [Edge], start: String, destination: String) -> (Int, [String]) {
    // データ構造の準備を行う
    var distances: [String: Int] = [start: 0]
    var previousVertices: [String: String?] = [start: nil]

    var unvisitedVertices: Set<String> = .init()
    for edge in edges {
        unvisitedVertices.insert(edge.from)
        unvisitedVertices.insert(edge.to)
        if edge.from != start {
            distances[edge.from] = .max
        }
        if edge.to != start {
            distances[edge.to] = .max
        }
    }

    // メインのアルゴリズムを実行する
    while let currentVertex = unvisitedVertices.min(by: { distances[$0, default: .max] < distances[$1, default: .max] }) {
        unvisitedVertices.remove(currentVertex)
        for edge in edges {
            guard currentVertex == edge.from else { continue }
            let alternativeDistance = distances[edge.from, default: .max] + edge.weight
            if alternativeDistance < distances[edge.to, default: .max] {
                distances[edge.to] = alternativeDistance
                previousVertices[edge.to] = currentVertex
            }
        }
    }

    let shortestDistance = distances[destination, default: .max]
    let shortestPath = shortestPath(previousVertices: previousVertices, start: start, destination: destination)
    return (shortestDistance, shortestPath)
}

private func shortestPath(previousVertices: [String: String?], start: String, destination: String) -> [String] {
    var path: [String] = [destination]
    var currentVertex = destination
    while let v = previousVertices[currentVertex] {
        guard let v else { break }
        path.append(v)
        currentVertex = v
    }
    return path.reversed()
}
