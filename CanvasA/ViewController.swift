//
//  ViewController.swift
//  CanvasA
//
//  Created by Arlen Peña on 21/05/21.
//

import UIKit
class Canvas: UIView{
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    
        guard let context = UIGraphicsGetCurrentContext() else { return }
        //valores de prueba
//        let startPoint = CGPoint(x:50, y:50)
//        let endPoint = CGPoint(x:100, y: 100)
//
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)
        
        lines.forEach { (line) in
            for (i,p) in line.enumerated() {
                if i == 0 {
                context.move(to : p)
            } else {
                context.addLine(to: p)
            }
        }
    }
        
    context.strokePath()
        
}
    //var line = [CGPoint]()
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
       // print(point)
        
        guard var lastLine = lines.popLast() else { return }// devuelve el ultimo elemento y lo remueve
        lastLine.append(point)
        lines.append(lastLine)
        print(lines)
//        var lastLine = lines.last
//        lastLine?.append(point)
//        line.append(point)
        
        setNeedsDisplay()
    }
}


class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
       
    }


}

