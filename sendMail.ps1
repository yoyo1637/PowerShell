#Permet de stocker un boolean en cas d'erreur = oui | sans erreur = non
$status_error = $false;

#Permet de detecter une erreur l'or de l'envoie du mail
try{

    #Serveur SMTP utiliser pour envoyer nos mails
    $smtpserver = “adresse_du_serveur_smtp”;

    #Permet d'afficher des informations à l'ecran
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "`t`t`t`t`tConfiguration Envoi de Mail";
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "Serveur SMTP : "$smtpserver;

    #Permet d'initier les instances pour envoyer notre mail
    $msg = new-object Net.Mail.MailMessage;
    $smtp = new-object Net.Mail.SmtpClient($smtpServer);

    #Permet d'activer le SSL
    $smtp.EnableSsl = $True;

    #Permet d'afficher des informations à l'ecran
    Write-Host "SSL : "$smtp.EnableSsl;

    #Connexion au serveur smtp outlook qui demande une authentification
    $smtp.Credentials = New-Object System.Net.NetworkCredential(“adresse_mail”, “mot_de_passe”);

    #Spécifie que notre mail sera au format HTML
    $msg.IsBodyHTML = $true;

    #Permet d'afficher des informations à l'ecran
    Write-Host "Body HTML : "$msg.IsBodyHTML;

    #Permet d'afficher des informations à l'ecran
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "";
    Write-Host "";
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "`t`t`t`t`tEntête du Mail";
    Write-Host "-------------------------------------------------------------------------------------------------------";

    #Permet de signifier l'adresse mail de l'expéditeur
    $msg.From = “adresse_mail_de_l'expediteur”;
    
    #Permet d'afficher des informations à l'ecran
    Write-Host "Expéditeur : "$msg.From;

    #Permet de spécifier le sujet du Mail
    $msg.Subject = $args[0];

    #Permet d'afficher des informations à l'ecran
    Write-Host "Sujet : "$msg.Subject;
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "";
    Write-Host "";
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "`t`t`t`t`tDestinataires du Mail";
    Write-Host "-------------------------------------------------------------------------------------------------------";
    
    #Boucle for qui permet de lister tous les destinataires
    for($i = 2;$i -lt $args.Length;$i++){

        #Permet d'ajouter les destinataires aux cci(Permet de ne pas voir à d'autres personnes le mail à était envoyer en cas d'envoi de mass)
        $msg.Bcc.Add($args[$i]);

        #Variable permet de deduire le numero du destinataire pour savoir combien il y'en a et son rang
        $tmp = $i-1;

        #Permet d'afficher des informations à l'ecran
        Write-Host "Expéditeur n°$tmp : "$args[$i];

    }

    #Permet d'afficher des informations à l'ecran
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "";
    Write-Host "";
    Write-Host "-------------------------------------------------------------------------------------------------------";
    Write-Host "`t`t`t`t`tContenue du Mail";
    Write-Host "-------------------------------------------------------------------------------------------------------";
    
    #Permet de spécifier le contenue du mail au format HTML
    $msg.Body = $args[1];

    #Permet d'afficher des informations à l'ecran
    Write-Host $msg.Body;
    Write-Host "-------------------------------------------------------------------------------------------------------";

    #Envoi du mail
    $smtp.Send($msg);

}catch{

    #En cas d'erreur la variable passe à true
    $status_error = $true;

}

#Permet d'afficher des informations à l'ecran
Write-Host "";
Write-Host "";
Write-Host "-------------------------------------------------------------------------------------------------------";
Write-Host "`t`t`t`t`tStatu du Mail";
Write-Host "-------------------------------------------------------------------------------------------------------";

#Verifie si une erreur s'est produit lors de l'envoi grace à la variable $status_error
if($status_error){

    #Permet d'afficher des informations à l'ecran si il y'a une erreur l'or de l'envoi du mail
    Write-Host "Erreur ! Le mail n'a pas pu être envoyer !";
    Write-Output "Erreur";

}else{

    #Permet d'afficher des informations à l'ecran que le mail à etait envoyer
    Write-Host "Le Mail à été envoyer !";
    Write-Output "OK";

}

#Permet d'afficher des informations
Write-Host "-------------------------------------------------------------------------------------------------------";