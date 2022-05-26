//public struct SMSignatureView {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
import SwiftUI
import PencilKit
@available(iOS 14, macOS 11.0, *)
public struct SMSignatureView: UIViewRepresentable {
    @Binding var drawings: [PKDrawing]
    
    var backgroundColor: UIColor
    var canvas = PKCanvasView(frame: .init(x: 0, y: 0, width: 0, height: 0))
    
    public func makeUIView(context: Context) -> PKCanvasView {
        //canvas = PKCanvasView(frame: .init(x: 0, y: 0, width: signViewWidth, height: signViewHeight))
        canvas.backgroundColor = backgroundColor
        canvas.delegate = context.coordinator
        canvas.drawingPolicy = .anyInput
        canvas.tool = PKInkingTool(.marker, color: .black, width: 7)
        return canvas
    }
    public func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
        print("sssdsd")
    }
    
    func clear() {
        canvas.drawing = PKDrawing()
        self.drawings.removeAll()
        //view.clear()
    }
    public func makeCoordinator() -> Coordinator {
        Coordinator(self._drawings)
    }
    //  func makeCoordinator() -> Coordinator {
    //    return Coordinator(self)
    //  }
}
@available(iOS 14, macOS 11.0, *)
extension SMSignatureView {
    public class Coordinator: NSObject, PKCanvasViewDelegate {
        @Binding var drawings: [PKDrawing]
        
        init(_ drawings: Binding<[PKDrawing]>) {
            self._drawings = drawings
        }
        
        public func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            self.drawings.append(canvasView.drawing)
        }
    }
}
