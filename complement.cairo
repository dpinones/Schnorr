fn get_X_point() -> Secp256K1EcPoint {
    secp256k1_ec_new_syscall(
        u256 { high: 0x243cb3be9e40c561a4bf49215ddc6950, low: 0x51c2cd17e50859e1eb142d12f01e4be7 },
        u256 { high: 0xc0f74cca763e491f25d2ccb2999c772a, low: 0x273ce9ae448b455d8ae6050da528c982 }
    )
        .unwrap_syscall()
        .unwrap()
}

fn get_R_point() -> Secp256K1EcPoint {
    secp256k1_ec_new_syscall(
        u256 { high: 0x9ccfbc6c71bc780800cf32a833a6472b, low: 0xd7f1d7c66914ebb71e74ef0ae10ea485 },
        u256 { high: 0xbc71c90dcfa06a98f6c80dbcde56a803, low: 0xa2637811a97636d4b8bd6d5af1a23b97 }
    )
        .unwrap_syscall()
        .unwrap()
}

fn main () {
    let generator_point = get_generator_point();
    let s_scalar = u256 { high: 0x7562e5757a05e22953aec696f787d82c, low: 0x77a69980d9beb47af85d0f45dc963dda };  
    let sG = secp256k1_ec_mul_syscall(generator_point, s_scalar).unwrap_syscall();

    let X_point = get_X_point();
    let e_scalar = u256 { high: 0x8778f5e37df35b407d81055e8088133a, low: 0xa848f467b80972b74e76f8395b8e1b37 };  
    let eX = secp256k1_ec_mul_syscall(X_point, e_scalar).unwrap_syscall();

    let R_point = get_R_point();
    let R_eX = secp256k1_ec_add_syscall(R_point, eX).unwrap_syscall();

    if sG == R_eX {
       'Verified'.print();
      }
}
