package check;

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import java.util.List;
import com.intuit.karate.Results;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;



public class ManagementTest {

    @Test
    void testParallel(){
        Results results = Runner.path("classpath:teams")
                .outputCucumberJson(true)
                .tags("~@ignore")
                .parallel(4);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
