import Foundation
import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
    
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
    
    func mapToOptional() -> SharedSequence<SharingStrategy, Element?> {
        return map { value -> Element? in value }
    }
    
    func unwrap<T>() -> SharedSequence<SharingStrategy, T> where Element == T? {
        return flatMap { SharedSequence.from(optional: $0) }
    }
}

extension SharedSequenceConvertibleType where Element == Bool {
    func not() -> SharedSequence<SharingStrategy, Bool> {
        return map(!)
    }
    
    static func or(_ sources: SharedSequence<DriverSharingStrategy, Bool>...)
        -> SharedSequence<DriverSharingStrategy, Bool> {
            return Driver.combineLatest(sources)
                .map { $0.reduce(false) { $0 || $1 } }
    }
    
    static func and(_ sources: SharedSequence<DriverSharingStrategy, Bool>...)
        -> SharedSequence<DriverSharingStrategy, Bool> {
            return Driver.combineLatest(sources)
                .map { $0.reduce(true) { $0 && $1 } }
    }
}
