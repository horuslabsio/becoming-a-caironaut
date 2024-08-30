fn main() {
    let x = 10;
    let y = 6;
    // this function subtracts two numbers which
    // are both u16s
    let z = subtract_number(:x, :y);
    println!("{}", z); // this macro prints out the value of z
}

/// this function subtracts numbers
/// x: this is a u16 value
/// y: this is a u16 value
/// returns a u16 value
fn subtract_number (x: u16, y: u16) -> u16 {
    x - y
}

//! this is my module
mod mine {

}