//
//  ViewController.swift
//  MyRightOnTarget
//
//  Created by Екатерина Иванова on 08.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //Обязательно использовать опционалы, в ином случае приложение упадет при запуске -> тк отсутствует значения у аутлетов
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    ///загаданное число
    var number: Int = 0
    ///раунд
    var round: Int = 0
    //сумма очков
    var points: Int = 0
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        //генерируем случайное число
        self.number = Int.random(in: 1...50)
        //устанавливаем счетчит раундов на 1
        self.round = 1
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
//        //создадим метку для вывода номера версии
//        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
//        //CGRect описывает сущность прямоугольник
//        //изменяем текст метки
//        versionLabel.text = "Version 1.1"
//        //добавляем метку в родительский view
//        self.view.addSubview(versionLabel)
//        //addSubview метод добавляет новую метку в дочернем вью (subview)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBAction func showNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func checkNumber() {
        //        //если игра только начилась
        //        if self.round == 0 {
        //            //передаем значение случайного числа в label
        //            self.label.text = String(self.number)
        //        } else {
        //получаем значение на слайдере
        let numSlider = Int(self.slider.value.rounded())
        //сравниваем значением с загаданным
        // и подсчитываем очки
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
        print("Points - \(self.points)")
        if self.round == 5 {
            //выводим информационное окно с результатами игры
            let alert = UIAlertController (
                title: "Game is over",
                message: "You gain \(self.points) очков",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                title: "Rerun",
                style: .default,
                handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        //генерируем случайное число
        self.number = Int.random(in: 1...50)
        //передаем значение случайного числа в label
        self.label.text = String(self.number)
    }
}



