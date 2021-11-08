import UIKit

final class CategoriesRouter: RouterInput {
    var configurator: ModuleConfiguratorProtocol?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController, configurator: ModuleConfiguratorProtocol) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
    
    func initialVC() {
        if let navigationController = navigationController {
            guard let categoriesVC = configurator?.configureCategoriesModule(router: self) else { return }
            navigationController.viewControllers = [categoriesVC]
        }
    }
    
    func showCategory(category: Category?) {
        if let navigationController = navigationController {
            guard let productsVC = configurator?.configureProductsModule(category: category, router: self) else { return }
            navigationController.pushViewController(productsVC, animated: true)
        }
    }
    
    func showItem(product: Product?) {
        if let navigationController = navigationController {
            guard let itemVC = configurator?.configureItemModule(item: product, router: self) else { return }
            navigationController.pushViewController(itemVC, animated: true)
        }
    }
}

