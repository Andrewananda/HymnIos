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
        let url = "http://hymn.devstart.co.ke/api/songs"
        
        apiService.fetchData(url: url) { (response: Swift.Result<GeneralResponse<[Hymn]>, Errors>) in
            switch response {
                case .success(let data) :
                    print(data.message)
                case .failure(let error) :
                print(error)
            }
        }
    }
}
