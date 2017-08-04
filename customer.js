var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "bamazonDB"
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId + "\n");
    // run the start function after the connection is made to prompt the user
    start();
});

var start = function() {
    console.log("");
    console.log("******************************");
    console.log("Welcome to the Bamazon");
    console.log("******************************");

    inquirer.prompt({
        name: "action",
        type: "confirm",
        message: "Would you like to place an order?",
        default: true 
    }).then(function(answer) {

        if (answer.action) {
            idItemList()
        } else {
            process.exit();
        }
    });
}

function idItemList() {
    connection.query("SELECT * FROM products", function(err, res) {
        if (err) throw err;
        inquirer.prompt([{
                    name: "choice",
                    type: "rawlist",
                    choices: function() {
                        var choiceArray = [];
                        for (i = 0; i < res.length; i++) {
                            choiceArray.push(res[i].product_name);
                        }
                        return choiceArray;
                    },
                    message: "What would you like to buy?"
                },
                {
                    name: "buy",
                    type: "input",
                    message: "What quantity would you like?"
                }
            ])
            .then(function(answer) {
                var chosenItem;
                for (var i = 0; i < res.length; i++) {
                    if (res[i].product_name === answer.choice) {
                        chosenItem = res[i];
                    }
                }

                if (chosenItem.stock_quantity > parseInt(answer.buy)) {
                    connection.query(
                        "UPDATE products SET ? WHERE ?", [{
                                stock_quantity: answer.buy
                            },
                            {
                                id: chosenItem.id
                            }
                        ],
                        function(err) {
                            if (err) throw err;
                            console.log("Congratulations! Your order is placed! The amount you owe is: " + answer.buy*chosenItem.price);
                            start();
                        }
                    );
                } else {
                    console.log("Our appologies. The quantity requested is unavailable.");
                    start();
                }
            });
    });
}