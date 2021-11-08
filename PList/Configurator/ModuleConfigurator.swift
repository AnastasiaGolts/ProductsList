import UIKit

protocol ModuleConfiguratorProtocol: AnyObject {
    func configureCategoriesModule(router: RouterInput) -> UIViewController
    func configureProductsModule(category: Category?, router: RouterInput) -> UIViewController
    func configureItemModule(item: Product?, router: RouterInput) -> UIViewController
}

final class ModuleConfigurator: ModuleConfiguratorProtocol {
    func configureCategoriesModule(router: RouterInput) -> UIViewController {
        let view = CategoriesViewController()
        let networkService = NetworkService()
        let presenter = CategoriesPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }
    
    func configureProductsModule(category: Category?, router: RouterInput) -> UIViewController {
        let view = ProductsViewController()
        let networkService = NetworkService()
        let presenter = ProductsPresenter(view: view, networkService: networkService, category: category, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func configureItemModule(item: Product?, router: RouterInput) -> UIViewController {
        let view = ItemViewController()
        let networkService = NetworkService()
        let presenter = ItemPresenter(view: view, networkService: networkService, item: item, router: router)
        view.presenter = presenter

        return view
    }
}
