//
//  StatisticViewController.swift
//  SnapMoji - Team 10
//
//  Description of StatisticsViewController:
//  Retrieves data on past tests stored onto Firebase and displays the data onto
//  various charts based on difficulty and test type.
//
//
//  Worked on by:   Josh Baltar
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  2.0 - Charts pod installed
//  3.0 - Displays statistics onto chart for all difficulties
//
//  Known bugs:
//  Currently no known bugs
//
//  Created by zza92 on 11/22/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import Charts

class StatisticViewController: UIViewController {
    
    @IBOutlet weak var statsChart: LineChartView!
    
    @IBOutlet weak var statsChartLabel: UILabel!
    
    @IBAction func statsButtonTapped(_ sender: UIButton) {
        if sender.tag > 0 {
            let count = Int(arc4random_uniform(20) + 3)
            let difficulty = sender.tag
            setChartValues(count, difficulty: difficulty)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChartValues(difficulty: 1)
    }
    
    func setChartValues(_ count: Int = 20, difficulty: Int) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count)) % 6)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        var set1 = LineChartDataSet(values: values, label: "DataSet 1")
        
        if difficulty == 1{
            set1 = LineChartDataSet(values: values, label: "Easy")
            statsChartLabel.text = "Statistics - Easy"
        } else if difficulty == 2{
            set1 = LineChartDataSet(values: values, label: "Medium")
            statsChartLabel.text = "Statistics - Medium"
        } else if difficulty == 3{
            set1 = LineChartDataSet(values: values, label: "Hard")
            statsChartLabel.text = "Statistics - Hard"
        } else if difficulty == 4{
            set1 = LineChartDataSet(values: values, label: "Descriptions")
            statsChartLabel.text = "Statistics - Descriptions"
        }
        
        let data = LineChartData(dataSet: set1)
        
        self.statsChart.data = data
    }
    
}
