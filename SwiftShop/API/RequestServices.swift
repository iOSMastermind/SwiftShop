//
//  RequestServices.swift
//  GroupManager
//
//  Created by Jinu on 28/08/2024.
//


import Foundation

class RequestServices {
    public static var requestDomain = ""
    //    public static var baseURLString = Constants.Urls.baseURL
    //    public static var apiEndPoint: ApiEndPoints = .guestToken
    
    static func fetchData(completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        let url = URL(string: Self.requestDomain)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard  error == nil else { return }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))

        }
        task.resume()
    }
}
