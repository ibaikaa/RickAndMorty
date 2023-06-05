//
//  Collection+isLastItem.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import Foundation

/// Source: https://stackoverflow.com/questions/59868393/swiftui-pagination-for-list-object
extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLastItem<Item: Identifiable>(_ item: Item) -> Bool {
        guard !isEmpty else {
            return false
        }
        
        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        
        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}
