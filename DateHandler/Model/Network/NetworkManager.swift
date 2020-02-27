//
//  Networking.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 26.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class NetworkManager {
    
    public typealias RequestSuccessHandler = ([String: Any]) -> Void
    public typealias RequestErrorHandler = (Error) -> Void
    
    enum HTTPMethod: String {
           case get = "GET"
    }
    
    private let urlSession = URLSession.shared
    private let serverUrl: URL
    
    public init(serverUrl: URL) {
        self.serverUrl = serverUrl
    }
    
    func request(path: String, parameters: [String: Any], onSuccess: RequestSuccessHandler?, onFail: RequestErrorHandler?) {
        
        var components = URLComponents(url: self.serverUrl, resolvingAgainstBaseURL: true)
        components?.path = path
        
        // Все обработки ошибок — это тоже хороший тон, если что-то пошло не так — дай об этом ответ наружу,
        // пусть там думают как это исправить
        // не стоит отмалчиваться и делать return без воозврата ошибки
        guard let url = components?.url else {
            let error = NSError(
                domain: "NetworkManager",
                code: -1,
                userInfo: [ NSLocalizedDescriptionKey: "Malformed @components" ]
            )
            onFail?(error)
            return
        }
        
        var request = URLRequest(url: url)
        // Как я уже говорил — в случае с GET указывать не обязательно,
        // но ты можешь HTTPMethod передавать сюда параметром при вызове из вне
        request.httpMethod = HTTPMethod.get.rawValue
                
        let task = self.urlSession.dataTask(with: request, completionHandler: { (data, response, error) in
            // Тут сразу смотришь — пришла какая-то ошибка, значит отдай наверх или реши ее на месте,
            // зависит от ситуации и твоего сервера. Обычно наверх отдают
            if let error = error {
                onFail?(error)
                return
            }
            
            // Сериализация, процесс получения из Data объект типа Dictionary<String, Any>
            // и он тоже может кончиться плохо по какой-то причине — отдай ошибку
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                let error = NSError(
                    domain: "NetworkManager",
                    code: -1,
                    userInfo: [ NSLocalizedDescriptionKey: "Malformed response @data" ]
                )
                onFail?(error)
                return
            }
            
            onSuccess?(json)
        })
        
        task.resume()
    }
    
}
