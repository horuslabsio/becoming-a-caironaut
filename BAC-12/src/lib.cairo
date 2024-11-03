pub fn add_two_numbers(x: u16, y: u16) -> u16 {
    x + y
}

#[cfg(test)]
mod test {
    use super::add_two_numbers;

    #[test]
    fn test_add_number_function() {
        let result = add_two_numbers(20, 10);
        assert_eq!(result, 30, "Expected {}, got {}", 30, 10);
        assert_ge!(result, 30);
        assert_gt!(result, 20);
        assert_lt!(result, 40);
        assert_ne!(result, 10);
    }

    #[test]
    #[available_gas(2000000)]
    fn test_sub_number_function() {
        let result = add_two_numbers(20, 10);
        assert_eq!(result, 30, "Expected {}, got {}", 30, 10);
        assert_ge!(result, 30);
        assert_gt!(result, 20);
        assert_lt!(result, 40);
        assert_ne!(result, 10);
    }
}