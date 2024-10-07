#[derive(Drop)]
enum Colors {
    Red,
    Green,
    Blue
}

#[derive(Drop)]
enum Direction {
    North: u64,
    East: u64,
    West: u64,
    South: u64,
    NorthEast: NorthEast
}

#[derive(Drop)]
struct NorthEast {
    north: u64,
    east: u64,
}

trait MoveTrait {
    fn move(self: Direction);
}

impl MoveImpl of MoveTrait {
    fn move(self: Direction) {
        println!("you just moved!");
    }
}

fn main() {
    let _color = Colors::Red;
    let north = Direction::North(30);
    let _north_east = Direction::NorthEast( NorthEast { north: 30, east: 70 } );

    north.move();

    // using the option type
    let mut arr: Array<felt252> = array![];

    match arr.pop_front() {
        Option::Some(x) => println!("the value is {}", x),
        Option::None => println!("array contains no value!")
    };

    // using the match expression
    let west = Direction::West(70);
    get_direction(west);

    // matching against other data types
    roll_dice(300);

    // if_let
    if_let();

    // while_let
    while_let();
}

fn get_direction(direction: Direction) {
    match direction {
        Direction::North(north) => println!("the direction is north at degree {}", north),
        Direction::East | Direction::West => println!("the direction is east or west"),
        Direction::South => println!("the direction is south"),
        Direction::NorthEast(northeast) => {
            println!("the direction is north-east at east degree: {}", northeast.east)
        }
    };
}

fn roll_dice(value: felt252) {
    // felt252s and integers
    // 1. the value of integer has to fit in a felt252
    // 2. the first value must always be 0
    // 3. you must actually use the _ placeholder
    match value {
        0 | 1 | 2 => println!("you won!"),
        3 | 4 => println!("roll again!"),
        _ => println!("oops! you lost!")
    }
}

fn if_let() {
    let number = Option::Some(2);
    if let Option::Some(x) = number {
        println!("you won! with value {}", x);
    }
}

fn while_let() {
    let mut arr = array![1, 2, 3];
    let mut sum = 0;

    while let Option::Some(x) = arr.pop_front() {
        sum += x;
    };

    println!("total sum is {}", sum);
}