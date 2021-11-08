import Foundation

protocol ProductsViewOutput: AnyObject {
    init(view: ProductsViewInput, networkService: NetworkServiceProtocol, category: Category?, router: RouterInput)
    func getProducts()
    func tapProduct(product: Product?)
    var products: [Product]? { get set }
}
