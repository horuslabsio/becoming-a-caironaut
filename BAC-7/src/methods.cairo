#[derive(Copy, Drop)]
struct Rectangle {
    width: u16,
    height: u16
}

#[generate_trait]
impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u16 {
        *self.width * *self.height
    }

    fn scale(ref self: Rectangle, factor: u16) {
        self.width *= factor;
        self.height *= factor;
    }

    fn new(width: u16, height: u16) -> Rectangle {
        Rectangle { width, height }
    }
}

fn main() {
    let mut rectangle = Rectangle { width: 20, height: 30 };
    let area = rectangle.area();
    rectangle.scale(2);
    println!("the area is {}", area);
    println!("the new width is {}", rectangle.width);

    let new_rectangle = RectangleImpl::new(10, 20);
    println!("the width is {}", new_rectangle.width);
}