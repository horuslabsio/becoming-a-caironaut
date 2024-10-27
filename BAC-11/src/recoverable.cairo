fn parse_u8(value: felt252) -> Result<u8, felt252> {
    match value.try_into() {
        Option::Some(value) => Result::Ok(value),
        Option::None => Result::Err('Invalid integer')
    }
}

fn do_something_with_parse_u8(input: felt252) -> Result<u8, felt252> {
    let input_to_u8 = parse_u8(input)?;
    let res = input_to_u8 - 1;
    Result::Ok(res)
}

#[cfg(test)]
mod test {
    use super::parse_u8;

    #[test]
    fn test_felt252_to_u8_is_successful() {
        let value: felt252 = 7;
        let _res = parse_u8(value).unwrap();
    }

    #[test]
    #[should_panic]
    fn test_felt252_to_u8_is_unsuccessful() {
        let value: felt252 = 24445;
        let _res = parse_u8(value).unwrap();
    }
}