//
//  InfoViewController.swift
//  Hona
//
//  Created by ghanima on 10/24/20.
//  Copyright © 2020 ghanima. All rights reserved.
//
import Charts
import UIKit

class InfoViewController: UIViewController, ChartViewDelegate {
   
    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       barChart.delegate = self
        
        view.backgroundColor = .white
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width)
        barChart.center = view.center
        
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x),
                                          y: Double(x)))
        
        }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.pastel()
        
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }

}
