//
//  ViewController.swift
//  testcalemder
//
//  Created by Tsuji Ryotaro on 2020/02/25.
//  Copyright © 2020 Tsuji Ryotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var day: Int = 0



    @IBOutlet weak var NavigationVar: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //userdefaultの設定
        let userDefaults = UserDefaults.standard
        //年と月の参照を行う
        month = userDefaults.integer(forKey: "monthmemory")
        year = userDefaults.integer(forKey: "yearmemory")
        //初回起動時用のデバッグ
        if year == 0{year = 2020}
        if month == 0{month = 1}
       
        //初回起動時の処理
        if userDefaults.string(forKey: "memory") == nil{
            NavigationVar.title = "初めまして"
            userDefaults.set(month,forKey: "monthmemory")
            userDefaults.set(year,forKey: "yearmemory")
        }else{
            NavigationVar.title = userDefaults.string(forKey: "memory")
        }
        for num in 1...31{
            self.gettask(Day: num)
        }
        change_DOTW(year: year, month: month,day: 1)
    }
    //アプリ発使用時に使われる初期値
    var year: Int = 2020
    var month: Int = 1    
    
    //曜日ラベル群
    @IBOutlet weak var DOTW1: UILabel!
    @IBOutlet weak var DOTW2: UILabel!
    @IBOutlet weak var DOTW3: UILabel!
    @IBOutlet weak var DOTW4: UILabel!
    @IBOutlet weak var DOTW5: UILabel!
    @IBOutlet weak var DOTW6: UILabel!
    @IBOutlet weak var DOTW7: UILabel!
    @IBOutlet weak var DOTW8: UILabel!
    @IBOutlet weak var DOTW9: UILabel!
    @IBOutlet weak var DOTW10: UILabel!
    @IBOutlet weak var DOTW11: UILabel!
    @IBOutlet weak var DOTW12: UILabel!
    @IBOutlet weak var DOTW13: UILabel!
    @IBOutlet weak var DOTW14: UILabel!
    @IBOutlet weak var DOTW15: UILabel!
    @IBOutlet weak var DOTW16: UILabel!
    @IBOutlet weak var DOTW17: UILabel!
    @IBOutlet weak var DOTW18: UILabel!
    @IBOutlet weak var DOTW19: UILabel!
    @IBOutlet weak var DOTW20: UILabel!
    @IBOutlet weak var DOTW21: UILabel!
    @IBOutlet weak var DOTW22: UILabel!
    @IBOutlet weak var DOTW23: UILabel!
    @IBOutlet weak var DOTW24: UILabel!
    @IBOutlet weak var DOTW25: UILabel!
    @IBOutlet weak var DOTW26: UILabel!
    @IBOutlet weak var DOTW27: UILabel!
    @IBOutlet weak var DOTW28: UILabel!
    @IBOutlet weak var DOTW29: UILabel!
    @IBOutlet weak var DOTW30: UILabel!
    @IBOutlet weak var DOTW31: UILabel!
    
    //進むボタンについて
    @IBAction func NextButton(_ sender: Any) {
    //userDefaultsの参照
        let userDefaults = UserDefaults.standard
            
        //年と月の参照を行う
        month = userDefaults.integer(forKey: "monthmemory")
        year = userDefaults.integer(forKey: "yearmemory")
        
        
        //初回起動時のバグ回避用
        if year == 0{
            year = 2020
            month = 0
        }
        //年と月の加減算を行う
        month = month + 1
        if month == 13{
            month = 1
            year = year + 1
            //"yearmemory"というキーで保存を行う
            userDefaults.set(year,forKey: "yearmemory")
        }
        //一時保存用の変数を作成
        let cashmemory:String = "\(year)年\(month)月"
        //"monthmemory"というキーで保存を行う
        userDefaults.set(month,forKey: "monthmemory")
        userDefaults.set(cashmemory,forKey: "memory")
        //userdefaultへの保存を明示的に行う
        userDefaults.synchronize()
        //ナビゲーションバーのタイトルの変更
        NavigationVar.title = cashmemory
        for num in 1...31{gettask(Day: num)}
        
        change_DOTW(year: year, month: month,day: 1)
        
    }
        
    //戻るボタンについて
    @IBAction func BackButton(_ sender: Any) {
        //userDefaultsの参照
        let userDefaults = UserDefaults.standard
               
        //年と月の参照を行う
        month = userDefaults.integer(forKey: "monthmemory")
        year = userDefaults.integer(forKey: "yearmemory")
        
        
        //初回起動時のバグ回避用
        if year == 0{
            year = 2020
            month = 2
        }
        //年と月の加減算を行う
        month = month - 1
        if month == 0{
            month = 12
            year = year - 1
            //"yearmemory"というキーで保存を行う
            userDefaults.set(year,forKey: "yearmemory")
        }
        //一時保存用の変数を作成
        let cashmemory:String = "\(year)年\(month)月"
               
        //"monthmemory"というキーで保存を行う
        userDefaults.set(month,forKey: "monthmemory")
        userDefaults.set(cashmemory,forKey: "memory")
        //userdefaultへの保存を明示的に行う
        userDefaults.synchronize()
        //ナビゲーションバーのタイトルの変更
        NavigationVar.title = cashmemory
        for num in 1...31{gettask(Day: num)}
        
        change_DOTW(year: year, month: month,day: 1)
        
        
    }
    
    //1日目のタスクを関連づける
    @IBOutlet weak var task1_1: UILabel!
    @IBOutlet weak var task2_1: UILabel!
    @IBOutlet weak var task3_1: UILabel!
    @IBOutlet weak var task4_1: UILabel!
    //2日目のタスクを関連づける
    @IBOutlet weak var task1_2: UILabel!
    @IBOutlet weak var task2_2: UILabel!
    @IBOutlet weak var task3_2: UILabel!
    @IBOutlet weak var task4_2: UILabel!
    //3日目のタスクを関連づける
    @IBOutlet weak var task1_3: UILabel!
    @IBOutlet weak var task2_3: UILabel!
    @IBOutlet weak var task3_3: UILabel!
    @IBOutlet weak var task4_3: UILabel!
    //4日目のタスクを関連づける
    @IBOutlet weak var task1_4: UILabel!
    @IBOutlet weak var task2_4: UILabel!
    @IBOutlet weak var task3_4: UILabel!
    @IBOutlet weak var task4_4: UILabel!
    //5日目のタスクを関連づける
    @IBOutlet weak var task1_5: UILabel!
    @IBOutlet weak var task2_5: UILabel!
    @IBOutlet weak var task3_5: UILabel!
    @IBOutlet weak var task4_5: UILabel!
    //6日目のタスクを関連づける
    @IBOutlet weak var task1_6: UILabel!
    @IBOutlet weak var task2_6: UILabel!
    @IBOutlet weak var task3_6: UILabel!
    @IBOutlet weak var task4_6: UILabel!
    //7日目のタスクを関連づける
    @IBOutlet weak var task1_7: UILabel!
    @IBOutlet weak var task2_7: UILabel!
    @IBOutlet weak var task3_7: UILabel!
    @IBOutlet weak var task4_7: UILabel!
    //8日目のタスクを関連づける
    @IBOutlet weak var task1_8: UILabel!
    @IBOutlet weak var task2_8: UILabel!
    @IBOutlet weak var task3_8: UILabel!
    @IBOutlet weak var task4_8: UILabel!
    //9日目のタスクを関連づける
    @IBOutlet weak var task1_9: UILabel!
    @IBOutlet weak var task2_9: UILabel!
    @IBOutlet weak var task3_9: UILabel!
    @IBOutlet weak var task4_9: UILabel!
    //10日目のタスクを関連づける
    @IBOutlet weak var task1_10: UILabel!
    @IBOutlet weak var task2_10: UILabel!
    @IBOutlet weak var task3_10: UILabel!
    @IBOutlet weak var task4_10: UILabel!
    //11日目のタスクを関連づける
    @IBOutlet weak var task1_11: UILabel!
    @IBOutlet weak var task2_11: UILabel!
    @IBOutlet weak var task3_11: UILabel!
    @IBOutlet weak var task4_11: UILabel!
    //12日目のタスクを関連づける
    @IBOutlet weak var task1_12: UILabel!
    @IBOutlet weak var task2_12: UILabel!
    @IBOutlet weak var task3_12: UILabel!
    @IBOutlet weak var task4_12: UILabel!
    //13日目のタスクを関連づける
    @IBOutlet weak var task1_13: UILabel!
    @IBOutlet weak var task2_13: UILabel!
    @IBOutlet weak var task3_13: UILabel!
    @IBOutlet weak var task4_13: UILabel!
    //14日目のタスクを関連づける
    @IBOutlet weak var task1_14: UILabel!
    @IBOutlet weak var task2_14: UILabel!
    @IBOutlet weak var task3_14: UILabel!
    @IBOutlet weak var task4_14: UILabel!
    //15日目のタスクを関連づける
    @IBOutlet weak var task1_15: UILabel!
    @IBOutlet weak var task2_15: UILabel!
    @IBOutlet weak var task3_15: UILabel!
    @IBOutlet weak var task4_15: UILabel!
    //16日目のタスクを関連づける
    @IBOutlet weak var task1_16: UILabel!
    @IBOutlet weak var task2_16: UILabel!
    @IBOutlet weak var task3_16: UILabel!
    @IBOutlet weak var task4_16: UILabel!
    //17日目のタスクを関連づける
    @IBOutlet weak var task1_17: UILabel!
    @IBOutlet weak var task2_17: UILabel!
    @IBOutlet weak var task3_17: UILabel!
    @IBOutlet weak var task4_17: UILabel!
    //18日目のタスクを関連づける
    @IBOutlet weak var task1_18: UILabel!
    @IBOutlet weak var task2_18: UILabel!
    @IBOutlet weak var task3_18: UILabel!
    @IBOutlet weak var task4_18: UILabel!
    //19日目のタスクを関連づける
    @IBOutlet weak var task1_19: UILabel!
    @IBOutlet weak var task2_19: UILabel!
    @IBOutlet weak var task3_19: UILabel!
    @IBOutlet weak var task4_19: UILabel!
    //20日目のタスクを関連づける
    @IBOutlet weak var task1_20: UILabel!
    @IBOutlet weak var task2_20: UILabel!
    @IBOutlet weak var task3_20: UILabel!
    @IBOutlet weak var task4_20: UILabel!
    //21日目のタスクを関連づける
    @IBOutlet weak var task1_21: UILabel!
    @IBOutlet weak var task2_21: UILabel!
    @IBOutlet weak var task3_21: UILabel!
    @IBOutlet weak var task4_21: UILabel!
    //22日目のタスクを関連づける
    @IBOutlet weak var task1_22: UILabel!
    @IBOutlet weak var task2_22: UILabel!
    @IBOutlet weak var task3_22: UILabel!
    @IBOutlet weak var task4_22: UILabel!
    //23日目のタスクを関連づける
    @IBOutlet weak var task1_23: UILabel!
    @IBOutlet weak var task2_23: UILabel!
    @IBOutlet weak var task3_23: UILabel!
    @IBOutlet weak var task4_23: UILabel!
    //24日目のタスクを関連づける
    @IBOutlet weak var task1_24: UILabel!
    @IBOutlet weak var task2_24: UILabel!
    @IBOutlet weak var task3_24: UILabel!
    @IBOutlet weak var task4_24: UILabel!
    //25日目のタスクを関連づける
    @IBOutlet weak var task1_25: UILabel!
    @IBOutlet weak var task2_25: UILabel!
    @IBOutlet weak var task3_25: UILabel!
    @IBOutlet weak var task4_25: UILabel!
    //26日目のタスクを関連づける
    @IBOutlet weak var task1_26: UILabel!
    @IBOutlet weak var task2_26: UILabel!
    @IBOutlet weak var task3_26: UILabel!
    @IBOutlet weak var task4_26: UILabel!
    //27日目のタスクを関連づける
    @IBOutlet weak var task1_27: UILabel!
    @IBOutlet weak var task2_27: UILabel!
    @IBOutlet weak var task3_27: UILabel!
    @IBOutlet weak var task4_27: UILabel!
    //28日目のタスクを関連づける
    @IBOutlet weak var task1_28: UILabel!
    @IBOutlet weak var task2_28: UILabel!
    @IBOutlet weak var task3_28: UILabel!
    @IBOutlet weak var task4_28: UILabel!
    //29日目のタスクを関連づける
    @IBOutlet weak var task1_29: UILabel!
    @IBOutlet weak var task2_29: UILabel!
    @IBOutlet weak var task3_29: UILabel!
    @IBOutlet weak var task4_29: UILabel!
    //30日目のタスクを関連づける
    @IBOutlet weak var task1_30: UILabel!
    @IBOutlet weak var task2_30: UILabel!
    @IBOutlet weak var task3_30: UILabel!
    @IBOutlet weak var task4_30: UILabel!
    //31日目のタスクを関連づける
    @IBOutlet weak var task1_31: UILabel!
    @IBOutlet weak var task2_31: UILabel!
    @IBOutlet weak var task3_31: UILabel!
    @IBOutlet weak var task4_31: UILabel!
    
    
    
    
    
    
    //タスク取得用関数
    func gettask(Day: Int){
        //userDefaultsの参照
        let userDefaults = UserDefaults.standard
        //年と月の参照を行う
        month = userDefaults.integer(forKey: "monthmemory")
        year = userDefaults.integer(forKey: "yearmemory")
        if year == 0{
            year = 2020
            month = 1
        }
        //switch文の変数作成
        let day = Day
        switch day {
            //1日目のタスクを確認
            case 1:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_1.text = nil
                }else{
                    task1_1.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_1.text = nil
                }else{
                    task2_1.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_1.text = nil
                }else{
                    task3_1.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_1.text = nil
                }else{
                    task4_1.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                    }
            case 2:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_2.text = nil
                }else{
                    task1_2.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_2.text = nil
                }else{
                    task2_2.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_2.text = nil
                }else{
                    task3_2.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_2.text = nil
                }else{
                    task4_2.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 3:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_3.text = nil
                }else{
                    task1_3.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_3.text = nil
                }else{
                    task2_3.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_3.text = nil
                }else{
                    task3_3.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_3.text = nil
                }else{
                    task4_3.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 4:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_4.text = nil
                }else{
                    task1_4.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_4.text = nil
                }else{
                    task2_4.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_4.text = nil
                }else{
                    task3_4.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_4.text = nil
                }else{
                    task4_4.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 5:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_5.text = nil
                }else{
                    task1_5.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_5.text = nil
                }else{
                    task2_5.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_5.text = nil
                }else{
                    task3_5.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_5.text = nil
                }else{
                    task4_5.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 6:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_6.text = nil
                }else{
                    task1_6.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_6.text = nil
                }else{
                    task2_6.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_6.text = nil
                }else{
                    task3_6.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_6.text = nil
                }else{
                    task4_6.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 7:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_7.text = nil
                }else{
                    task1_7.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_7.text = nil
                }else{
                    task2_7.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_7.text = nil
                }else{
                    task3_7.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_7.text = nil
                }else{
                    task4_7.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 8:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_8.text = nil
                }else{
                    task1_8.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_8.text = nil
                }else{
                    task2_8.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_8.text = nil
                }else{
                    task3_8.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_8.text = nil
                }else{
                    task4_8.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 9:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_9.text = nil
                }else{
                    task1_9.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_9.text = nil
                }else{
                    task2_9.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_9.text = nil
                }else{
                    task3_9.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_9.text = nil
                }else{
                    task4_9.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 10:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_10.text = nil
                }else{
                    task1_10.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_10.text = nil
                }else{
                    task2_10.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_10.text = nil
                }else{
                    task3_10.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_10.text = nil
                }else{
                    task4_10.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 11:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_11.text = nil
                }else{
                    task1_11.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_11.text = nil
                }else{
                    task2_11.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_11.text = nil
                }else{
                    task3_11.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_11.text = nil
                }else{
                    task4_11.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 12:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_12.text = nil
                }else{
                    task1_12.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_12.text = nil
                }else{
                    task2_12.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_12.text = nil
                }else{
                    task3_12.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_12.text = nil
                }else{
                    task4_12.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 13:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_13.text = nil
                }else{
                    task1_13.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_13.text = nil
                }else{
                    task2_13.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_13.text = nil
                }else{
                    task3_13.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_13.text = nil
                }else{
                    task4_13.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 14:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_14.text = nil
                }else{
                    task1_14.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_14.text = nil
                }else{
                    task2_14.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_14.text = nil
                }else{
                    task3_14.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_14.text = nil
                }else{
                    task4_14.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 15:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_15.text = nil
                }else{
                    task1_15.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_15.text = nil
                }else{
                    task2_15.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_15.text = nil
                }else{
                    task3_15.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_15.text = nil
                }else{
                    task4_15.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 16:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_16.text = nil
                }else{
                    task1_16.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_16.text = nil
                }else{
                    task2_16.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_16.text = nil
                }else{
                    task3_16.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_16.text = nil
                }else{
                    task4_16.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 17:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_17.text = nil
                }else{
                    task1_17.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_17.text = nil
                }else{
                    task2_17.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_17.text = nil
                }else{
                    task3_17.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_17.text = nil
                }else{
                    task4_17.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 18:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_18.text = nil
                }else{
                    task1_18.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_18.text = nil
                }else{
                    task2_18.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_18.text = nil
                }else{
                    task3_18.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_18.text = nil
                }else{
                    task4_18.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 19:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_19.text = nil
                }else{
                    task1_19.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_19.text = nil
                }else{
                    task2_19.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_19.text = nil
                }else{
                    task3_19.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_19.text = nil
                }else{
                    task4_19.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 20:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_20.text = nil
                }else{
                    task1_20.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_20.text = nil
                }else{
                    task2_20.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_20.text = nil
                }else{
                    task3_20.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_20.text = nil
                }else{
                    task4_20.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 21:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_21.text = nil
                }else{
                    task1_21.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_21.text = nil
                }else{
                    task2_21.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_21.text = nil
                }else{
                    task3_21.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_21.text = nil
                }else{
                    task4_21.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 22:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_22.text = nil
                }else{
                    task1_22.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_22.text = nil
                }else{
                    task2_22.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_22.text = nil
                }else{
                    task3_22.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_22.text = nil
                }else{
                    task4_22.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 23:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_23.text = nil
                }else{
                    task1_23.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_23.text = nil
                }else{
                    task2_23.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_23.text = nil
                }else{
                    task3_23.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_23.text = nil
                }else{
                    task4_23.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 24:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_24.text = nil
                }else{
                    task1_24.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_24.text = nil
                }else{
                    task2_24.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_24.text = nil
                }else{
                    task3_24.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_24.text = nil
                }else{
                    task4_24.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 25:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_25.text = nil
                }else{
                    task1_25.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_25.text = nil
                }else{
                    task2_25.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_25.text = nil
                }else{
                    task3_25.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_25.text = nil
                }else{
                    task4_25.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 26:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_26.text = nil
                }else{
                    task1_26.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_26.text = nil
                }else{
                    task2_26.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_26.text = nil
                }else{
                    task3_26.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_26.text = nil
                }else{
                    task4_26.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 27:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_27.text = nil
                }else{
                    task1_27.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_27.text = nil
                }else{
                    task2_27.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_27.text = nil
                }else{
                    task3_27.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_27.text = nil
                }else{
                    task4_27.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 28:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_28.text = nil
                }else{
                    task1_28.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_28.text = nil
                }else{
                    task2_28.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_28.text = nil
                }else{
                    task3_28.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_28.text = nil
                }else{
                    task4_28.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 29:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_29.text = nil
                }else{
                    task1_29.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_29.text = nil
                }else{
                    task2_29.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_29.text = nil
                }else{
                    task3_29.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_29.text = nil
                }else{
                    task4_29.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 30:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_30.text = nil
                }else{
                    task1_30.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_30.text = nil
                }else{
                    task2_30.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_30.text = nil
                }else{
                    task3_30.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_30.text = nil
                }else{
                    task4_30.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            case 31:
                if userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month)) == nil{
                    task1_31.text = nil
                }else{
                    task1_31.text = userDefaults.string(forKey: "task1_" + String(day) + String(year) + String(month))
                }
                if userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month)) == nil{
                    task2_31.text = nil
                }else{
                    task2_31.text = userDefaults.string(forKey: "task2_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month)) == nil{
                    task3_31.text = nil
                }else{
                    task3_31.text = userDefaults.string(forKey: "task3_" + String(day) + String(year) + String(month))
                    }
                if userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month)) == nil{
                    task4_31.text = nil
                }else{
                    task4_31.text = userDefaults.string(forKey: "task4_" + String(day) + String(year) + String(month))
                }
            default:
                break
        }
    }
    //曜日を変更させる関数
    func change_DOTW(year: Int, month: Int, day:Int){
        let weak = ["(日)","(月)","(火)","(水)","(木)","(金)","(土)"]
        
        var m = month
        var y = year
        let d = day
        if(m < 3){y = y - 1
            m = m + 12}
        //チェラーの公式で曜日を計算する
        var DOTW_num =  (31+28+365*(y-1)+1+Int(y/4)-Int(y/100)+Int(y/400) + Int(306*(m+1)/10)-122 + (d-1)) % 7
        //曜日を取得して変更していく
        //初めの日が日曜なら赤字に変える
        DOTW1.text = weak[DOTW_num]
        if DOTW_num == 0{DOTW1.textColor = UIColor.red}
        else{DOTW1.textColor = UIColor.black}
        
        //土曜なら翌日が配列からはみ出るので、変数を0にして、赤字に変更する
        if DOTW_num == 6{DOTW_num = 0
            DOTW2.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW2.textColor = UIColor.black}
        DOTW2.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW3.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW3.textColor = UIColor.black}
        DOTW3.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW4.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW4.textColor = UIColor.black}
        DOTW4.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW5.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW5.textColor = UIColor.black}
        DOTW5.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW6.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW6.textColor = UIColor.black}
        DOTW6.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW7.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW7.textColor = UIColor.black}
        DOTW7.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW8.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW8.textColor = UIColor.black}
        DOTW8.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW9.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW9.textColor = UIColor.black}
        DOTW9.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW10.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW10.textColor = UIColor.black}
        DOTW10.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW11.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW11.textColor = UIColor.black}
        DOTW11.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW12.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW12.textColor = UIColor.black}
        DOTW12.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW13.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW13.textColor = UIColor.black}
        DOTW13.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW14.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW14.textColor = UIColor.black}
        DOTW14.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW15.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW15.textColor = UIColor.black}
        DOTW15.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW16.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW16.textColor = UIColor.black}
        DOTW16.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW17.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW17.textColor = UIColor.black}
        DOTW17.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW18.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW18.textColor = UIColor.black}
        DOTW18.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW19.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW19.textColor = UIColor.black}
        DOTW19.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW20.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW20.textColor = UIColor.black}
        DOTW20.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW21.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW21.textColor = UIColor.black}
        DOTW21.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW22.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW22.textColor = UIColor.black}
        DOTW22.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW23.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW23.textColor = UIColor.black}
        DOTW23.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW24.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW24.textColor = UIColor.black}
        DOTW24.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW25.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW25.textColor = UIColor.black}
        DOTW25.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW26.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW26.textColor = UIColor.black}
        DOTW26.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW27.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW27.textColor = UIColor.black}
        DOTW27.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW28.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW28.textColor = UIColor.black}
        DOTW28.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW29.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW29.textColor = UIColor.black}
        DOTW29.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW30.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW30.textColor = UIColor.black}
        DOTW30.text = weak[DOTW_num]
        
        if DOTW_num == 6{DOTW_num = 0
            DOTW31.textColor = UIColor.red}
        else{DOTW_num = DOTW_num + 1
            DOTW31.textColor = UIColor.black}
        DOTW31.text = weak[DOTW_num]

    }
    @IBAction func reset(_ segue: UIStoryboardSegue) {
        for num in 1...31{gettask(Day: num)}
    }
    //画面遷移時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //AddViewControllerを呼び出す
        let addView = segue.destination as! AddViewController
        let userDefaults = UserDefaults.standard
               
        //年と月の参照を行う
        month = userDefaults.integer(forKey: "monthmemory")
        addView.month = month
        
        year = userDefaults.integer(forKey: "yearmemory")
        addView.year = year
        
        //タスク追加ボタンによって変わる変数を持っていく
        addView.day = day
        
        if(month < 3){year = year - 1
            month = month + 12}
        //チェラーの公式で曜日を計算する
        let DOTW_num =  (31+28+365*(year-1)+1+Int(year/4)-Int(year/100)+Int(year/400) + Int(306*(month+1)/10)-122 + (day-1)) % 7
        addView.weaknum = DOTW_num
        }
    //タスク追加ボタン
    @IBAction func button1(_ sender: Any) {day = 1}
    @IBAction func button2(_ sender: Any) {day = 2}
    @IBAction func button3(_ sender: Any) {day = 3}
    @IBAction func button4(_ sender: Any) {day = 4}
    @IBAction func button5(_ sender: Any) {day = 5}
    @IBAction func button6(_ sender: Any) {day = 6}
    @IBAction func button7(_ sender: Any) {day = 7}
    @IBAction func button8(_ sender: Any) {day = 8}
    @IBAction func button9(_ sender: Any) {day = 9}
    @IBAction func button10(_ sender: Any) {day = 10}
    @IBAction func button11(_ sender: Any) {day = 11}
    @IBAction func button12(_ sender: Any) {day = 12}
    @IBAction func button13(_ sender: Any) {day = 13}
    @IBAction func button14(_ sender: Any) {day = 14}
    @IBAction func button15(_ sender: Any) {day = 15}
    @IBAction func button16(_ sender: Any) {day = 16}
    @IBAction func button17(_ sender: Any) {day = 17}
    @IBAction func button18(_ sender: Any) {day = 18}
    @IBAction func button19(_ sender: Any) {day = 19}
    @IBAction func button20(_ sender: Any) {day = 20}
    @IBAction func button21(_ sender: Any) {day = 21}
    @IBAction func button22(_ sender: Any) {day = 22}
    @IBAction func button23(_ sender: Any) {day = 23}
    @IBAction func button24(_ sender: Any) {day = 24}
    @IBAction func button25(_ sender: Any) {day = 25}
    @IBAction func button26(_ sender: Any) {day = 26}
    @IBAction func button27(_ sender: Any) {day = 27}
    @IBAction func button28(_ sender: Any) {day = 28}
    @IBAction func button29(_ sender: Any) {day = 29}
    @IBAction func button30(_ sender: Any) {day = 30}
    @IBAction func button31(_ sender: Any) {day = 31}
    
    
    
}

