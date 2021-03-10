import Foundation

@objc class Model: NSObject {
    
    public static let shared = Model()
    
    fileprivate override init() {
        super.init()
        
    }
}
