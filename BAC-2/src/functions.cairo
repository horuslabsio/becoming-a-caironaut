fn main() {
    let x = 10;
    let y = 6;
    let z = subtract_number(:x, :y);
    println!("{}", z);
}

fn subtract_number (x: u16, y: u16) -> u16 {
    x - y
}