
import UIKit

class ViewController: UIViewController {
    
    let button = MountainButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let placeholder = PlaceholderView()
        
        view.backgroundColor = .black
//        view.addSubview(placeholder)
//        
//        placeholder.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            placeholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            placeholder.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            placeholder.widthAnchor.constraint(equalToConstant: view.bounds.width),
//            placeholder.heightAnchor.constraint(equalToConstant: 300)
//        ])
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: view.bounds.width),
            button.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
}
