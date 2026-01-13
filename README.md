---
layout: default
title: Wind Energy Conversion System – MATLAB Simulink
---

## Conception et Commande d'une Chaîne de Conversion d'Énergie Éolienne sur MATLAB/Simulink


Ce dépôt contient les fichiers de modélisation et de simulation d'une chaîne de conversion d'énergie éolienne d'une puissance nominale de 25 kW. Le système repose sur une génératrice de type Machine Synchrone à Aimants Permanents (PMSG) connectée au réseau électrique via une structure de convertisseurs AC-DC-AC.

L'objectif principal est de maximiser l'extraction d'énergie (MPPT) et d'assurer une injection de puissance de haute qualité sur le réseau triphasé, tout en maintenant la stabilité du bus continu.

## Architecture du Système
La simulation intègre les sous-systèmes suivants :
*   **Modèle Aérodynamique** : Turbine éolienne avec gestion de l'angle de calage (Pitch Control).
*   **Génératrice PMSG** : Modélisée dans le repère de Park pour faciliter le contrôle vectoriel.
*   **Convertisseur Côté Machine (MSC)** : Assure le contrôle de la vitesse de rotation et du couple électromagnétique.
*   **Lien Continu (Bus DC)** : Condensateur de filtrage pour stabiliser la tension intermédiaire.
*   **Convertisseur Côté Réseau (GSC)** : Onduleur de tension pilotant l'injection de puissance active et la régulation de la puissance réactive.
*   **Filtre de Sortie et Réseau** : Interface de connexion au réseau électrique triphasé.

## Stratégies de Commande
Le projet met en œuvre plusieurs niveaux de régulation :
*   **Maximum Power Point Tracking (MPPT)** : Utilisation de l'algorithme Perturb and Observe (P&O) adaptatif pour suivre le point de puissance maximale selon les variations du vent.
*   **Contrôle Vectoriel (FOC)** : Commande par flux orienté pour le découplage des courants d et q sur les deux convertisseurs.
*   **Régulation du Bus DC** : Maintien de la tension à une valeur de consigne (700V) pour garantir le transfert de puissance.
*   **Contrôle de l'Injection Réseau** : Asservissement des courants pour une injection à facteur de puissance unitaire (Q = 0).

## Contenu du Dépôt
*   **Chaine_de_conversion_eolienne_25kw.slx** : Modèle principal MATLAB/Simulink.
*   **Parameters.m** : Script MATLAB contenant l'ensemble des paramètres numériques (machine, turbine, régulateurs PI).
*   **Machine.jpg / Turbine.jpg** : Schémas illustratifs des composants du système.*   **LICENSE** : Fichier de licence MIT.

## Instructions d'Utilisation
1.  Cloner le dépôt localement.
2.  Lancer le logiciel MATLAB (version R2024a).
3.  Exécuter le fichier **Parameters.m** dans l'espace de travail (Workspace) pour initialiser les variables.
4.  Ouvrir et lancer la simulation **Chaine_de_conversion_eolienne_25kw.slx**.
5.  Consulter les Scopes pour visualiser les résultats (Vitesse, Tension de bus DC, Courants réseau, Puissances active et réactive).

## Résultats Obtenus
Les simulations valident la robustesse de la commande :
*   Suivi précis de la consigne de vitesse optimale malgré un profil de vent variable.
*   Stabilisation de la tension du bus DC avec un faible taux d'ondulation.
*   Injection de courants sinusoïdaux sur le réseau avec un taux de distorsion harmonique (THD) conforme aux exigences normatives.
