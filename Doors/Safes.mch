/* Safes
 * Author: Franklin
 * Creation date: 26/10/2020
 */
MACHINE           Safes

INCLUDES          Locks, Keys

PROMOTES          opendoor, closedoor, lockdoor

VARIABLES         masterkey, unlocks

INVARIANT         unlocks : KEY >+> DOOR & status~[{unlocked}] <: unlocks[keys] & masterkey : NAT
    
INITIALISATION    masterkey := 0 || unlocks := {}

OPERATIONS

insert(kk,dd,mk) =
  PRE kk : KEY & dd : DOOR & unlocks(kk) = dd & mk : NAT & mk = masterkey
  THEN insertkey(kk)
  END;

extract(kk,dd,mk) =
  PRE kk : KEY & dd : DOOR & unlocks(kk) = dd & status(dd) = locked & mk : NAT & mk = masterkey
  THEN removekey(kk)
  END;

unlock(dd) =
  PRE dd : DOOR & unlocks~(dd) : keys
  THEN unlockdoor(dd)
  END;

quicklock(dd) =
  PRE dd : DOOR & position(dd) = closed
  THEN lockdoor(dd) || removekey(unlocks~(dd))
  END;
  
quickcloseandlock(dd) =
  PRE dd : DOOR & position(dd) = open
  THEN quickclose(dd)
  END;
  
insertmaster(kk) =
  PRE kk : NAT & kk /= 0 & masterkey = 0
  THEN masterkey := kk
  END;
  
removemaster =
  PRE masterkey /= 0
  THEN masterkey := 0
  END;
  
allocate(kk,dd) =
  PRE kk : KEY & dd : DOOR & kk /: dom(unlocks) & dd /: ran(unlocks)
  THEN unlocks := unlocks \/ {kk |-> dd} || insertkey(kk)
  END;
  
deallocate(kk,dd) =
  PRE kk : KEY & kk : dom(unlocks) & dd : DOOR & dd : ran(unlocks)
  THEN unlocks := unlocks - {kk |-> dd} || removekey(kk)
  END

END
