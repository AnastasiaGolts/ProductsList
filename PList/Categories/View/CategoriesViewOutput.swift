import Foundation

//MainViewPresenterProtocol – реализует презентер, ссылку на него держит вью
protocol CategoriesViewOutput: AnyObject {
    init(view: CategoriesViewInput, networkService: NetworkServiceProtocol, router: RouterInput)
    func getCategories()
    func tapCategory(category: Category?)
    var categories: [Category]? { get set }
}
