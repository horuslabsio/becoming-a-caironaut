use testing::add_two_numbers;

fn setup() -> (u16, u16) {
    let x = 20;
    let y = 10;
    return (x, y);
}

#[test]
fn test_add_number_function() {
    let (x, y) = setup();
    let result = add_two_numbers(x, y);
    assert_eq!(result, 30, "Expected {}, got {}", 30, 10);
    assert_ge!(result, 30);
    assert_gt!(result, 20);
    assert_lt!(result, 40);
    assert_ne!(result, 10);
}