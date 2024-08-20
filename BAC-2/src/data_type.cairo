fn main() {
    let x = 23;
    let x = 23_u8;
    let x = 23_u16;

    let x = 1_u16 + 2_u16;
    let x = 5_u64 + 10_u64;
    let y = 10_u128 % 5_u128;

    let t: bool = true;

    let y = 'hello';
    let y: ByteArray = "hello world";

    let name: (felt252, felt252) = ('Darlington', 'Obi');
    let name_and_age: (felt252, u64) = ('Darlington', 21);

    let (name, age) = name_and_age;
    println!("{}", name);

    let (x, y): (felt252, felt252) = (23, 56);
    println!("{}", x);

    let arr: [u32; 5] = [1, 2, 3, 4, 5];
    let [x, y, z, u, v] = arr;

    let one: u64 = 10_u8.into();
    let two: u32 = 10_u64.try_into().unwrap();
}