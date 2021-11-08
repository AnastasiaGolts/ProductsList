import Foundation

final class CategoriesPresenter: CategoriesViewOutput {
    weak var view: CategoriesViewInput?
    let networkService: NetworkServiceProtocol?
    var router: RouterInput?
    var categories: [Category]?
    
    required init(view: CategoriesViewInput, networkService: NetworkServiceProtocol, router: RouterInput) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getCategories()
    }
    
    func getCategories() {
        networkService?.loadCategories{ [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let categories):
                    self.categories = categories
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapCategory(category: Category?) {
        router?.showCategory(category: category)
    }
    
}
