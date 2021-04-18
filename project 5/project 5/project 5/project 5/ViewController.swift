//
//  ViewController.swift
//  project 5
//
//  Created by Павел on 15.03.2021.
//  Copyright © 2021 Павел. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
var allWords = [String] ()
var usedWords = [String] ()


override func viewDidLoad() {
    super.viewDidLoad()
    // MARK: create a navigation button to the right
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(restartGame))
    
    
    // MARK: We are use Bundle method to be find file which name = name and format = .txt and if me search this file we return start.txt another nil
    if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
      // this method makes to be check startWordsURL on nil
        // метод try? говорит о том что если вызвать этот код, и если он выдаст ошибку то просто отправте мне nil
        if let startWords = try? String(contentsOf: startWordsURL) {
           // we are sort array words and транспортируем матрицу в array string
            allWords = startWords.components(separatedBy: "\n")
        }
    }
    // this method needs for work my programm. if my get array is empty this method will output to the console words something like that -  allWords = ["silkworm"]
    if allWords.isEmpty {
        allWords = ["silkworm"]
    }
    startGame()
    
}
// MARK: create a game
func startGame () {
    title = allWords.randomElement() // выводит на титульный контроллер названия слова из полученного файла
    usedWords.removeAll(keepingCapacity: true) //  это удаляет все слова который ввел пользватель, сохраняя объем
    tableView.reloadData() // данная строка вызывает метод reloadData() метод tableview. Это табличное представление дается нам как свойство потому что на ViewController исходит из UITableViewController. Вызов reloadData() вызывает заново cellForRowAt и numberOfRowsInSection
}
// MARK: create a tablecell
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return usedWords.count
}
    //MARK: create a cell in tableView
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
    cell.textLabel?.text = usedWords[indexPath.row]
    return cell
}
@objc func promptForAnswer () {
    let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
    ac.addTextField () // добавление TextField в AlertController
    let submitAction = UIAlertAction(title: "Submit", style: .default) { // add button in alertController
        [weak self, weak ac] _ in // замыкания могут использовать их, го не создает сильный ссылочный цикл
        guard let answer = ac?.textFields?[0].text else {return}
        self?.submit(answer)
    }
    ac.addAction(submitAction)
    present(ac, animated: true)
}
@objc func restartGame () {
    startGame()
}

        
func submit (_ answer: String)  {
    let lowerAnswer = answer.lowercased()
    
    guard isPossible(word: lowerAnswer) else {
         showErrorMessage(errortitle: "Word not recognized", erorMessage: "You can't just make them up,you know")
        return
    }
    guard isOriginal(word: lowerAnswer) else {
         showErrorMessage(errortitle: "Word already used ", erorMessage: "Be more orginal")
        return
    }
    guard isReal(word: lowerAnswer) else {
        guard let title = title else {return}
         showErrorMessage(errortitle: "Word not possible", erorMessage: "You can't spell that word from \(title.lowercased())")
        return
    }

    guard  answer.count >= 4 else { showErrorMessage(errortitle: "Minimum count characters", erorMessage: "Be more original!")
    return
    }
    usedWords.insert(answer.lowercased(), at: 0)
    let indexPath = IndexPath(row: 0, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
                

}
func isPossible (word: String) -> Bool {
    guard  var tempWord = title?.lowercased()  else {return false}
    for letter in word {
        if let position = tempWord.firstIndex(of: letter) {
            tempWord.remove(at: position) // удаляет букву как я понял
        } else {
            return false
        }
    }
    return true
}
func isOriginal (word: String) -> Bool {
    return !usedWords.contains(word) // проверяет, имеется ли данный метод в массиве
    
}
func isReal (word: String) -> Bool {
    let checker = UITextChecker () // проверяет орфографию того или иного языка
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspeledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    return misspeledRange.location == NSNotFound
}
    func showErrorMessage(errortitle: String, erorMessage: String) {
    let ac = UIAlertController(title: errortitle, message: erorMessage, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default))
    present(ac, animated: true)
}

}
