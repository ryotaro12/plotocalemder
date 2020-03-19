//
//  AddViewController.swift
//  testcalemder
//
//  Created by Tsuji Ryotaro on 2020/03/02.
//  Copyright © 2020 Tsuji Ryotaro. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    let weak = ["(日)","(月)","(火)","(水)","(木)","(金)","(土)"]
    var weaknum: Int = 0
    var year: Int = 0
    var month: Int = 0
    var day: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        AddTextField.text = "\(year)年\(month)月\(day)日\(weak[weaknum])の予定を変更する"
        //userDefaultsの参照
        _ = UserDefaults.standard
        //元々値が入っていたら、それを表示させなければならない
        let taskKey = String(day)+String(year)+String(month)
        if UserDefaults.standard.string(forKey: "task1_" + taskKey) != nil{
            TaskField1.text = UserDefaults.standard.string(forKey: "task1_" + taskKey)
        }
        if UserDefaults.standard.string(forKey: "task2_" + taskKey) != nil{
            TaskField2.text = UserDefaults.standard.string(forKey: "task2_" + taskKey)
        }
        if UserDefaults.standard.string(forKey: "task3_" + taskKey) != nil{
            TaskField3.text = UserDefaults.standard.string(forKey: "task3_" + taskKey)
        }
        if UserDefaults.standard.string(forKey: "task4_" + taskKey) != nil{
            TaskField4.text = UserDefaults.standard.string(forKey: "task4_" + taskKey)
        }
        
    }
    @IBOutlet weak var AddTextField: UILabel!
  
    @IBOutlet weak var TaskField1: UITextField!
    @IBOutlet weak var TaskField2: UITextField!
    @IBOutlet weak var TaskField3: UITextField!
    @IBOutlet weak var TaskField4: UITextField!
    
    
    //遷移後の追加するボタン

    @IBAction func changeButton(_ sender: Any) {
        let taskKey = String(day)+String(year)+String(month)
        //userDefaultsの参照
        let userDefaults = UserDefaults.standard
        if TaskField1.text == ""{
            UserDefaults.standard.removeObject(forKey: "task1_" + taskKey)
        }else{
            userDefaults.set(TaskField1.text,forKey: "task1_" + taskKey)
            userDefaults.synchronize()
        }
        
        if TaskField2.text == ""{
            UserDefaults.standard.removeObject(forKey: "task2_" + taskKey)
        }else{
            userDefaults.set(TaskField2.text,forKey: "task2_" + taskKey)
            userDefaults.synchronize()
        }
        if TaskField3.text == ""{
            UserDefaults.standard.removeObject(forKey: "task3_" + taskKey)
        }else{
            userDefaults.set(TaskField3.text,forKey: "task3_" + taskKey)
            userDefaults.synchronize()
        }
        if TaskField4.text == ""{
            UserDefaults.standard.removeObject(forKey: "task4_" + taskKey)
        }else{
            userDefaults.set(TaskField4.text,forKey: "task4_" + taskKey)
            userDefaults.synchronize()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
