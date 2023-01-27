//
//  Bindable.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

class Bindable<T> {
    typealias Listener = ((T) -> Void)
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        self.value = v
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
