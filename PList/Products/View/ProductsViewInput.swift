import Foundation

protocol ProductsViewInput: AnyObject {
    func success()
    func failure(error: Error)
}
