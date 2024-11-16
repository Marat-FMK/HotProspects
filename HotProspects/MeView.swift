//
//  MeView.swift
//  HotProspects
//
//  Created by Marat Fakhrizhanov on 15.11.2024.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
//                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)")) // добавили ф-ию которая генерит код сразу при появлении экрана и изменении значений имени и элюпочты
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 320)
                    .contextMenu {
                            let image = generateQRCode(from: "\(name)\n\(emailAddress)")

                            ShareLink(item: Image(uiImage: image), preview: SharePreview("My QR Code", image: Image(uiImage: image)))
                        }
            }
            .navigationTitle("Your code")
        }
        .onAppear(perform: updateCode)
        .onChange(of: name, updateCode)
        .onChange(of: emailAddress, updateCode)
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
}

#Preview {
    MeView()
}
