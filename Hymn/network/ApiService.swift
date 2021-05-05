//
//  ApiService.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Alamofire

class ApiService {
    
    
     func fetchData<T : Codable>(url: String, complition : @escaping (Swift.Result<T, Errors>) -> Void) {
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HTTPHeaders.default)
            .validate(statusCode: 200..<300).responseJSON { response in
                if let httpUrlResponse = response.response, 200..<300 ~= httpUrlResponse.statusCode {
                    guard let processData = response.data else {
                        complition(.failure(Errors.emptyResponse))
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.dataDecodingStrategy = .base64
                        complition(.success(try decoder.decode(T.self, from: processData)))
                    } catch {
                        print(T.self)
                        complition(.failure(Errors.emptyResponse))
                    }
                } else {
                    complition(.failure(Errors.emptyResponse))
                }
            }
        
    }
}
