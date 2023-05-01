//
//  ViewController.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 21.12.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background1"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GoToLake #1", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GoToLake #2", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    var zvukShagov = UIButton()
    var zvukLes = UILabel()
    let viewTitle = UILabel()
    let label = UILabel()
    let bestScoreLabel = UILabel()
    var hightScoreLabel = UILabel()
    var value = 0
        
    let logo:  UIImageView = {
    let imageLogo = UIImageView(image: UIImage(named: "logo"))
        imageLogo.backgroundColor = .clear
        
        return imageLogo
    }()
    
    var audioPlayer: AVAudioPlayer?
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .blue
        setupSubviews()
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        addConstraints()
        buttonOne.addTarget(self, action: #selector(pushOne), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(pushTwo), for: .touchUpInside)
        setupLabel()
        setupLogo()
        setupBestscore()


        viewTitle.alpha = 1
        label.alpha = 1
        logo.alpha = 0
        
        UIImageView.animate(withDuration: 5) {
            self.logo.alpha = 1
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let pathToSound = Bundle.main.path(forResource: "zvukLes", ofType: "mp3")!
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
        
        if value < UserDefaults.standard.integer(forKey: "value") {
        value = UserDefaults.standard.integer(forKey: "score")
        }
        setupHightscore()
    }
    
  
    func setupLogo() {
        logo.frame = CGRect(x: 120, y: 20, width: 150, height: 100)
        view.addSubview(logo)
    }
}

    extension ViewController {
        private func setupSubviews() {
            view.addSubview(backgroundImage)
            view.addSubview(buttonOne)
            view.addSubview(buttonTwo)
            view.addSubview(logo)
            view.addSubview(bestScoreLabel)
            view.addSubview(hightScoreLabel)
        }
        
        func setupLabel() {
            viewTitle.text = "Change Lake"
            viewTitle.frame = CGRect(x: 120, y: 50, width: 250, height: 80)
            viewTitle.textColor =  .cyan
            viewTitle.font = .systemFont(ofSize: 25)
            viewTitle.font = UIFont(name: "RubikBubbles-Regular", size: 25)
            
            label.frame = CGRect(x: -150, y: 400, width: 150, height: 80)
            label.textColor = .black
            label.font = .systemFont(ofSize: 45)
            
            view.addSubview(viewTitle)
            view.addSubview(label)
        }
//            let pathToSound = Bundle.main.path(forResource: "zvukLes", ofType: "mp3")!
//            let url = URL(fileURLWithPath: pathToSound)
//            do
//            {
//                audioPlayer = try AVAudioPlayer(contentsOf: url)
//                audioPlayer?.play()
//            }
//             catch
//            {
//                 print(error)
//            }
//        }
        
        func setupBestscore() {
            bestScoreLabel.frame = CGRect(x: 100, y: 40, width: 150, height: 80)
            bestScoreLabel.font = .systemFont(ofSize: 25)
            bestScoreLabel.textColor = .red
            bestScoreLabel.text = "Best Score:"
            bestScoreLabel.font = UIFont(name: "EastSeaDokdo-Regular", size: 45)
            view.addSubview(bestScoreLabel)
        }
        
        func setupHightscore() {
            hightScoreLabel.frame = CGRect(x: 50, y: 530, width: 250, height: 180)
            hightScoreLabel.font = .systemFont(ofSize: 75)
            hightScoreLabel.textColor = .red
            hightScoreLabel.text = String(value)
            view.addSubview(hightScoreLabel)
        }
               
        private func addConstraints() {
            backgroundImage.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate([
                backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
       
            buttonOne.translatesAutoresizingMaskIntoConstraints = false
            buttonTwo.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                buttonOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                buttonOne.widthAnchor.constraint(equalToConstant: 100),
            ])
            NSLayoutConstraint.activate([
                buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                buttonTwo.widthAnchor.constraint(equalToConstant: 100),
                buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 20)
            ])
            
            logo.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                
                logo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                logo.bottomAnchor.constraint(equalTo: buttonOne.topAnchor, constant: -10),
                logo.widthAnchor.constraint(equalToConstant: 150),
                logo.heightAnchor.constraint(equalToConstant: 150)                
               ])
            
            bestScoreLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                bestScoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
                bestScoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                bestScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
                bestScoreLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
               ])
            
            hightScoreLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            hightScoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            hightScoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            hightScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            hightScoreLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
            ])
       }
        
            @objc private func pushOne() {
                
                let viewController = SecondViewController()
                viewController.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(viewController, animated: true)
                let pathToSound = Bundle.main.path(forResource: "zvukShagov", ofType: "mp3")!
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
                }
    
            @objc private func pushTwo() {
                let viewController = ThirdViewController()
                viewController.modalPresentationStyle = .fullScreen
//self.present(viewController, animated: false, completion: nil)
                navigationController?.pushViewController(viewController, animated: true)
                let pathToSound = Bundle.main.path(forResource: "zvukShagov", ofType: "mp3")!
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
        }
        
    }


