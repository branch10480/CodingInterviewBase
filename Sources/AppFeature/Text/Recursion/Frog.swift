//
//  File.swift
//  
//
//  Created by Toshiharu Imaeda on 2023/07/09.
//

import Foundation

public func doDPFrog() {
    print("==== 動的計画法(DP) ====")
    let cost = minCost(at: h.count-1)
    print("最小コストは \(cost)")
}

/*
 N個の足場があって，i(＝0,1,...,N－1)番目の足場の高さはhiで与えられます．
 最初０番目の足場にカエルがいて，
 以下のいずれかの行動を繰り返してN－1番目の足場を目指します．
 足場iから足場i＋1へと移動する(コストは|hi－hi＋1|)
 足場iから足場i＋2へと移動する(コストは|hi－hi＋2|)
 カエルがN－1番目の足場にたどり着くまでに要するコストの総和の最小値を求めてください．
 */

private let h: [Int] = [2, 9, 4, 5, 1, 6, 10]
private var cache: [Int?] = .init(repeating: nil, count: h.count)

/// posに到達するまでの最小コストを返す
private func minCost(at pos: Int) -> Int {
    if pos == 0 {
        return 0
    }
    if pos == 1 {
        return abs(h[1] - h[0])
    }

    let args = [pos-1, pos-2].map {
        let base: Int
        if let cached = cache[$0] {
            base = cached
        } else {
            let cost = minCost(at: $0)
            cache[$0] = cost
            base = cost
        }
        return base + abs(h[pos] - h[$0])
    }

    return min(args[0], args[1])
}
