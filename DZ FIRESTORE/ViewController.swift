import UIKit
import SnapKit

class ViewController: UIViewController {
        
    let picture: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cClassButton: UIButton = {
        let button = UIButton()
        button.setTitle("C-Class", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var dClassButton: UIButton = {
        let button = UIButton()
        button.setTitle("D-Class", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapp), for: .touchUpInside)
        return button
    }()
    
    lazy var sClassButton: UIButton = {
        let button = UIButton()
        button.setTitle("S-Class", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(picture)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(cClassButton)
        view.addSubview(dClassButton)
        view.addSubview(sClassButton)
        
        picture.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(picture.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        cClassButton.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        dClassButton.snp.makeConstraints { make in
            make.top.equalTo(cClassButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        sClassButton.snp.makeConstraints { make in
            make.top.equalTo(dClassButton.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    @objc
    func buttonTapped() {
        print("Button was tapped")
        APIManager.shared.getPost(collection: "cars", docName: "smallCar", completion: {doc in
            guard doc != nil else {return}
            self.firstLabel.text = doc?.field1
            self.secondLabel.text = doc?.field2
        })
        
        APIManager.shared.getImage(picName: "c-class.jpg", completion: {pic in
            self.picture.image = pic
        })
    }
    
    @objc
    func buttonTapp() {
        print("Button was tapped")
        APIManager.shared.getPost(collection: "cars", docName: "middleCar", completion: {doc in
            guard doc != nil else {return}
            self.firstLabel.text = doc?.field1
            self.secondLabel.text = doc?.field2
        })
        
        APIManager.shared.getImage(picName: "d-class.jpg", completion: {pic in
            self.picture.image = pic
        })
    }
    
    @objc
    func buttonsTapped() {
        print("Button was tapped")
        APIManager.shared.getPost(collection: "cars", docName: "BigCar", completion: {doc in
            guard doc != nil else {return}
            self.firstLabel.text = doc?.field1
            self.secondLabel.text = doc?.field2
        })
        
        APIManager.shared.getImage(picName: "s-class.jpg", completion: {pic in
            self.picture.image = pic
        })
    }
    
}
