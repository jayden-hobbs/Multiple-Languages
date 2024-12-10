use std::io;  // Correct import for reading input

fn main() {
    println!("Welcome to the Rock-Paper-Scissors game!");
    
    // Game logic here

    // Wait for the user to press Enter before closing
    println!("Press Enter to exit...");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
}
