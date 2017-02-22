use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let args = &args[1..];

    let output = if args.is_empty() { "y".to_string() } else { args.join(" ") };
    loop {
        println!("{}", output)
    }
}
