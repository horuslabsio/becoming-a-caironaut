mod garden;
mod fruit;
mod vegetables;

mod gardener {
    use veggie_garden::garden::vegetables::{
        VEGETABLE as veggies,
        leafy_veggies::SPINACH,
        root_veggies::CARROT,
    };
    use veggie_garden::fruit::{orange::Orange::ORANGE, apple::Apple::APPLE};
    use veggie_garden::vegetables::{lettuce::Lettuce::LETTUCE, spinach::Spinach::SPINACH as veggie_spinach};

    pub struct Fruits {
        pub apple: felt252,
        pub orange: felt252
    }

    fn main() {
        println!("{}", veggies);
        println!("{}", SPINACH);
        println!("{}", CARROT);
        println!("Apple: {}", APPLE);
        println!("Orange: {}", ORANGE);
        println!("Lettuce: {}", LETTUCE);
        println!("Spinach: {}", veggie_spinach);
    }
}