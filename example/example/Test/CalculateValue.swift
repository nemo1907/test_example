//
//  CalculateValue.swift
//  example
//
//  Created by Nemo on 19/8/24.
//

import Foundation

func maxTreasureValue1(value1: Int, weight1: Int, value2: Int, weight2: Int, maxW: Int) -> Int {
    let noItem = 0
    let item1 = weight1 <= maxW ? value1 : 0
    let item2 = weight2 <= maxW ? value2 : 0
    let bothItems = (weight1 + weight2) <= maxW ? (value1 + value2) : 0
    
    return max(noItem, item1, item2, bothItems)
}

func maxTreasureValue2(values: [Int], weights: [Int], maxW: Int) -> Int {
    var arr = Array(repeating: 0, count: maxW + 1)

    for (value, weight) in zip(values, weights) {
        for w in stride(from: maxW, through: weight, by: -1) {
            arr[w] = max(arr[w], arr[w - weight] + value)
        }
    }
    
    return arr[maxW]
}
