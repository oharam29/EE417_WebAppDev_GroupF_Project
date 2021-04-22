import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.ie.InternetExplorerDriver;

public class LoginTest {

	public static void Main(String[] args) {
		//change this to where project is stored on machine
		String path ="C:\\Users\\Nova6\\eclipse-workspace\\java\\";  
		System.setProperty("webdriver.ie.driver", path+"\\WebTest\\drivers\\IEDriverServer.exe"); 

		//local url for webapp + Instantiate a IEDriver class. 
		String localURL = "http://localhost:10037/";
		WebDriver driver=new InternetExplorerDriver();

		//Applied wait time + maximize window
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.manage().window().maximize();

		//open browser with desried URL
		driver.get(localURL+"GFB/index.html");
		
		//login test
		driver.get(localURL+"/GFB/login.jsp");
		WebElement username = driver.findElement(By.id("uname"));
		username.click();
		username.sendKeys("Adams");
		
		WebElement password = driver.findElement(By.id("password"));
		password.click();
		password.sendKeys("test3");
		
		WebElement login = driver.findElement(By.id("loginbtn"));
		login.click();
		
		System.out.println("Test Passed");
		driver.close();

	}
}
