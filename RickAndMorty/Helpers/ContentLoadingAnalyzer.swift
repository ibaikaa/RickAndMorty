//
//  ContentLoadingAnalyzer.swift
//  RickAndMorty
//
//  Created by ibaikaa on 7/6/23.
//

import Foundation

final class ContentLoadingAnalyzer {
    private init () { }
    
    static func shouldLoadMoreContent<T: DTOProtocol> (
        of array: [T],
        item: T,
        currentPage: Int,
        totalPages: Int
    ) -> Bool {
        
        // Получаем последний индекс из уже подгруженных элементов
        let thresholdIndex = array.index(array.endIndex, offsetBy: -1)
        // Если наш текущий элемент – последний в текущем массиве
        let isLastItem = thresholdIndex == item.id
        // И если страница не самая последняя подгружена
        let lastPageLoaded = (currentPage + 1) >= totalPages
        
        // Значит можно подгружать еще контента
        let shouldLoadMoreContent = isLastItem && !lastPageLoaded
        
        // Возвращаем это булевое условие
        return shouldLoadMoreContent
    }
}
