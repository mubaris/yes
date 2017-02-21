use std::env;

#[allow(while_true)]
fn main() {
    let args: Vec<String> = env::args().collect();

    match args.len() {
        1 => {
            while true {
                println!("yes");
            }
        },
        _ => {
            while true {
                println!("{}", args[1]);
            }
        },
    }
}
