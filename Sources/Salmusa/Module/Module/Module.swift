//
//  Module.swift
//  Salmusa
//
//  Copyright (c) 2018 Jason Nam (https://jasonnam.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// VIPER module.
open class Module<I: Interactor, P: Presenter, R: Router, V: View> {

    /// Module input.
    open var input: P.MI {
        return presenter.input
    }
    /// Module output.
    open var output: P.ModuleOutput? {
        get { return presenter.output }
        set { presenter.output = newValue }
    }
    /// Router input.
    public let router: R.RI

    /// Interactor.
    private var interactor: I
    /// Presenter.
    private var presenter: P
    /// Router.
    private var _router: R
    /// View.
    private var view: V

    /// Initialize module.
    ///
    /// - Parameters:
    ///   - interactor: Interactor.
    ///   - presenter: Presenter.
    ///   - router: Router.
    ///   - view: View.
    public init(interactor: I, presenter: P, router: R, view: V) {
        self.router = router.input
        self.interactor = interactor
        self.presenter = presenter
        self._router = router
        self.view = view
        connectComponents()
    }

    /// Connect components.
    private func connectComponents() {
        interactor.output = (presenter as! I.InteractorOutput)

        presenter.interactor = (interactor as! P.InteractorInput)
        presenter.router = (router as! P.RouterInput)
        presenter.view = (view as! P.ViewInput)

        _router.view = (view as! R.V)

        view.output = (presenter as! V.ViewOutput)
    }
}
