/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import Eureka

class EditToDoItemViewController: FormViewController {
  
  var viewModel: ViewModel!
  
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d yyyy, h:mm a"
    return formatter
  }()
  
  // MARK: - Life Cycle
  convenience init(viewModel: ViewModel) {
    self.init()
    self.viewModel = viewModel
    initialize()
  }
 
  override func viewDidLoad() {
    super.viewDidLoad()
    
    form
      +++ Section()
      <<< TextRow() {
        $0.title = "Description"
        $0.placeholder = "e.g. Pick up my laundry"
        $0.value = viewModel.title
        $0.onChange { [unowned self] row in
          self.viewModel.title = row.value
        }
      }
      +++ Section()
      <<< DateTimeRow() {
        $0.dateFormatter = type(of: self).dateFormatter
        $0.title = "Due date"
        $0.value = viewModel.dueDate
        $0.minimumDate = Date()
        $0.onChange { [unowned self] row in
          if let date = row.value {
            self.viewModel.dueDate = date
          }
        }
      }
      <<< PushRow<String>() {
        $0.title = "Repeats"
        $0.value = viewModel.repeatFrequency
        $0.options = viewModel.repeatOptions
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.viewModel.repeatFrequency = value
          }
        }
      }
      +++ Section()
      <<< SegmentedRow<String>() {
        $0.title = "Priority"
        $0.value = viewModel.priority
        $0.options = viewModel.priorityOptions
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.viewModel.priority = value
          }
        }
      }
  }
  
  private func initialize() {
    let deleteButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: .deleteButtonPressed)
    navigationItem.leftBarButtonItem = deleteButton
    
    let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: .saveButtonPressed)
    navigationItem.rightBarButtonItem = saveButton
    
    view.backgroundColor = .white
  }
  
  // MARK: - Actions
  @objc fileprivate func saveButtonPressed(_ sender: UIBarButtonItem) {
      _ = navigationController?.popViewController(animated: true)
  }
  
  @objc fileprivate func deleteButtonPressed(_ sender: UIBarButtonItem) {
   
    // Uncomment these lines
//    let alert = UIAlertController(title: "Delete this item?", message: nil, preferredStyle: .alert)
//    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//    let delete = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
//      self?.viewModel.delete()
//      _ = self?.navigationController?.popViewController(animated: true)
//    }
//    
//    alert.addAction(delete)
//    alert.addAction(cancel)
//    
//    navigationController?.present(alert, animated: true, completion: nil)
    
    // Delete this line
      _ = navigationController?.popViewController(animated: true)
  }
}

// MARK: - Selectors
extension Selector {
  fileprivate static let saveButtonPressed = #selector(EditToDoItemViewController.saveButtonPressed(_:))
  fileprivate static let deleteButtonPressed = #selector(EditToDoItemViewController.deleteButtonPressed(_:))
}
