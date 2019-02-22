//
//  OtherExampleViewController.swift
//  MultiProgressView_Example
//
//  Created by Mac Gallagher on 2/18/19.
//  Copyright © 2019 Mac Gallagher. All rights reserved.
//

import MultiProgressView

class OtherExampleViewController: UIViewController {
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.rgb(red: 189, green: 189, blue: 189).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    private lazy var progressView: MultiProgressView = {
        let progress = MultiProgressView()
        progress.backgroundColor = .lightGray
        progress.trackInset = 5
        progress.trackBackgroundColor = .progressBackground
        progress.trackTitleAlignment = .center
        progress.lineCap = .round
        progress.cornerRadius = progressViewHeight / 2
        progress.setTitle("Background Title")
        progress.trackTitleLabel?.textColor = .lightGray
        return progress
    }()
    
    private let animateButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 1
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 2
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let padding: CGFloat = 15
    private let progressViewHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
        view.addSubview(backgroundView)
        backgroundView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50)
        
        setupProgressBar()
        setupButtons()
    }
    private func setupProgressBar() {
        backgroundView.addSubview(progressView)
        progressView.anchor(top: backgroundView.topAnchor, left: backgroundView.leftAnchor, right: backgroundView.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingRight: padding, height: progressViewHeight)
        progressView.dataSource = self
    }
    
    @objc private func handleTap(_ button: UIButton) {
        if button.tag == 1 {
            self.animateProgress()
        } else if button.tag == 2 {
            self.resetProgress()
        }
    }
    
    private func animateProgress() {
        UIView.animate(withDuration: 2.0) {
            self.progressView.setProgress(section: 0, to: 0.5)
        }
        
        UIView.animate(withDuration: 1.7, delay: 0.8, animations: {
            self.progressView.setProgress(section: 2, to: 0.3)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 1.5, animations: {
            self.progressView.setProgress(section: 1, to: 0.2)
        }, completion: nil)
        
//        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, animations: {
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: {
//
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.7, animations: {
//                self.progressView.setProgress(section: 1, to: 0.2)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 1, animations: {
//                self.progressView.setProgress(section: 2, to: 0.3)
//            })
//
//        }) { finished in
//
//        }
    }
    
    private func resetProgress() {
        UIView.animate(withDuration: 0.1) {
            self.progressView.resetProgress()
        }
    }
    
    private func setupButtons() {
        view.addSubview(resetButton)
        resetButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 50, width: 200, height: 50)
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(animateButton)
        animateButton.anchor(bottom: resetButton.topAnchor, paddingBottom: 20, width: 200, height: 50)
        animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension OtherExampleViewController: MultiProgressViewDataSource {
    public func numberOfSections(in progressBar: MultiProgressView) -> Int {
        return 3
    }
    
    public func progressView(_ progressView: MultiProgressView, viewForSection section: Int) -> ProgressViewSection {
        let bar = ProgressViewSection()
        //use another color scheme
        switch section {
        case 0:
            bar.backgroundColor = .progressRed
        case 1:
            bar.backgroundColor = .progressBlue
        case 2:
            bar.backgroundColor = .progressYellow
        default:
            break
        }
        return bar
    }
}
