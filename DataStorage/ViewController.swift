//
//  ViewController.swift
//  DataStorage
//
//  Created by Divya Kuladeep on 11/18/17.
//  Copyright © 2017 Divya Kuladeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    struct Bookinfo: Codable{
        let bookname: String
        let authorname: String
        let description: String
    }
    
    @IBAction func clickArchive(_ sender: Any) {
        let text1 = textField1.text!
        let text2 = textField2.text!
        let text3 = textField3.text!

        
        var bookinfo = Bookinfo(bookname: text1, authorname: text2, description: text3)
        
        let writeText: [String] = [bookinfo.bookname,bookinfo.authorname,bookinfo.description]
        
        let fileName = "myfile2"
        let DocumentDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirUrl.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File path:\(fileURL.path)")
       
        
        NSKeyedArchiver.archiveRootObject(writeText, toFile: fileURL.path)
    }
    
    @IBAction func clickfilestore(_ sender: Any) {
        let text1 = textField1.text!
        let text2 = textField2.text!
        let text3 = textField3.text!

        let appendedText = text1 + "\n" + text2 + "\n"+text3
        print(appendedText)
        
        let fileName = "myfile"
        let DocumentDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirUrl.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File path:\(fileURL.path)")
        let writeString =  appendedText
        do{
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            
        }catch let error as NSError {
            print("Failed to write to URL")
            print(error)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

