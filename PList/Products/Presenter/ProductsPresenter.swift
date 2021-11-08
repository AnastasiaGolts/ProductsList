import Foundation

final class ProductsPresenter: ProductsViewOutput {
    weak var view: ProductsViewInput?
    let networkService: NetworkServiceProtocol?
    var router: RouterInput?
    var products: [Product]?
    var category: Category?
    
    required init(view: ProductsViewInput, networkService: NetworkServiceProtocol, category: Category?, router: RouterInput) {
        self.view = view
        self.networkService = networkService
        self.category = category
        self.router = router
        getProducts()
    }
    
    public func getProducts() {
        guard let category = category else { return }

        networkService?.loadProductsList(listID: category.id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapProduct(product: Product?) {
        router?.showItem(product: product)
    }
}


