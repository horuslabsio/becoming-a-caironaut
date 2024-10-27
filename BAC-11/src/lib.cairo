mod recoverable;

use core::panic_with_felt252;

fn main() {
    // panic with data array
    let mut data = array!['call panicked'];
    panic(data);

    // panic with felt252
    panic_with_felt252('call panicked');

    // panic with byteArray
    panic!("I want this to panic with a value which is greater than 31 characters");
}

fn function_never_panics() -> felt252 nopanic {
    100
}

#[panic_with('value is 0', wrap_not_zero)]
fn wrap_if_not_zero(value: u128) -> Option<u128> {
    if value == 0{
        Option::None
    }
    else {
        Option::Some(value)
    }
}