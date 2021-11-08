import Foundation

//MainViewProtocol – реализует вью, ссылку держит презентер
protocol CategoriesViewInput: AnyObject {
    func success()
    func failure(error: Error)
}
