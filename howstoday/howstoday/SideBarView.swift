//
//  SideBarView.swift
//  howstoday
//
//  Created by Cagy Jiao on 2023. 02. 09..
//

import Foundation
import SwiftUI

struct SideBarView: View {
    let options: [Option]
    @Binding var currentSelection: Int
    
    var body: some View {
        VStack {
            ForEach(options, id: \.self) { option in
                HStack {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                    Text(option.title)
                        .foregroundColor(currentSelection == option.id ? .secondary : .primary)
                    Spacer()
                }
                .padding(12)
                .onTapGesture {
                    currentSelection = option.id
                }
                
                if (option.id == 3) {
                    Divider()
                }
            }
            
            Spacer()
        }
    }
}
