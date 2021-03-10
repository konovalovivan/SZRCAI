import UIKit

extension Model {
    func clearButtonSetup() {
        let button = UIButton()
        button.tag = Model.buttonTag.clear.rawValue
        
        let h = mainButton?.bounds.height ?? .zero
        button.frame.size = .init(width: h, height: h)
        
        button.setImage(#imageLiteral(resourceName: "clean"), for: .normal)
        
        button.layer.cornerRadius = button.bounds.width / 2
        button.backgroundColor = .white
        
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        clearButton = button
    }
}
