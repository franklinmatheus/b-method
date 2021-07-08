/* RobustLocks
 * Author: Franklin
 * Creation date: 26/10/2020
 */
MACHINE RobustLocks
    
INCLUDES Locks
    
SETS REPORT = {ok, error}
    
OPERATIONS
    
    ans <-- robustopen(dd) =
        PRE dd : DOOR
        THEN IF status(dd) = unlocked
             THEN opendoor(dd) || ans := ok
             ELSE ans := error
             END
        END;
        
    ans <-- robustclose(dd) =
        PRE dd : DOOR
        THEN IF position(dd) = open
             THEN quickclose(dd) || ans := ok
             ELSE ans := error
             END
        END;
    
    ans <-- robustunlock(dd) =
        PRE dd : DOOR
        THEN IF position(dd) = closed
             THEN unlockdoor(dd) || ans := ok
             ELSE ans := error
             END
        END;
    
    ans <-- robustlock(dd) =
        PRE dd : DOOR
        THEN IF position(dd) = closed
             THEN lockdoor(dd) || ans := ok
             ELSE ans := error
             END
        END

END
