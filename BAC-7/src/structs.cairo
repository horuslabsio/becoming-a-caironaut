#[derive(Drop)]
struct User {
    username: ByteArray,
    age: u8,
    gender: ByteArray
}

fn main() {
    let darlington = create_user("0xdarlington", 22, "male");
    let _chioma = create_user("0xchioma", 19, "female");
    let emeka = User { username: "0xemeka", ..darlington };

    let _darlington_age = darlington.age;
    let emeka_age = emeka.age;
    println!("emeka's age is {}", emeka_age);
}

fn create_user(username: ByteArray, age: u8, gender: ByteArray) -> User {
    User { username, age, gender }
}