//
//  SecondViewController.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 21.12.2022.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    var zvukStart = UIButton()
    var audioPlayer: AVAudioPlayer?
    var zvukFrogs = UILabel()
    var value = 1
    var exitValue = 0
    var score = 1

    let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background2"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let fishImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        image.contentMode = .scaleAspectFill
        image.isHidden = true
        image.alpha = 0
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
    
    let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Info", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 30, y: 750, width: 50, height: 50)
        return button
    } ()
    
    let scoreLabel = UILabel()
    
    override func loadView() {        
        super.loadView()
        view.backgroundColor = .black
        title = "Lake #1"
        setupSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        button.addTarget(self, action: #selector(startFishing), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(pushInfo), for: .touchUpInside)
        setupScore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let pathToSound = Bundle.main.path(forResource: "zvukFrogs", ofType: "mp3")!
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
        
    private func setupSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(button)
        view.addSubview(buttonTwo)
        view.addSubview(fishImage)
   }
    
    func setupScore() {
        scoreLabel.frame = CGRect(x: 180, y: 30, width: 250, height: 180)
        scoreLabel.font = .systemFont(ofSize: 45)
        scoreLabel.textColor = .red
        view.addSubview(scoreLabel)
    }
        
    private func addConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        fishImage.translatesAutoresizingMaskIntoConstraints = false
                
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
                
        button.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func pushInfo() {
        let viewController = FourViewController()
        viewController.modalPresentationStyle = .fullScreen
//self.present(viewController, animated: false, completion: nil)
        navigationController?.pushViewController(viewController, animated: true)
        self.soundBumaga()
}
    
    @objc func startFishing() {
        self.dismiss(animated: true, completion: nil)
        let randomImage: Int = Int.random(in: 0...18)
        fishImage.image = UIImage(named: "\(randomImage)")
        fishImage.isHidden = false

        if randomImage < 16 {
            self.updateSum()            
            self.soundStart()
        }
        if randomImage > 16 {
            self.soundBanki()
        }
        UIView.animate(withDuration: 1) {
            self.fishImage.transform = CGAffineTransform(translationX: 0, y: -500)
            self.fishImage.alpha = 1
        }            
        if randomImage == 16 {
             self.updateScore()
             self.soundSirena()
        }
    }
    
    func updateScore() {
        self.dismiss(animated: true, completion: nil)
        let randomImage: Int = 16
        fishImage.image = UIImage(named: "\(randomImage)")
        fishImage.isHidden = false
        
        let alert = UIAlertController(title: "Fish Guard", message: "Game Over", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Go To Jail", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
        scoreLabel.text = String(exitValue)
        value = 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(value, forKey: "value")
    }

    func updateSum() {
        let score = value
        value += 1
        UserDefaults.standard.set(score, forKey: "score")
        scoreLabel.text = String(score)
        }
    
    func soundStart() {
        let pathToSound = Bundle.main.path(forResource: "zvukStart", ofType: "mp3")!
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
    
    func soundBanki() {
        let pathToSound = Bundle.main.path(forResource: "zvukBanki", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            audioPlayer?.volume = 0.5
        }
         catch
        {
             print(error)
        }
    }
    
    func soundSirena() {
        let pathToSound = Bundle.main.path(forResource: "zvukSirena", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            audioPlayer?.volume = 0.4
        }
         catch
        {
             print(error)
        }
    }
    
    func soundBumaga() {
        let pathToSound = Bundle.main.path(forResource: "zvukBumaga", ofType: "mp3")!
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
    
    




    



