//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Christopher Lee on 7/8/18.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    public let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!
}

extension SelectQuestionGroupViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        return cell
    }
}

extension SelectQuestionGroupViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? QuestionViewController else { return }
        viewController.questionGroup = selectedQuestionGroup
        viewController.delegate = self
    }
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionGroup) {
        navigationController?.popToViewController(self, animated: true)
    }
    
    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionGroup, at questionIndex: Int) {
        navigationController?.popToViewController(self, animated: true)
    }
}
