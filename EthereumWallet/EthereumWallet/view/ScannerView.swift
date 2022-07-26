//
//  ScannerView.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/25.
//

import SwiftUI
import AVFoundation

struct ScannerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                CameraView()
            }.navigationBarHidden(true)
            VStack {
                HStack {
                    Spacer()
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark").foregroundColor(.white).frame(width: 40, height: 40, alignment: .center)
                    }.padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 10))
                }
                Spacer()
            }
            VStack {
                Image(systemName: "qrcode.viewfinder").font(.system(size: 180)).opacity(0.4).foregroundColor(.white)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CameraView: UIViewRepresentable {

    typealias UIViewType = CameraPreview

    func makeUIView(context: Context) -> CameraPreview {
        return CameraPreview()
    }
    func updateUIView(_ uiView: CameraPreview, context: Context) {}
}

class PreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
}

class CameraPreview: UIView {
    var captureSession: AVCaptureSession?
    let previewView = PreviewView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                self.setupCaptureSession()
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.setupCaptureSession()
                    }
                }
            case .denied:
                return
            case .restricted:
                return
            default:
            fatalError()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCaptureSession() {
        captureSession = AVCaptureSession()
        guard let captureSession = captureSession else {
            return
        }
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        guard videoDevice != nil, let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),captureSession.canAddInput(videoDeviceInput) else {
            return
        }
        captureSession.addInput(videoDeviceInput)
        
        let photoOutput = AVCapturePhotoOutput()
        guard captureSession.canAddOutput(photoOutput) else { return }
        captureSession.sessionPreset = .photo
        captureSession.addOutput(photoOutput)
        captureSession.commitConfiguration()
        
        previewView.frame = UIScreen.main.bounds
        previewView.videoPreviewLayer.session = captureSession
        previewView.videoPreviewLayer.videoGravity = .resizeAspectFill
        self.addSubview(previewView)
        
        captureSession.startRunning()
    }

}
