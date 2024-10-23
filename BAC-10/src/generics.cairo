#[derive(Drop)]
struct Wallet<T> {
    balance: T
}

trait WalletTrait<T> {
    fn balance(self: Wallet<T>) -> T;
}

impl WalletImpl<T> of WalletTrait<T> {
    fn balance(self: Wallet<T>) -> T {
        self.balance
    }
}

enum Option<T> {
    Some: T,
    None
}

enum Result<T, E> {
    ok: T,
    err: E
}

fn main() {
    let mut arr1: Array<u16> = array![10,254,5,3,5,6,25,25,2,5,2];
    let mut arr2: Array<u16> = array![24,6,6,2,5];

    let bigger_array = larger_array(arr1, arr2);
    println!("{}", *bigger_array[0]);

    let mut arr3: Array<u16> = array![25,56,32,1,4,5,34,3,5,2];
    let smallest_value = smallest_element(arr3);
    println!("{}", smallest_value);

    let wallet: Wallet<u256> = Wallet { balance: 50 };
    println!("{}", wallet.balance);
}

fn larger_array<T, impl TDrop: Drop<T>>(arr1: Array<T>, arr2: Array<T>) -> Array<T> {
    if arr1.len() > arr2.len() {
        arr1
    } 
    else {
        arr2
    }
}

fn smallest_element<T, +PartialOrd<T>, +Drop<T>, +Copy<T>>(array: Array<T>) -> T {
    let mut smallest = *array[0];

    let mut index = 1;

    while index < array.len() {
        if *array[index] < smallest {
            smallest = *array[index];
        }

        index += 1;
    };

    return smallest;
}