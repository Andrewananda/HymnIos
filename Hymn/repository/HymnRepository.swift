//
//  HymnRepository.swift
//  Hymn
//
//  Created by Andrew Ananda on 05/05/2021.
//

import Foundation

class HymnRepository {
    private let apiService: ApiService
    
    init() {
        self.apiService = ApiService()
    }
    
    func fetchHymns() {
        
        apiService.fetchData(url: K.endpoint.songs, method: .get) { (response: Swift.Result<GeneralResponse<[Hymn]>, Errors>) in
            switch response {
                case .success(let data) :
                    print(data.data)
                case .failure(let error) :
                    print("failiure response \(error.localizedDescription)")
            }
        }
    }
}
