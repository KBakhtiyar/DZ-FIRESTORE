import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import FirebaseDatabase

class APIManager {
    static let shared = APIManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getPost(collection: String, docName: String, completion: @escaping(Document?) -> Void) {
        let db = configureFB()
        db.collection(collection).document(docName).getDocument(completion: {(document, error) in
            guard error == nil else { completion(nil); return }
            let doc = Document(field1: document?.get("field1") as! String, field2: document?.get("field2") as! String)
            completion(doc)
        })
    }
    func getImage(picName: String, completion: @escaping(UIImage) -> Void ) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("pictures")
        
        var image: UIImage = UIImage(named: "default_pic")!
        
        let fileRef = pathRef.child(picName + ".jpeg")
        fileRef.getData(maxSize: 1024*1024, completion: { data, error in
            guard error == nil else { completion(image); return }
            image = UIImage(data: data!)!
            completion(image)
        })
    }
}
