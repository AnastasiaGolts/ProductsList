import Foundation

final class ItemPresenter: ItemViewOutput {
    weak var view: ItemViewInput?
    let networkService: NetworkServiceProtocol?
    var router: RouterInput?
    var item: Product?
    
    required init(view: ItemViewInput, networkService: NetworkServiceProtocol, item: Product?, router: RouterInput) {
        self.view = view
        self.networkService = networkService
        self.item = item
        self.router = router
    }
    
    public func getItem() {
        view?.getItem(item: item)
    }
}

