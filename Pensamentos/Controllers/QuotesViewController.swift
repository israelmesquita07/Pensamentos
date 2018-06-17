//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Israel3D on 17/06/2018.
//  Copyright © 2018 Israel3D. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var imgPhotoBg: UIImageView!
    @IBOutlet weak var lblQuote: UILabel!
    @IBOutlet weak var lblAutor: UILabel!
    @IBOutlet weak var ctLbTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }

    func prepareQuote() {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { (timer) in
            self.showRandomQuote()
        }
        showRandomQuote()
    }

    func showRandomQuote(){
        let quote = quotesManager.getRandomQuote()
        lblQuote.text = quote.quote
        lblAutor.text = quote.autor
        imgPhoto.image = UIImage(named: quote.image)
        imgPhotoBg.image = imgPhoto.image
        
        lblQuote.alpha = 0.0
        lblAutor.alpha = 0.0
        imgPhoto.alpha = 0.0
        imgPhotoBg.alpha = 0.0
        ctLbTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lblQuote.alpha = 1.0
            self.lblAutor.alpha = 1.0
            self.imgPhoto.alpha = 1.0
            self.imgPhotoBg.alpha = 0.25
            self.ctLbTop.constant = 10
            self.view.layoutIfNeeded()
        }
        
    }
}






















