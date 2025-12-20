//
//  Downloader.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 18/12/25.
//

import Foundation
final class FileDownloader : ObservableObject {
    @Published var progress: Double = 0
    
    func download(from url: URL, filename: String){
        let task = URLSession.shared.downloadTask(with: url){
            tempURL, response, error in guard let tempURL else { return }
            let fileManager = FileManager.default
            let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let destination = documents.appendingPathComponent(filename)
            try? fileManager.removeItem(at: destination)
            try? fileManager.moveItem(at: tempURL, to: destination)
        }
        task.resume()
    }
}
