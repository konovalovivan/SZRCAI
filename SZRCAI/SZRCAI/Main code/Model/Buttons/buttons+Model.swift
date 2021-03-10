import UIKit

extension Model {
    
    enum buttonTag: Int {
        case clear
        case graphs
        case start
        case finish
        case routecalc
    }
    
    //MARK: - Main Button Setup
    
    internal func mainButtonSetup() {
        let button = UIButton(frame: .zero)
        button.contentMode = .center
        button.backgroundColor = .white
        button.contentEdgeInsets = UIEdgeInsets(equal: 15)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        DispatchQueue.main.async {
            let bounds = UIScreen.main.bounds
            button.frame.origin.y = bounds.maxY
            button.center.x = bounds.midX
        }
        self.mainButton = button
        buttonConfig(type: .graphs)
    }
    
    //MARK: - Main Button Config
    
    internal func buttonConfig(type: buttonTag) {
        guard let button = mainButton else { return }
        button.tag = type.rawValue
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        switch type {
        case .graphs:
            self.graphsBuilt = false
            button.setTitle("Построить графы", for: .normal)
            button.sizeToFit()
            
            button.layer.cornerRadius = button.bounds.height / 3
            
            let gradient = CAGradientLayer()
            gradient.frame = button.bounds
            gradient.colors = [#colorLiteral(red: 0.8165418145, green: 0.250980407, blue: 0.7970164812, alpha: 1).cgColor, #colorLiteral(red: 0.2392156869, green: 0.4640353456, blue: 0.9686274529, alpha: 1).cgColor]
            gradient.startPoint = .init(x: 0, y: 0.5)
            gradient.endPoint = .init(x: 1.0, y: 0.5)
            gradient.cornerRadius = button.layer.cornerRadius
            button.layer.insertSublayer(gradient, at: 0)
        case .start:
            DispatchQueue.main.async {
                button.layer.sublayers?.remove(at: 0)
            }
            button.backgroundColor = .systemGreen
            button.setTitle("Выберите старт", for: .normal)
        case .finish:
            button.backgroundColor = .systemBlue
            button.setTitle("Выберите финиш", for: .normal)
        case .routecalc:
            button.backgroundColor = .systemRed
            button.setTitle("В путь!", for: .normal)
        default: break
        }
        
        self.mainButtonTitle = button.titleLabel?.text ?? ""
    }
}
