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
    @IBOutlet weak var LclblTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer:Timer?
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue:"Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView(){
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lblQuote.textColor = config.colorScheme == 0 ? .black : .white
        lblAutor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }

    func prepareQuote() {
        
        timer?.invalidate()
        if config.autoRefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }

    func showRandomQuote(){
        let quote = quotesManager.getRandomQuote()
        lblQuote.text = quote.quote
        lblAutor.text = quote.author
        imgPhoto.image = UIImage(named: quote.image)
        imgPhotoBg.image = imgPhoto.image
        
        lblQuote.alpha = 0.0
        lblAutor.alpha = 0.0
        imgPhoto.alpha = 0.0
        imgPhotoBg.alpha = 0.0
        LclblTop.constant = 10
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lblQuote.alpha = 1.0
            self.lblAutor.alpha = 1.0
            self.imgPhoto.alpha = 1.0
            self.imgPhotoBg.alpha = 0.25
            self.LclblTop.constant = 10
            self.view.layoutIfNeeded()
        }
        
    }
}






















