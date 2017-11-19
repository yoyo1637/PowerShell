# PowerShell
Voici tous les script powershell que j'ai ecrit pour differentes utilisations

# Sommaire
* ### [1 - Script permettant d'envoyer des mails](https://github.com/yoyo1637/PowerShell/blob/master/README.md#1---script-permettant-denvoyer-des-mails)

## 1 - Script permettant d'envoyer des mails
### a ) Description du script
Ce script permet d'envoyer des mails avec un script powershell, très utile en scripting pour envoyer un rapport ou autres messages important. Ce script s'adapte théoriquement à tous serveur smtp, de plus le script est conçu pour utiliser le SSL, ce qui permet de chiffrer les échanges mail. Le support html permet une mise en forme du message. Il respecte les normes html, on peut y inclure aussi css.

Etat du script: `Dévéloppement terminé`

### b ) L'execution du script
Le script s'execute avec des arguments, qui sont:
   * L'objet du mail
   * Contenue du mail
   * Destinataire(s) du mail

Voici la systaxe d'execution du script
```
powershell sendMail.ps1 <Object du mail> <Message en html/css> <destinataire 1> <destinataire 2> ... <destinataire n>
```

### c ) Téléchargement du script
Lien du script : [sendMail.ps1](https://github.com/yoyo1637/PowerShell/blob/master/sendMail.ps1)
