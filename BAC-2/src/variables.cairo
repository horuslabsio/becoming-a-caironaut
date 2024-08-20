const HELLO: felt252 = 'hello';

struct Numbers {
    a: u64,
    b: u256,
}

const NUM: Numbers = Numbers { a: 24, b: 25};

enum MyEnum {
    a: felt252,
    b: (u64, u32)
}

const MINE: MyEnum = MyEnum::a('hello');

fn main() {
    let x = 5_u32;
    let x = 'felt252';
    println!("{}", x);
}