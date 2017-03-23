//
//  ViewController.swift
//  TakePhoto
//
//  Created by Developer on 1/3/17.
//  Copyright © 2017 Developer. All rights reserved.
//

/*
 Importand configurations to allow
 Add Privacy - Camera Usage Desc
 Add Privacu - Photo Library Usage
 
 
 */



import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    // need an imagePicker controller
    // string directory to the path
    // array of images
    // newDir string
    
    var imagePicker: UIImagePickerController!
    var imagesDirectoyPath: String!
    var images: [UIImage]!
    var titles: [String]!
    var newDir: String!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        // creates an object of type UIImagePikcerController and and set the type to camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // check if the file exists
        // if not create directoty
        
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        let docsURL = dirPaths[0]
        
        //let newDir = docsURL.appendingPathComponent("ImagePicker").path
        
        newDir = docsURL.appendingPathComponent("ImagePicker").path
        
        var objcbool: ObjCBool = true
        print(docsURL)
        let isExist = filemgr.fileExists(atPath: newDir, isDirectory: &objcbool)
        
        if isExist == false{
            do{
                try filemgr.createDirectory(atPath: newDir, withIntermediateDirectories: true, attributes: nil)
                print("File created")
                // check the path exists
                print(newDir)
            }catch let error as NSError{
                print("Error: \(error.localizedDescription)")
            }
        }
        else{
            print("Exist already")
            do{
                let fileList = try filemgr.contentsOfDirectory(atPath: "/")
                for filename in fileList{
                    print(filename)
                }
            }catch let error as NSError{
                print("Error: \(error.localizedDescription)")
            }
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        //imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            // try to connect to the local directory
            // add timestamp to differentiate between files
            //write to file here
            /*
             let mediaType = info[UIImagePickerControllerOriginalImage]
             self.dismiss(animated:true, completion: nil)
             */
            imageView.image = image
            
            var imagePath = NSDate().description
            
            imagePath = imagePath.replacingOccurrences(of: " ", with: "")
            
            
            imagePath = newDir.appending("/\(imagePath).png")
            
            print("Real path: \(imagePath)")
            
            let data = UIImagePNGRepresentation(image)
            
            let success = FileManager.default.createFile(atPath: imagePath, contents: data, attributes: nil)
            
            do{
                titles = try FileManager.default.contentsOfDirectory(atPath: newDir)
                for title in titles{
                print(title)
                }
                }catch{
                    print("Error")
                }
                
        
        }
        else{
            print("Something went wrong")
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
     func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer) {
     
     if error != nil {
     let alert = UIAlertController(title: "Save Failed",
     message: "Failed to save image",
     preferredStyle: UIAlertControllerStyle.alert)
     
     let cancelAction = UIAlertAction(title: "OK",
     style: .cancel, handler: nil)
     
     alert.addAction(cancelAction)
     self.present(alert, animated: true,
     completion: nil)
     }
     */
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

/*
 Identifying the documents directory
 
 let filemgr = FileManager.default
 
 let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomaninMask)
 
 let docsDir = dirPaths[0].path
 
 Temporary Directory
 
 let tempDir = NSTemporaryDirectory
 
 Changing directories
 
 let docsDir = dirPaths[0].path
 
 if filemgr.changeCurrentDirectoryPath(docsDir){
 //success
 }
 else
 {
 //failure
 }
 
 Creating a new Directory
 setting the withIntermediateDirectories argument to true will cause
 the intermediate directory to be created automatically before
 creating the sub-directory within it
 
 Creating a new Directory -- creates a new sub-directory named data in that directory
 
 let filemgr = FileManager.default
 
 let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomaninMask)
 
 let docsDir = dirPaths[0].path
 
 let newDir = docsURL.appendingPathComponent("data").path
 
 do{
 try filemgr.createDirectory(atPath: newDir,
 withIntermediateDirectories: true, attributes: nil)
 }catch let error as NSError{
 print("Error: \(error.localizedDescription)")
 }
 
 Deleting a directory
 do{
 try filemgr.removeItem(atPath: newDir)
 }  catch let error{
 print("Error: \(error.localizedDescription)")
 }
 
 */
















