# SCRIPT DE CREATION D'UTILISATEURS POD4

Yannis Bruneau, Tim Burgess

## Fichier CSV

> [!NOTE]  
> Suivre le format suivant:
> ```Username;Group;OUDC
> testuser;testgroup;OU=users-pod4,DC=tlpod4,DC=local
> itTech;IT;OU=OU-IT,OU=users-pod4,DC=tlpod4,DC=local
> ```

## Script

> [!CAUTION] 
> ATTENTION: Executer le script avec Powershell 7 !!!

- Inserer le MDP pour tous les utilisateurs
- Inserer le fichier CSV sous forme de chemin
- Laisser s'executer le script pour chaque utilisateur
