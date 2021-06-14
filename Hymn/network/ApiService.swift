//
//  ApiService.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Alamofire

class ApiService {
    
     func fetchData<T : Codable>(url: String, method: HTTPMethod, params: [String:Any]?, complition : @escaping (Result<T, Errors>) -> Void) {
        let endpoint = K.endpoint.BASE_URL + url
        
        AF.request(endpoint, method: method, parameters: params, encoding: JSONEncoding.default, headers: HTTPHeaders.default)
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
                    } catch(let error) {
                        print(T.self)
                        complition(.failure(Errors.apiError(error.localizedDescription)))
                    }
                } else {
                    complition(.failure(Errors.emptyResponse))
                }
            }
        
    }
}
