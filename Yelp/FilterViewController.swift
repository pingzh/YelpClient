//
//  FilterViewController.swift
//  Yelp
//
//  Created by Ping Zhang on 10/31/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let HeaderViewIdentifier = "TableViewHeaderView"
    
    var sectionSelected: [Bool] = []
    
    
    @IBAction func cancelButtonAction(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._setupTableView()
        self.sectionSelected = [Bool] (count: FilterSection.filters.count, repeatedValue: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
/**** UITableView ****/
    func _setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return FilterSection.filters.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._getNumberOfSection(section)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(HeaderViewIdentifier)! as UITableViewHeaderFooterView
        header.textLabel!.text = FilterSection.filters[section].header
        header.contentView.backgroundColor = UIColor.lightGrayColor()
        return header
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if FilterSection.filters[section].header == "" {
            return 0
        }
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        let filter = FilterSection.filters[indexPath.section]
        let option = filter.options[indexPath.row]
        
        cell.textLabel!.text = option.name
        if indexPath.section != 0 && indexPath.section != FilterSection.filters.count - 1 {
            if indexPath.row == 0 {
                cell.accessoryView = UIImageView(image: UIImage(named: "Dropdown")!)
            }
            else {
                if option.selected {
                    cell.accessoryView = UIImageView(image: UIImage(named: "Check")!)
                }
                else {
                    cell.accessoryView = UIImageView(image: UIImage(named: "Uncheck")!)
                }
            }
        }
        else {
            if indexPath.section != FilterSection.filters.count - 1 || indexPath.row != 0 {
                let uiSwitch = UISwitch()
                if option.selected {
                    uiSwitch.setOn(true, animated: false)
                }
                uiSwitch.addTarget(self, action: "_changeSwitchValue:", forControlEvents: UIControlEvents.ValueChanged)
                cell.accessoryView = uiSwitch
            }
        }
        cell.selectionStyle = .None
        return cell
    }
    
    func _changeSwitchValue(uiSwitch: UISwitch) {
        let cell = uiSwitch.superview as! UITableViewCell
        if let indexPath = self.tableView.indexPathForCell(cell) {
            let selectedOption = FilterSection.filters[indexPath.section].options[indexPath.row]
            selectedOption.selected = uiSwitch.on
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.sectionSelected[indexPath.section] = !self.sectionSelected[indexPath.section]
        
        let filter = FilterSection.filters[indexPath.section]
        let selectedOptions = filter.options
        let selectedOption = selectedOptions[indexPath.row]
        if indexPath.section != 0 && indexPath.section != FilterSection.filters.count - 1 {
            if indexPath.row != 0 {
                selectedOptions[0].name = selectedOption.name
                selectedOptions[0].value = selectedOption.value
                
                for option in selectedOptions {
                    option.selected = false
                }
                selectedOption.selected = true
            }
            self.tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
        else if indexPath.section == FilterSection.filters.count - 1 {
            if indexPath.row == 0 {
                if filter.options[0].name == "Collapse" {
                    filter.options[0].name = "See All"
                }
                else {
                    filter.options[0].name = "Collapse"
                    selectedOption.selected = true
                }
                self.tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
            }
        }
        else {
            self.tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    
/**** End UITableView ****/
    
/**** Private Functions ****/
    func _getNumberOfSection(section: Int) -> Int {
        if self.sectionSelected[section] {
            return FilterSection.filters[section].options.count
        }
        else {
            return FilterSection.filters[section].displayItems
        }
    }


}
