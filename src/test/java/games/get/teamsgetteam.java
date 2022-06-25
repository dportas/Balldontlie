package check.get;

import com.intuit.karate.junit5.Karate;

class teamsgetteam {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("teams-get-team").relativeTo(getClass());
    }

}
