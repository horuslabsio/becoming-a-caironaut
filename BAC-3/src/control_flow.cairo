fn main() {
    // if construct
    let number = 7;

    if number == 10 {
        println!("the number is 10");
    }
    else if number == 5 {
        println!("the number is 5");
    }
    else {
        println!("wrong number!");
    }

    let x = if number == 5 { number } else { 6 };
    println!("{}", x);

    let mut i: u32 = 0;

    let x = loop {
        if i > 10 {
            break i;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("{}", i);
        i += 1;
    };

    println!("{}", x);

    // while construct
    let mut number = 5;

    while number != 0 {
        println!("Hello world");
        number -= 1;
    };

    // for construct
    let arr = [1, 2, 3, 4, 5].span();
    for i in arr {
        println!("{}", i);
    };

    // recursive function
    let y = recursive_function(0);
    println!("{}", y);
}

fn recursive_function(x: u32) -> u32 {
    if x > 10 {
        println!("{}", x);
        x
    }
    else {
        println!("{}", x);
        recursive_function(x + 1)
    }
}