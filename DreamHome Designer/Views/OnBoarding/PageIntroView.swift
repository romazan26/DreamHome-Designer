//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    
    var body: some View {

        ZStack(alignment: .bottom) {
            Color.yellowApp
            Image(page.imageUrl)
                .resizable()
                .padding(20)
                .padding(.top, 40)
            VStack {
                Text(page.text)
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    
                Text(page.text2)
                    .font(.system(size: 22))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    
                    .padding(.bottom, 130)
            }
            .padding(20)
            .background {
                Color.black.cornerRadius(12)
                    
            }
        }.ignoresSafeArea()
                        
 
    }
}


#Preview {
    PageIntroView(page: PageIntro.samplePage)
}
