struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()
someResolution.width
someResolution.height
someVideoMode.resolution.width
someVideoMode.resolution.width = 1280
someVideoMode.resolution.width

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
cinema.width
hd.width

//class are Reference Type
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate  = 25

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty.frameRate

//識別運算子 === ,!==
alsoTenEighty === tenEighty




