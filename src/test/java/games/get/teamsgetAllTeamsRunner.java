package players.get;

import com.intuit.karate.junit5.Karate;

class teamsgetAllTeamsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("teams-get-all_teams").relativeTo(getClass());
    }
}
