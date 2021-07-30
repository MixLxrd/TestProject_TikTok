//
//  ViewController.swift
//  TikTok
//
//  Created by Ilchenko Mikhail on 21.07.2021.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView = UITableView()
    private var videoLinks: [String] = ["https://tt.sf-converter.com/get?payload=tlZ1RibU4pfB-DNzUl7UklnufTESO2KkCrwWVDA~EEjkwlMbQIghitj-d1lOjqQp5dGJWMZ4EpR4L6JYDbO7p1u81n3FdkQ7H-koCdioSr6FFKXIhvft~KlayYCQccCLg45qpjmSINfScgUEb7BNhpZpst~aLiRC01ux-j-JttvWVm7o0QDyMrUCxKSfRrdZzHvZakACB1rYNcARNAm3xIAvwI~RaWf0gSXrcfUgfncAZnu48lkfPJgcKx5z~oOkzScQnAo0aBXMXfVqdoyVvI7pWr9m3-0XXFKVIxqCcfk2IVXXQEFQZeVcX5V9p-D7HcVcVZmKNulM8p5p8dMiU5ZqHmlxqtTXZb~TUkAvGSsp5p-IG-VpnTde~bnN6ZhWD-rTY0NMX4-ye7qfyg7GJ3pcQgdpkTnW6JdGb-dVE~FwJnCG9Jzntkpy2w6bGfrYtz~7Kx9E5~Wih9SfG0qfFFVp7peJ3SQrD-wYtt~KiWfxQiZ~8bUsDdLYzWEUF8wsTcgMlI3PDkomip7-fIuJjS0_*b85b736893816bdd*1*1626877266",
        "https://tt.sf-converter.com/get?payload=tlZiSi1U4pfBVN-ECAUdlrDSk1OcFFgjk3slO7OQilLTKLohJgnDMQQYPG5993RcDZ4wJ3yjHE-VYDQZmV69T7b5EykK2Ajupd45c1QyIkHxxMkAINljlsJQvrevicDCsRB5BVYCXCrAHIDIM0hNIn7rKj6U7hcxGD0jTs8jvHsDzXXEUOIJc6InejfcaD6rXcO6lVgjRjWiIS~JKRBVAX3qH0lf6IQAsfGvDyfVt74yvvJ2jjyxWdbIpYcBTaeDHBARO0X7bdCEuWZ-Pni-dx-dfIaCKROZZZzQtfgKKv5gjXvO45aaDOGpXecLJkLfdsps~2Wd2n3M3dOlUlRwv1Fp2b9TUVHoY74r7lho6Q27yWNqoIeq~jMIEoPTW37iZHn~ebwqPbuVqi19GCEhSUo4utjN-MiOusPp-F4CzML4be8Ls0Lu~tWuZ2r4CTshXiQ~yoenRsf3qygLVO-VRMCrMXwLu74wB10DNMLdYzJWAYQJj0WzU1FCyqcPqYFiiXwMWUre3Mg8yup~q3RkjBo_*3779462b07ed44ea*1*1626877330",
        "https://tt.sf-converter.com/get?payload=tlZiSNEU20fBVU8gXPjhGPUiMs0SZ1norf0Eg4TOHRQtzdIs2sFSk5MkJUHBAHQltFPB~QXA6IjSC1R2pyY88pn-y8Gpos9GO2Yobc7dokR11qy39Rahji5QHb6L5A6ZvrWfKYLZJklqfrpsxU0OfRKx22ktO3CJWc6B0CdgkL0ousWbHv-d9DmHv5QQF0GHUgHYlVTpMAfVS4gqDvpGclZSrHHg5axchJe6vfFcQAAFvof9BlvkVqALDcpZWMP5saB3OrXARcedKpkcFnzsAA4EI6FgAPmaJnWsWl~W11j2rLDhQfufBnfqVqffGxmXYHyv9efqZuqmGIBWRN6lHH9ISITURe~NgrpLtaYAVdDAqZDQyoxMF2SQVR9utMc3LBebUz2kwxW-SU2yl~RJNdbZtDyyuYpJFlMbBGmbX5f6uf6t-PIWFdurtdOzjT~8sgNY9pLOUbjczB-~b9QajPb7wh84r1iqFgOMUAjvJkEoNXadUxTCpG8MIrnjsVoksuVz96P-7i67h93u7W9D-9T96b7772wih~5w-9U-xOTZYob-lrjwHf__*b23b0c827fefce19*1*1626877356",
        "https://tt.sf-converter.com/get?payload=tlZiSN1U20fBY69aXPjh2PrygeOolTRiR4VosL02GRbOdMDb15AbgFUJAzgs5AvuVi6zVGaSVvAJA6YL0ab0TkTjyp9jmjsCWMkW88erLOWGpKUt61sS274WLWNGNk5kHQ535cD1vIPi3ZocAVaQaPAfFJznPlOHcz2rix2FzZfp7NTnkC3JJQL4KQSk8p21q9eLAbkCSyzgBWIAljzRAsC1q6jgRII7aEQzjSaUEmTwcK4ZKgqALgRHzUxSCySHGlxqK79-ccfM3vdLcDqEhaULBlYTazuWfDNpFvW~hM08cR5m89NUgbduBHKYYfx6CcCAcRI760KHf0zl9LCZy2ghKHj5gXABnQP1NM7PEq~JiDNjEAYNsBiSaDRu~6C55Cn9PQLqCpGrOpGtVuNSKLoBhjIaCdAZpbsMF5S3doPfwldMS1ethLPVEiFbZurGwuOXdJnr~1dko~3D5ZbTC8lYh~hpVc3c0ic72X6IzMNBlIYRLMtLhORgoJFnr3i7i~pFDsnkKQM2z~DMJ988jE3pptpHm-Paiu~tw9dai-PSMrFwnwyT-C0tj-b9r2ktkpO-bJGdtt3OW5G7-GLmbfJ_*445d20eec01c0511*1*1626877382"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        
        view.addSubview(blackView)
        blackView.snp.makeConstraints { maker in
            maker.left.right.bottom.equalToSuperview()
            maker.height.equalTo(80)
        }
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        let button1 = UIButton()
        button1.setImage(UIImage(named: "Home"), for: .normal)
        let button2 = UIButton()
        button2.setImage(UIImage(named: "Discover"), for: .normal)
        let button3 = UIButton()
        button3.setImage(UIImage(named: "Button Shape"), for: .normal)
        let button4 = UIButton()
        button4.setImage(UIImage(named: "Inbox"), for: .normal)
        let button5 = UIButton()
        button5.setImage(UIImage(named: "Me"), for: .normal)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.left.right.bottom.equalToSuperview().inset(15)
            maker.height.equalTo(60)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return VideoTableViewCell(link: videoLinks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
}

