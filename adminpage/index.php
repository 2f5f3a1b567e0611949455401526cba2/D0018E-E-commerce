<?php
    if (isset($_POST["username"]) && $_POST["password"]) {
        $username = htmlspecialchars($_POST["username"]);
        $password = htmlspecialchars($_POST["password"]);
        if ($username == "admin" && $password == "123") {
            $authorized = true;
        } else {
            echo "Fel användarnamn eller lösenord";
        }
    }

    /*if (!isset($authorized)) {
        include("login.php");
        exit;
    }*/
?>

<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Affär admin</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <main>
        <h1>Admin</h1>
        <table>
            <tr>
                <td>ProductID</td>
                <td>Product Name</td>
                <td>Stock</td>
                <td></td>
            </tr>
            <?php
                $names = ["Paint", "Trampoline", "Paper", "Printer", "Ink", "Laser pointer"]; 
                for($i = 0; $i < 6; $i++) {
                    echo "<tr>";
                    echo "<td>$i</td>";
                    $pname = $names[$i];
                    echo "<td>$pname</td>";
                    $stock = (133*$i+2) % 31;
                    echo "<td><div class='stock'><button>-</button><input type='text' value='$stock'><button>+</button></div></td>";
                    echo "<td><a href='edit.php?edit_id=$i'>Edit</a></td>";
                    echo "</tr>";
                }
            ?>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><a href='new.php'>Add new</a></td>
            </tr>
        </table>
    </main>
</body>
</html>