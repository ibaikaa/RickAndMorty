//
//  ApiError.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import Foundation

/// Перечисление некоторых ошибок, которые могут появиться при работе с API-запросами
enum ApiError: Error {
    case invalidURL // Если URL = nil
    case notFound  // Статус код 404
    case internalServerError // Статус код 500
    case strangeResponse
    
    
    var description: String {
        let supportMessage = " Мы уже решаем эту проблему. Пожалуйста, попробуйте еще раз через некоторое время."
        switch self {
        case .invalidURL:
            return "URL-ссылка для получения данных является недействительной" + supportMessage
        case .notFound:
            return "URL-ссылки для получения данных не существует." + supportMessage
        case .internalServerError:
            return "На сервере какие-то неполадки..." + supportMessage
        case .strangeResponse:
            return "Странный ответ от сервера был получен... " + supportMessage
        }
    }
}
