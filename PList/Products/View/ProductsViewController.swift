import UIKit

final class ProductsViewController: UIViewController {
    var presenter: ProductsViewOutput?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getProducts()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ProductsViewController: ProductsViewInput {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let product = presenter?.products?[indexPath.row]
        cell.textLabel?.text = product?.name
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = presenter?.products?[indexPath.row]
        presenter?.tapProduct(product: item)
    }
}
