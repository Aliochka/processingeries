class Agent
{
    // Attributs de la classe
    PVector position; // Position de l'agent
    PVector previousPosition; // Stockage de la position précédente (pour le dessin)
    float stepSize; // Incrément de déplacement (= vitesse de base de l'agent)
    float angle; // Angle de déplacement de l'agent
    boolean isPositionResetWhenOutside; // Permet d'activer ou non la réinitialisation de la position de l'agent lorsqu'il quitte l'espace du sketch

    // Le constucteur par défaut de la classe
    Agent()
    {
        position = new PVector(random(width), random(height)); // Position aléatoire
        previousPosition = position.get(); // Attention à bien copier le PVector avec la méthode 'get()';
        angle = random(2 * PI); // Angle aléatoire
        stepSize = field.minimizer;
        isPositionResetWhenOutside = true;
    }

    Agent(PVector position)
    {
        this(); // Appel du constructeur par défaut pour initialiser tous les attributs
        this.position = position; // Mise à jour de l'attribut position avec l'argument 'position' passé au constructeur. Comme l'argument du constructeur et l'attribut ont le même nom, on identifie l'attribut en le faisant précéder de 'this.'
        previousPosition = position.get();
    }

    void updatePosition()
    {
        previousPosition = position.get(); // Sauvegarde de la position précédente
        position.x += cos(angle) * stepSize;
        position.y += sin(angle) * stepSize;
        int i = 0;
        float newAngle = angle;
        boolean isOccupied = field.isOccupied(position);
        int tryByLeftOrRight = random(-1,1) > 0 ? 1 : -1;
        while (isOccupied && (i <= 9)) {
          newAngle += tryByLeftOrRight * (i * 2 * PI / 9);
          position.x = previousPosition.x + cos(newAngle) * stepSize;
          position.y = previousPosition.y + sin(newAngle) * stepSize;
          i++;
          isOccupied = field.isOccupied(position);
        }
        angle = newAngle;
        if (isPositionResetWhenOutside && isOutsideSketch() > 0)
        {
            angle = random(2 * PI);
            // position = new PVector(random(width), random(height)); // Si l'agent sort du sketch, on lui attribue une nouvelle position aléatoire
            previousPosition = position.get();
        }
        field.occupy(int(position.x), int(position.y));
    }

    int isOutsideSketch()
    {
      // 1: l'agent est sorti par le haut
        if (position.y < 0)
        {
            return 1;
        }
        // 2: l'agent est sorti par la droite
        else if (position.x > width)
        {
            return 2;
        }
        // 3: l'agent est sorti par le bas
        else if (position.y > height)
        {
            return 3;
        }
        // 4: l'agent est sorti par la gauche
        else if (position.x < 0)
        {
            return 4;
        }
        // 0: l'agent n'est pas sorti des limites de l'espace du sketch
        else
        {
            return 0;
        }
    }
}
