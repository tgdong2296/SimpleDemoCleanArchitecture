import Foundation
import RxSwift
import RxCocoa

extension UIViewController {
    func logDeinit() {
        print(String(describing: type(of: self)) + " deinit")
    }
}
