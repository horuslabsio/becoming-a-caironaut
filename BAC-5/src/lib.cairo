use core::dict::{Felt252Dict, Felt252DictEntryTrait};
use core::nullable::{NullableTrait, match_nullable, FromNullableResult};

struct Entry<T> {
    key: felt252,
    previous_value: T,
    new_value: T
}

fn main() {
    let mut balances: Felt252Dict<u64> = Default::default();

    balances.insert('Darlington', 500);
    let bal = balances.get('Darlington');
    println!("Darlington's balance is {}", bal);

    custom_insert(ref balances, 'Darlington', 1000);
    let bal = custom_get(ref balances, 'Darlington');
    println!("Darlington's balance is {}", bal);

    unsupported_types();
    insert_array();
}

fn custom_get<T, +Felt252DictValue<T>, +Drop<T>, +Copy<T>> (
    ref dict: Felt252Dict<T>, key: felt252
) -> T {
    let (entry, prev_value) = dict.entry(key);
    let return_value = prev_value;
    dict = entry.finalize(prev_value);
    return return_value;
}

fn custom_insert<T, +Felt252DictValue<T>, +Destruct<T>, +Drop<T>> (
    ref dict: Felt252Dict<T>, key: felt252, value: T
) {
    let (entry, _) = dict.entry(key);
    dict = entry.finalize(value);
}

fn unsupported_types() {
    let mut dict: Felt252Dict<Nullable<Span<felt252>>> = Default::default();
    let a = array![1, 2, 3].span();
    dict.insert('span', NullableTrait::new(a));

    let value = dict.get('span');
    let result = match match_nullable(value) {
        FromNullableResult::NotNull(x) => x.unbox(),
        FromNullableResult::Null => panic!("value is null!")
    };

    println!("{}, {}, {}", result[0], result[1], result[2]);
}

fn insert_array() {
    let mut dict: Felt252Dict<Nullable<Array<u64>>> = Default::default();
    let b = array![7, 8, 9];
    dict.insert('array', NullableTrait::new(b));

    let arr = get_array(ref dict, 'array');
    println!("{}, {}, {}", arr[0], arr[1], arr[2]);
}

fn get_array(ref dict: Felt252Dict<Nullable<Array<u64>>>, key: felt252) -> Span<u64> {
    let (entry, prev_arr) = dict.entry(key);
    let arr = prev_arr.deref_or(array![]);
    let return_value = arr.span();
    dict = entry.finalize(NullableTrait::new(arr));
    return_value
}