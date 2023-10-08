import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<Element> {
        return `catch` { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
    
    func mapToOptional() -> Observable<Element?> {
        return map { value -> Element? in value }
    }
    
    func unwrap<T>() -> Observable<T> where Element == T? {
        return flatMap { Observable.from(optional: $0) }
    }
}

extension ObservableType where Element == Bool {
    func not() -> Observable<Bool> {
        return map(!)
    }
    
    static func or(_ sources: Observable<Bool>...)
        -> Observable<Bool> {
            return Observable.combineLatest(sources)
                .map { $0.reduce(false) { $0 || $1 } }
    }
    
    static func and(_ sources: Observable<Bool>...)
        -> Observable<Bool> {
            return Observable.combineLatest(sources)
                .map { $0.reduce(true) { $0 && $1 } }
    }
}

private func getThreadName() -> String {
    if Thread.current.isMainThread {
        return "Main Thread"
    } else if let name = Thread.current.name {
        if name.isEmpty {
            return "Anonymous Thread"
        }
        return name
    } else {
        return "Unknown Thread"
    }
}
