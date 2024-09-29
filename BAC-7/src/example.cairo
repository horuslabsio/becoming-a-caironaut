
#[derive(Copy, Drop)]
struct Rectangle {
    width: u16,
    height: u16
}

#[derive(Copy, Drop)]
struct Square {
    length: u16
}

impl SquareIntoRectangle of Into<Square, Rectangle> {
    fn into(self: Square) -> Rectangle {
        Rectangle { width: self.length, height: self.length }
    }
}

impl RectangleIntoSquare of TryInto<Rectangle, Square> {
    fn try_into(self: Rectangle) -> Option<Square> {
        if self.height == self.width {
            return Option::Some(Square { length: self.width });
        }
        else {
            return Option::None;
        }
    }
}

fn main() {
    let rectangle = Rectangle { width: 30, height: 40 };
    let area = calculate_area(rectangle);

    println!("the area is {}", area);

    // into trait impl for custom types
    let square: Square = Square { length: 20 };
    let rectangle2: Rectangle = square.into();
    println!("the width of the rectangle is {}", rectangle2.width);

    // try_into trait impl for custom types
    let square2: Square = rectangle2.try_into().unwrap();
    println!("the length of our square is {}", square2.length);
}

fn calculate_area(rect: Rectangle) -> u16 {
    rect.width * rect.height
}