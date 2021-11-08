import UIKit

protocol Router {
    var navigationController: UINavigationController? { get set }
    var configurator: ModuleConfiguratorProtocol? { get set }
}

protocol RouterInput: Router {
    func initialVC()
    func showCategory(category: Category?)
    func showItem(product: Product?)
}
