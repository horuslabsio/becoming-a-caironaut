#[derive(Drop)]
struct Cat {
    features: felt252,
    sound: felt252
}

#[derive(Drop)]
struct Dog {
    features: felt252,
    sound: felt252
}

#[derive(Drop)]
struct Cow {
    features: felt252,
    sound: felt252,
}

trait CatTrait {
    fn noise(self: Cat) -> felt252;
}

trait AnimalTrait<T> {
    fn walk(self: T) -> felt252;
    fn noise(self: T) -> felt252;
}

impl CatImpl of CatTrait {
    fn noise(self: Cat) -> felt252 {
        'meow'
    }
}

impl DogImpl of AnimalTrait<Dog> {
    fn walk(self: Dog) -> felt252 {
        'walk'
    }

    fn noise(self: Dog) -> felt252 {
        self.sound
    }
}

impl CowImpl of AnimalTrait<Cow> {
    fn walk(self: Cow) -> felt252 {
        'walk'
    }

    fn noise(self: Cow) -> felt252 {
        self.sound
    }
}

fn main() {
    let cat = Cat { features: 'whiskers', sound: 'meow' };
    println!("{}", cat.noise());

    let dog = Dog { features: 'claw', sound: 'bark' };
    println!("{}", dog.noise());

    let cow = Cow { features: 'breast', sound: 'moot' };
    println!("{}", cow.walk());
}