package check.get;

import com.intuit.karate.junit5.Karate;

class playersgetplayer {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("players-get-player").relativeTo(getClass());
    }

}
