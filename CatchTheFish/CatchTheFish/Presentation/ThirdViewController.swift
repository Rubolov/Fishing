//
//  ThirdViewController.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 23.12.2022.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    
    var zvukError = UIButton()
    
        let fishImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        image.contentMode = .scaleAspectFill
        image.isHidden = true
        image.alpha = 0
        return image
    }()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background3"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Fishing", for: .normal)
        button.backgroundColor = .blue
        
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let WorkManImage: UIImageView = {
    let image = UIImageView(image: UIImage(named: "17"))
        image.contentMode = .scaleAspectFill
        image.isHidden = true
        image.alpha = 0
        return image
    }()
    
    var audioPlayer: AVAudioPlayer?
    
//    let buttonTwo: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Info", for: .normal)
//        button.backgroundColor = .red
//        button.tintColor = .white
//        button.layer.cornerRadius = 10
//        button.frame = CGRect(x: 30, y: 750, width: 50, height: 50)
//        return button
//    } ()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .black
        title = "Lake #2"
        setupSubviews()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        button.addTarget(self, action: #selector(startFishing), for: .touchUpInside)
    //  buttonTwo.addTarget(self, action: #selector(pushInfo), for: .touchUpInside)
        
//        guard let nc = navigationController as? NavC else {return}
//        print ("score =", nc.score)
//        nc.score += 1
    }
    
    private func setupSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(button)
//      view.addSubview(buttonTwo)
        view.addSubview(fishImage)
        view.addSubview(WorkManImage)
    }
    
    private func addConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        fishImage.translatesAutoresizingMaskIntoConstraints = false
        WorkManImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            fishImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            fishImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            fishImage.widthAnchor.constraint(equalToConstant: 200),
            fishImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            WorkManImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            WorkManImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            WorkManImage.widthAnchor.constraint(equalToConstant: 200),
            WorkManImage.heightAnchor.constraint(equalToConstant: 200)
        ])
                
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250)
        ])
    }
    
    @objc private func pushInfo() {
        let viewController = FiveViewController()
        viewController.modalPresentationStyle = .fullScreen
//        self.present(viewController, animated: false, completion: nil)
        navigationController?.pushViewController(viewController, animated: true)
}
    
    @objc private func pusgInfo() {
        self.dismiss(animated: true)
    }
    
    @objc private func startFishing() {
    self.dismiss(animated: true)
    let randomImage: Int = Int.random(in: 0...15)
    WorkManImage.image = UIImage(named: "\(20)")
    WorkManImage.isHidden = false
    fishImage.image = UIImage(named: "\(8)")
    fishImage.isHidden = false
        
        let pathToSound = Bundle.main.path(forResource: "zvukError", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
         catch
        {
             print(error)
        }
        
        UIView.animate(withDuration: 1) {
            self.WorkManImage.transform = CGAffineTransform(translationX: 0, y: -500)
            self.WorkManImage.alpha = 1
        }
//    UIView.animate(withDuration: 1) {
//        self.fishImage.transform = CGAffineTransform(translationX: 0, y: -500)
//        self.fishImage.alpha = 1
//    }
    
        if randomImage >= 0 {
        let alert = UIAlertController(title: "WARNING", message: "availability of technical work", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok Go Back", style: .cancel, handler: nil)
            
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
}







