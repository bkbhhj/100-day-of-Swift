
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String? //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage // заголовок конкретной картинки
        navigationItem.largeTitleDisplayMode = .never // заколовок не станет слишком большим
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped)) // создание кнопки справа для того чтобы делиться
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad) // проверка на нил
        }
    }
    override func viewWillAppear(_ animated: Bool) {  // не скрытие по нажатию табвью
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false // скрытие по нажатию таб вью
    }
    @objc func shareTapped () {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
        
    }

 
}
