import Foundation

protocol NetworkServiceProtocol {
    func loadCategories(completion: @escaping (Result<[Category]?, NetworkError>) -> ())
    func loadProductsList(listID: Int, completion: @escaping (Result<[Product], NetworkError>) -> ())
    func loadProduct(productID: Int, completion: @escaping (Result<Product, NetworkError>) -> ())
}

enum NetworkError: Error {
    case somethingWrong
}

class NetworkService: NetworkServiceProtocol {
    
    private enum Endpoint {
        static let categories = "http://62.109.7.98/api/categories"
        //добавить остальные две
    }

    //MARK: - Loading Categories
    func loadCategories(completion: @escaping (Result<[Category]?, NetworkError>) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        guard let url = URL(string: Endpoint.categories) else {return}
        
        let task = session.dataTask(with: url) {
            
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                completion(.failure(.somethingWrong))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CategoryResponse.self, from: data)
                completion(.success(response.data))
            } catch {
                print("Error info: \(error)")
                completion(.failure(.somethingWrong))
            }
        }
        task.resume()
    }
    
    //MARK: - Loading Product Lists
    func loadProductsList(listID: Int, completion: @escaping (Result<[Product], NetworkError>) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        guard let url = URL(string: "http://62.109.7.98/api/product/category/\(listID)") else {return}
        
        let task = session.dataTask(with: url) {
            
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                      completion(.failure(.somethingWrong))
                    return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let lists = try decoder.decode(ProductsResponse.self, from: data)
                completion(.success(lists.data))
            
            } catch {
                print("Error info: \(error)")
                completion(.failure(.somethingWrong))
            }
        }
        task.resume()
    }
    
    //MARK: - Loading Product
    func loadProduct(productID: Int, completion: @escaping (Result<Product, NetworkError>) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        guard let url = URL(string: "http://62.109.7.98/api/product/\(productID)") else {return}
        
        let task = session.dataTask(with: url) {
            
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                    completion(.failure(.somethingWrong))
                    return
            }
            
            do {
                let decoder = JSONDecoder()
                let newItem = try decoder.decode(ProductResponse.self, from: data)
                completion(.success(newItem.data))
                //let item = newItem.data
                
            } catch {
                print("Error info: \(error)")
                completion(.failure(.somethingWrong))
            }
        }
        task.resume()
    }
}

