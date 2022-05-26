//
//  SignOnView.swift
//  SignOnView
//
//  Created by Shahzaib Maqbool on 07/04/2022.
//  Copyright © 2022 iOS4You. All rights reserved.
//
import Foundation
import SwiftUI
import PencilKit
struct SignOnView: View {
    
    @State private var signature: UIImage?
    @State private var resettingSignature = false
    private let signatureBackgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0)
    @State var drawings: [PKDrawing] = [PKDrawing()]
    let imgRect = CGRect(x: 0, y: 0, width: 100.0, height: 300.0)
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                if !resettingSignature {
                    signatureView.frame(width:100, height: 300.0)
                }
                else
                {
                    Text("").padding().frame(width: geometry.size.width - 32, height: 309, alignment: .center).background(Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 1.0))
                }
                HStack {
                    Button("CLEAR") {
                        if (!resettingSignature) {
                            resettingSignature = true
                            
                            signatureView.clear()
                            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false) { timer in
                                resettingSignature = false
                            }
                        }
                    }.frame(width: 80, height: 30)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy))
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    
                    Spacer()
                    
                    Button("SEND SIGNATURE") {
                        signature = self.drawings.last?.image(from: imgRect, scale: 1.0)
                        if let image = signature {
                            sendSignature(image: image)
                        } else {
                            // no signature
                        }
                    }.frame(width: 170, height: 30)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy))
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                }
            }.frame(alignment: .leading)
                .padding()
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }
        }
    }
    
    private var signatureView: SMSignatureView {
        return SMSignatureView(drawings: $drawings, backgroundColor: signatureBackgroundColor)
    }
    
    private func sendSignature(image: UIImage) {
    }
}
