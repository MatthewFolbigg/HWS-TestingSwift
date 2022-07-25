//
//  ContentView.swift
//  Storm Viewer TDD
//
//  Created by Matthew Folbigg on 25/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var pictures = Array<String>()
    
    var body: some View {
        List(pictures, id: \.self) {
            Text($0)
        }
        .onAppear {
            print("LOADED : \(loadImages())")
            pictures = loadImages()
            print("LOADED : \(pictures)")
        }
    }
    
    func loadImages() -> Array<String> {
        let fileManager = FileManager.default
        guard let path = Bundle.main.resourcePath else { fatalError() }
        guard let items = try? fileManager.contentsOfDirectory(atPath: path) else { fatalError() }
        
        var pics = Array<String>()
        
        for item in items {
            print(item)
            if item.hasPrefix("nssl") {
                pics.append(item)
            }
        }
        
        return pics
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
