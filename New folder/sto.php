<?php
// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $amount = $_POST['amount'];
    $message = $_POST['message'];

    // Store the data in the database
    $database = new SQLite3('fund_data.db');
    $database->exec("
        CREATE TABLE IF NOT EXISTS fund_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            amount REAL,
            message TEXT
        )
    ");
    $database->exec("
        INSERT INTO fund_data (name, email, amount, message)
        VALUES ('$name', '$email', $amount, '$message')
    ");
    $database->close();

    // Redirect to a thank you page or display a success message
    header('Location: thank_you.html');
    exit();
}
?>
