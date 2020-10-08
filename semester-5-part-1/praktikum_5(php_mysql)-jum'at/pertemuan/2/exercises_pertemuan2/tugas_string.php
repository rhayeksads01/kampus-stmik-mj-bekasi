<html>

<head>
    <title>latihan menggunakan string</title>
</head>

<body>
    <?php
    $string1 = "string kesatu";
    echo $string1 . "<br>";
    $string2 = "string kedua";
    echo $string1 . "<br>";
    $stringgabung = $string1 . $string2;
    echo $stringgabung . "<br>";
    $pjgstring = strlen("string1");
    echo $pjgstring . "<br>";
    $stringawal = "string kesatu";
    $stringbaru = ltrim($stringawal);
    echo $stringbaru . "<br>";
    ?>
</body>

</html>