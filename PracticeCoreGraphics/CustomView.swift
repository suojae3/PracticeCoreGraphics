
import UIKit



// MARK: - 동그라미
class CustomView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setFillColor(UIColor.systemBlue.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(5)
        
        let rectangle = CGRect(x: (rect.width / 2) - 50, y: (rect.height / 2) - 50, width: 100, height: 100)
        context.addEllipse(in: rectangle)
        context.drawPath(using: .fillStroke)
    }
}

// MARK: - 선그리기
class LineView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(2)
        
        context.move(to: CGPoint(x: 20, y: 20))
        context.addLine(to: CGPoint(x: rect.width - 20, y: rect.height - 20))
        
        context.strokePath()
    }
}

// MARK: - 사각형
class RectangleView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setFillColor(UIColor.green.cgColor)
        let rectangle = CGRect(x: 50, y: 100, width: rect.width - 100, height: 200)
        context.addRect(rectangle)
        
        context.fillPath()
    }
}


// MARK: - 그라데이션 채우기
class GradientView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [UIColor.blue.cgColor, UIColor.white.cgColor] as CFArray
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: [0.0, 1.0])
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: self.bounds.height)
        
        context.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: [])
    }
}


// MARK: - 경로를 사용한 복잡한 도형 그리기
class ComplexShapeView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.move(to: CGPoint(x: 100, y: 100))
        context.addLine(to: CGPoint(x: 150, y: 200))
        context.addLine(to: CGPoint(x: 50, y: 200))
        context.closePath()
        
        context.setFillColor(UIColor.orange.cgColor)
        context.fillPath()
    }
}


// MARK: - 원형 진행 표시기
class CircularProgressView: UIView {
    var progress: CGFloat = 0.6 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // 배경 원 그리기
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2 - 10
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        
        context.setLineWidth(10)
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        context.strokePath()
        
        // 진행 원 그리기
        let progressEndAngle = startAngle + 2 * CGFloat.pi * progress
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: progressEndAngle, clockwise: false)
        context.strokePath()
    }
}


// MARK: - 학습활동 과제
class SessacButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.setLineWidth(5)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        let circleRect: CGRect = bounds.insetBy(dx: 10, dy: 10)
        context.addEllipse(in: circleRect)
        context.drawPath(using: .fillStroke)
        
        
        let width: CGFloat = bounds.width
        let height: CGFloat = bounds.height
        
        context.move(to: CGPoint(x: width * 0.1, y: height * 0.5))
        context.addQuadCurve(to: CGPoint(x: width * 0.9, y: height * 0.1), control: CGPoint(x: width * 0.4, y: height * 1.2))
        context.drawPath(using: .stroke)
    }
}

//MARK: - 과제
class PlaceholderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // 원
        context.setFillColor(UIColor.white.cgColor)
        let circle = CGRect(x: (rect.width / 2) - 110, y: (rect.height / 2) - 75, width: 40, height: 40)
        context.addEllipse(in: circle)
        context.drawPath(using: .fill)

        
        context.setFillColor(UIColor.white.cgColor)
        let rectangle = CGRect(x: rect.origin.x, y: rect.origin.y+200, width: rect.width, height: 250)
//        context.addRect(rectangle)
        context.addQuadCurve(to: CGPoint(x: 0, y: 0), control: CGPoint(x: 0, y: 1))
//        context.drawPath(using: rectangle)
        context.fillPath()

        
        // 선
        
        
            
    }
    
}


@IBDesignable
class MountainButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.systemYellow
    @IBInspectable var lineWidth: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let height = bounds.height
        let width = bounds.width
        
        let circleRect = bounds.insetBy(dx: width * 0.05,
                                        dy: height * 0.05)
        
        context.beginPath()
        context.setLineWidth(lineWidth)
        context.setFillColor(UIColor.darkGray.cgColor)
        context.fill(bounds)
        
        context.setFillColor(fillColor.cgColor)
        context.move(to: CGPoint(x: 0, y: height * 0.6))
        context.addCurve(to: CGPoint(x: width * 0.5, y: height * 0.4), control1: CGPoint(x: width * 0.1, y: height * 0.2), control2: CGPoint(x: width * 0.3, y: height * 1.1))
        
        context.addQuadCurve(to: CGPoint(x: width, y: height * 0.7), control: CGPoint(x: width * 0.65, y: -height * 0.1))
        
        context.addLine(to: CGPoint(x: width, y: height))
        context.addLine(to: CGPoint(x: 0, y: height))
        context.addLine(to: CGPoint(x: 0, y: height * 0.6))
        
        context.addEllipse(in: CGRect(origin: CGPoint(x: width * 0.25, y: height * 0.35), size: CGSize(width: width * 0.1, height: width * 0.1)))
        
        context.drawPath(using: .fillStroke)
    }
    
}
