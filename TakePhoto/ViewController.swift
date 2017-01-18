//
//  ViewController.swift
//  TakePhoto
//
//  Created by Developer on 1/3/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker: UIImagePickerController!
    
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
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
   
    
        //imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.dismiss(animated: true, completion: nil)
        // try to connect to the local directory
        // add timestamp to differentiate between files
        //write to file here
        /*
            let mediaType = info[UIImagePickerControllerOriginalImage]
            self.dismiss(animated:true, completion: nil)
         */
        imageView.image = image
        
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
















