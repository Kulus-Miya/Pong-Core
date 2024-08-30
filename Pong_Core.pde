/*
 * Description de Pong_Core.pde
 *
 * @author Miya
 * Creation 04/2019
 * Derniere MAJ 30/08/2024
 * License : M.I.T 
 *
 * Programme sous Proccesing 3 en JAVA permettant de jouer au jeu pong.
 */

int balleY, balleX = 250;
int directionY = 2;
int directionX = 3;
int vie = 3;

void setup() {
    size(500, 500);
}

void draw() {
    if (vie != 0) {
        background(1);

        //Dessine la raquette et la balle
        fill(255);
        rect(20, mouseY, 15, 60);
        ellipse(balleX, balleY, 15, 15);

        // Update la position la balle
        balleY = balleY + directionY;
        balleX = balleX + directionX;

        //Gestion des collision avec les murs
        if (balleX > 485) {
            directionX -= 2;
        }
        if (balleY > 485) {
            directionY -= 3;
        }
        if (balleY < 15) {
            directionY += 2;
        }
        // Si la balle sort du côté gauche (perte d'une vie et reset balle)
        if (balleX < 0) {
            vie--;
            resetBalle();

        }
        // Gestion des collisions avec la raquette
        if (balleY > mouseY - 10 && (balleY < mouseY + 70) && (balleX > 15) && (balleX < 45)) {
            directionX += 3; // Fait rebondir la balle en changeant sa direction
        }

    } else {
        background(255);
    }
}

// Réinitialise la position et la direction de la balle
void resetBalle() {
    directionX = 3;
    directionY = 2;
    balleX = 250;
    balleY = 250;
}

// Réinitialisation du jeu avec un clic de souris
void mouseClicked() {
    if (vie == 0) {
        vie = 3;
    }
}