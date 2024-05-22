import Foundation

protocol NetworkService {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask
}

class URLSessionNetworkService: NetworkService {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                let unknownError = NSError(domain: "UnknownError", code: 0)
                completion(.failure(unknownError))
            }
        }
    }
}

class DataManager {
    let networkService: NetworkService
    var task: URLSessionDataTask?
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchData() {
        guard let url = URL(string: "http://echo.jsontest.com/key/value/one/two") else {
            print("Invalid URL")
            return
        }
        
        task = networkService.fetchData(from: url, completion: { [weak self] result in
            defer {
                self?.task = nil
            }
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        })
        task?.resume()
    }
}

let urlSessionNetworkService = URLSessionNetworkService()
let dataManager = DataManager(networkService: urlSessionNetworkService)
dataManager.fetchData()
