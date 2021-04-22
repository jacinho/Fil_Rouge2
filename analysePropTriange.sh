
echo "Le pourcentage de Triangle Isocèle :"

winpty mysql -u root -D "filrouge" -se"SELECT (COUNT(*)/ (SELECT COUNT(*) FROM triangle))*100 as Pourcentage  FROM triangle WHERE (COTE_A = COTE_B AND COTE_B != COTE_C) OR (COTE_B = COTE_C AND COTE_A != COTE_B) OR (COTE_A = COTE_C AND COTE_A != COTE_B)" ;

echo "Le pourcentage de Triangle Equilatéral :"

winpty mysql -u root -D "filrouge" -se"SELECT (COUNT(*)/ (SELECT COUNT(*) FROM triangle))*100 as Pourcentage FROM triangle WHERE (COTE_A = COTE_B AND COTE_B = COTE_C)";

echo "Le pourcentage de Triangle Quelconque :"

winpty mysql -u root -D "filrouge" -se"SELECT (COUNT(*)/ (SELECT COUNT(*) FROM triangle))*100 as Pourcentage FROM triangle WHERE (COTE_A != COTE_B AND COTE_B != COTE_C AND COTE_A != COTE_C)";
