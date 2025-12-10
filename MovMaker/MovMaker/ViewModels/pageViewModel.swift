//
//  pageViewModel.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 08/12/25.
//

import Foundation
import SwiftUI

class PageViewModel : ObservableObject{
    @ViewBuilder
    func screenType(for type: PageType) -> some View{
        
        switch type{
            
        case .intro:
            IntroView(page: Page(
                    id: 1,
                    type: .intro,
                    title: "Primeiro dia",
                    content: "dgasdkghaskgalskjgdsakgsknksn",
                    info: nil,
                    photo: nil,
                    video: nil
            )
            )
        case .content:
            ContentPageView(page: Page(
                id: 2,
                type: .content,
                title: "Primeiro dia",
                content: "dgasdkghaskgalskjgdsakgsknksn",
                info: nil,
                photo: nil,
                video: nil
            )
            )
        case .activity:
            ActivityView(page: Page(
                id: 3,
                type: .activity,
                title: "",
                content: "",
                info: "",
                photo: "",
                video: ""
            )
            )
        
        }
    }
    

}
