
import UIKit

class FurnitureDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var furniture: Furniture?
    
    @IBOutlet weak var choosePhotoButton: UIButton!
    @IBOutlet weak var furnitureTitleLabel: UILabel!
    @IBOutlet weak var furnitureDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            choosePhotoButton.setTitle("", for: .normal)
            choosePhotoButton.setImage(image, for: .normal)
        } else {
            choosePhotoButton.setTitle("Choose Image", for: .normal)
            choosePhotoButton.setImage(nil, for: .normal)
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
                
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in
                print("User Selected Camera Action")
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in
                print("User Selected Photo Library Action")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceView = sender as? UIView
        
        present(alertController, animated: true, completion: nil)
        
        
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {(_) in
//                imagePicker.sourceType = .photoLibrary
//                self.present(imagePicker, animated: true, completion: nil)
//            })
//            alertController.addAction(photoLibraryAction)
//        }
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
//                print("User Selected Camera Action")
//                imagePicker.sourceType = .camera
//                self.present(imagePicker, animated: true, completion: nil)
//            })
//            alertController.addAction(cameraAction)
//        }
//
//        alertController.popoverPresentationController?.sourceView = sender as? UIView
//
//        present(alertController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            furniture?.imageData = UIImagePNGRepresentation(selectedImage)
            dismiss(animated: true){
                self.updateView()
            }
        }
    }
    
    func imagePickerControllerDidCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        guard let imageData = furniture?.imageData,
                let image = UIImage(data: imageData) else { return }
            guard let description = furniture?.description else { return }

            let activityController = UIActivityViewController(activityItems: [image, description], applicationActivities: nil)

            present(activityController, animated: true, completion: nil)
        }
    
}
