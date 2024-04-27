import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "MessagesTableViewCell"
    var readAction: (() -> ())?
    

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "sdhfjks"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "sdfsd"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var readButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(read), for: .touchUpInside)
        return button
    }()
    
    @objc func read() {
        readAction?()
    }
    
    func configure(_ chat: Chat) {
        nameLabel.text = chat.text
        dateLabel.text = chat.date
        backgroundColor = chat.isRead ? .white : .lightGray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(readButton)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(12)
        }
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        readButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
    }
}
