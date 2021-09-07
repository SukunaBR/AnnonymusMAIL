<?php 

// github: https://github.com/SukunaBR

if ($_POST)
{

    $to = $_POST['destinatario'];
    $subject = $_POST['assunto'];
    $message = $_POST['mensagem'];
    $from = $_POST['remetente'];
    $headers = "A partir de: ".$from;

    $mail = mail($to,$subject,$message,$headers,$from);

if($mail) 

{
    echo "Email enviado a ".$to;
}

}
?>