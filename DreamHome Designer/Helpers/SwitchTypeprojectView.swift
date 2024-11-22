//
//  SwiftUIView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct SwitchTypeprojectView: View {
    @StateObject var vm: ProjectViewModel

    var body: some View {
        HStack {
            Button {
                vm.sortProjecttype = 0
            } label: {
                Text("All")
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.white
                            .opacity(vm.sortProjecttype == 0 ? 0.2 : 0)
                            .cornerRadius(12)
                    }
            }
            Button {
                vm.sortProjecttype = 2
            } label: {
                Text("Interier")
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.white
                            .opacity(vm.sortProjecttype == 2 ? 0.2 : 0)
                            .cornerRadius(12)
                    }
            }
            Button {
                vm.sortProjecttype = 1
            } label: {
                Text("Exterier")
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.white
                            .opacity(vm.sortProjecttype == 1 ? 0.2 : 0)
                            .cornerRadius(12)
                    }
            }

        }
        .background {
            Color.white
                .opacity(0.2)
                .cornerRadius(12)
        }
    }
}

//#Preview {
//    ZStack {
//        Color.black
//        SwitchTypeprojectView()
//    }
//}
