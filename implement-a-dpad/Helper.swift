// 2 * pi = 360°
// =>
// pi = 180°
// =>
// pi/180 = 1°
// =>
// 0,01745329252 = 1°
func getRadianFor(degree: Float) -> Float {
    return Float(Double.pi/180) * degree
}

