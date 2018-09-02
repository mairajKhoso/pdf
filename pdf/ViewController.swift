//
//  ViewController.swift
//  pdf
//
//  Created by Mairaj khoso on 8/29/18.
//  Copyright © 2018 Mairaj khoso. All rights reserved.
//

import UIKit
import TPPDF

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var colorWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
         generateTestPDF()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func generateTestPDF() {
        let document = PDFDocument(format: .a4)
        
        document.setFont(font: UIFont.systemFont(ofSize: 50.0))
        document.addText(.contentLeft,text: "BARRETT")
        
        let style = PDFLineStyle(type: .dotted, color: UIColor.darkGray, width: 5)
        
        document.addLineSeparator(PDFContainer.contentLeft, style: style)
        document.setFont(font: UIFont.systemFont(ofSize: 20.0))
        
        document.addText(.contentLeft,text: "INFORMATION TECHNOLOGY. LLC")
 //
        document.addSpace(space: 30, foreColor: .clear)
       // document.addSpace(space: 30)
       // document.addLineSeparator(style: .init(type: .none, color: .blue, width: 300, radius: 30))
        //table.style.columnHeaderStyle.colors.fill = UIColor.clear
        
//        var a = whiteColor()
//        document.addImage(.contentCenter,image: a)
        
        let image = #imageLiteral(resourceName: "blue-2")
        
        let logoImage = PDFImage(image: image)
        document.addImage(.contentCenter, image: logoImage)

        
        
        let table = PDFTable()
        do{
    //table.style.columnHeaderStyle.colors.text = UIColor.clear
    
        table.style.columnHeaderStyle.colors.fill = UIColor.clear
            try table.generateCells(data: [[" "," "," "],["Client Info","Technician Info ","Service Times"],["Address","Umer","Start 07/10/2018 4:18 PM"],["phone","amnimust000@gmail.com","Stop 08/20/2018 7:10 PM"],["etc","asdf","986 hours and 52 minutes total"],[" "," "," "]], alignments: [[.left,.left,.left],[.left,.left,.left],[.left,.left,.left],[.left,.left,.left],[.left,.left,.left],[.left,.left,.left]])
            //document.setFont(font: UIFont.systemFont(ofSize: 13.0))
            
            // Add long simple text. This will automatically word wrap if content width is not enough.
            
           
            
        } catch PDFError.tableContentInvalid(let value) {
            // In case invalid input is provided, this error will be thrown.
            
            print("This type of object is not supported as table content: " + String(describing: (type(of: value))))
        } catch {
            // General error handling in case something goes wrong.
            
            print("Error while creating table: " + error.localizedDescription)
        }
        

        

        
        table.widths = [
            0.3333, 0.3333, 0.3333
        ]
        
         document.addTable(table: table)

        document.setFont(font: UIFont.systemFont(ofSize: 15.0))
        document.addText(text: "Services performed")
        document.addSpace(space: 5)
        document.setFont(font: UIFont.systemFont(ofSize: 12.0))
        document.addText(text: "Generating a PDF file using TPPDF feels like a breeze. You can easily setup a document using many convenient commands, and the framework will calculate and render the PDF file at top speed. A small document with 2 pages can be generated in less than 100 milliseconds. ")
        document.addSpace(space: 5)
        document.setFont(font: UIFont.systemFont(ofSize: 15.0))
        document.addText(text: "Recommendations")
        document.setFont(font: UIFont.systemFont(ofSize: 12.0))
        document.addText(text: "Generating a PDF file using TPPDF feels like a breeze. You can easily setup a document using many convenient commands, and the framework will calculate and render the PDF file at top speed. A small document with 2 pages can be generated in less than 100 milliseconds. ")
        document.addSpace(space: 5)
        document.setFont(font: UIFont.systemFont(ofSize: 15.0))
        document.addText(text: "Notes")
        document.setFont(font: UIFont.systemFont(ofSize: 12.0))
        document.addText(text: "Generating a PDF file using TPPDF feels like a breeze. You can easily setup a document using many convenient commands, and the framework will calculate and render the PDF file at top speed. A small document with 2 pages can be generated in less than 100 milliseconds. ")
        
        document.setFont(font: UIFont.systemFont(ofSize: 15.0))
        document.addText(text: "Signature")
        let img = #imageLiteral(resourceName: "signature")
        let sigImage = PDFImage(image: img)
        document.addImage(.contentCenter, image: sigImage)
        
        //document.addImage(image: )
        
        //document.addSpace(space: 30)

        
        
        do {
            // Generate PDF file and save it in a temporary file. This returns the file URL to the temporary file
            let url = try PDFGenerator.generateURL(document: document, filename: "Example.pdf", progress: {
                (progressValue: CGFloat) in
                print("progress: ", progressValue)
            }, debug: true)
            
            // Load PDF into a webview from the temporary file
            self.webview?.loadRequest(URLRequest(url: url))
        } catch {
            print("Error while generating PDF: " + error.localizedDescription)
        }
    }
    
    
    

    //        let style = PDFTableCellStyle(colors: colors, borders: borders, font: font)
    
    
  

}
func whiteColor() -> PDFImage
{
    let whiteImage = #imageLiteral(resourceName: "white")
    let WImage = PDFImage(image: whiteImage)
    return WImage
}

