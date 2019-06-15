//
//  HTMLParser.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

protocol HTMLParserable {
    func parse(html: String, completion: ([Elementable]) -> Void)
    
}

protocol HTMLParserDelegate: class {
    func parserDidBegin()
    func parserDidEndParse()
    func parserSuccess(with elements: [Elementable])
    
}

class HTMLParser {
    let url: String
    let parser: HTMLParserable
    
    weak var delegate: HTMLParserDelegate?
    
    init(url: String, parser: HTMLParserable) {
        self.url = url
        self.parser = parser
    }
    
    func loadContent() {
        guard let url = URL(string: url) else {
            return
        }
        
        let html: String
        do {
            html = try String(contentsOf: url)
            delegate?.parserDidBegin()
            parser.parse(html: html) { [weak self] elements in
                self?.delegate?.parserSuccess(with: elements)
            }
        } catch let error {
            print("Get html error: \(error)")
            delegate?.parserDidEndParse()
        }
    }
    
}
