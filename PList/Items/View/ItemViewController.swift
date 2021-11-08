import UIKit

final class ItemViewController: UIViewController {
    var presenter: ItemViewOutput?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ccalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var item: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getItem()
    }
    
}

extension ItemViewController: ItemViewInput {
    func getItem(item: Product?) {
        nameLabel.text = item?.name
        ccalLabel.text = "\(item?.ccal ?? 0)"
        dateLabel.text = item?.date
    }
}
