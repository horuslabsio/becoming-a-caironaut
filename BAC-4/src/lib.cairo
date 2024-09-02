#[derive(Copy, Drop)]
enum DataType {
    Integer: u8,
    felt252: felt252
}

fn main() {
    let mut arr = ArrayTrait::<felt252>::new();
    arr.append(10);
    arr.append(20);
    arr.append(30);
    arr.append(40);
    arr.append(50);

    // using the at method
    let x = *arr.at(0);
    println!("first element is {}", x);

    // using the get method
    let index = 6;
    let y = match arr.get(index) {
        Option::Some(x) => *x.unbox(),
        Option::None => 'index is out of bounds'
    };

    println!("{}", y);

    // using pop_front
    arr.pop_front().unwrap();
    let z = *arr[0];
    println!("new first element is {}", z);

    // using len
    let length: usize = arr.len();
    println!("the length is {}", length);

    // using is_empty
    let is_empty = arr.is_empty();
    println!("{}", is_empty);

    let arr2: Array<u16> = array![60, 70, 80];
    let value = *arr2[0];
    println!("{}", value);

    let mut arr3: Array<DataType> = array![];
    arr3.append(DataType::Integer(20));
    arr3.append(DataType::felt252(10));

    let arr4 = arr.span();
}