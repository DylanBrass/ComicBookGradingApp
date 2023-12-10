import Foundation
import UIKit
final class MetronApiCallService : NSObject{
    
    static let apiCallService = MetronApiCallService()
    
    private override init() {
        
    }
    
    
    
    func fetchAll(page: Int,completion: @escaping (IssueResponse?) -> Void) {
        print("In fetch all service")
        fetchData(url: "https://metron.cloud/api/issue/?page=\(page)", model: IssueResponse.self) { data in
            print("In fetch data")
            print(data)
            let issues: IssueResponse = data
            completion(issues)
        } failure: { error in
            print(error)
        }
    }

    func fetchData<T: Decodable>(url: String, model: T.Type, completion: @escaping (T) -> (), failure: @escaping (Error) -> ()) {
        guard let url = URL(string: url) else { return }

        var request = URLRequest(url: url)
        let token = "RHlsYW5CcmFzczohYjdpMmEyQ2FELUpZdW0="
        request.addValue("Basic \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
    }
}
