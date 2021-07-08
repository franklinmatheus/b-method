/* Keys
 * Author: Franklin
 * Creation date: 26/10/2020
 */
MACHINE           Keys

SETS              KEY

VARIABLES         keys

INVARIANT         keys <: KEY

INITIALISATION    keys := {}

OPERATIONS

  insertkey(kk) =
  PRE kk : KEY THEN keys := keys \/ {kk} END;

  removekey(kk) =
  PRE kk : KEY THEN keys := keys - {kk} END

END
