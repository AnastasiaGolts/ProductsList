import Foundation

protocol ItemViewOutput: AnyObject {
    init(view: ItemViewInput, networkService: NetworkServiceProtocol, item: Product?, router: RouterInput)
    func getItem()
    var item: Product? { get set }
}
