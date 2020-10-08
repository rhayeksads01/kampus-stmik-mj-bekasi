<html>

<head>
    <title>latihan menggunakan pemilihan</title>
</head>

<body>
    <?php
    $a = 5;
    $b = 15;
    if ($a > $b)
        echo "a lebih besar dari b";
    else
        echo "a sama atau lebih kecil dari b";
    ?>
    <br>
    <?php
    $harga = 1500;
    switch ($harga) {
        case 2000;
            echo "harganya mahal";
            break;
        case 1500;
            echo "harganya murah";
            break;
        default:
            echo "saya tidak tahu";
    }
    ?>
</body>

</html>