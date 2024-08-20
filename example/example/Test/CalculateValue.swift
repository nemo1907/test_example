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
    let n = values.count
      var arr = Array(repeating: 0, count: maxW + 1)

      for i in 0..<n {
          for w in stride(from: maxW, through: weights[i], by: -1) {
              arr[w] = max(arr[w], arr[w - weights[i]] + values[i])
          }
      }
      
      return arr[maxW]
}

let result1 = maxTreasureValue1(value1: 10, weight1: 5, value2: 6, weight2: 4, maxW: 8)
let result2 = maxTreasureValue2(values: [10, 6], weights: [5, 4], maxW: 9)
// print(result1)
// print(result2)
