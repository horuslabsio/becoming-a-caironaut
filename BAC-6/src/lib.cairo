#[derive(Copy, Drop, Destruct)]
struct Point {
    x: u128,
    y: u128
}

fn main() -> u8 {
    let p1 = Point { x: 23, y: 21 };
    foo(p1);
    foo(p1);
    foo(p1);
    foo(p1);
    foo(p1);

    // using the clone method
    let mut arr1 = array![1,2,3,4];
    let arr2 = arr1.clone();
    println!("first array: {}", arr1[1]);
    println!("second array: {}", arr2[1]);

    append_value(arr1);
    append_value(arr2);

    // using snapshots
    let mut arr3 = array![1,2,3,4];
    let snap1 = @arr3;
    arr3.append(5);
    println!("length of snap: {}", snap1.len());
    println!("length of arr3: {}", arr3.len());

    pop_array(ref arr3);

    return *snap1[2];
}

fn foo(p: Point) -> u128 {
    p.x + p.y
}

fn append_value(mut arr: Array<u8>) {
    arr.append(5);
}

fn pop_array(ref arr: Array<u8>) {
    let x = arr.pop_front();
}
