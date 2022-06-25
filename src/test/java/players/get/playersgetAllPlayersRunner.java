package check.get;

import com.intuit.karate.junit5.Karate;

class playersgetAllPlayersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("players-get-all_players").relativeTo(getClass());
    }
}
