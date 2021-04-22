import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.ie.InternetExplorerDriver;

class RegisterTest {

	public static void main(String[] args) {
		//change this to where project is stored on machine
		String path ="C:\\Users\\Nova6\\eclipse-workspace\\java\\"; 
		System.setProperty("webdriver.ie.driver", path+"\\WebTest\\drivers\\IEDriverServer.exe"); 

		//local url for webapp + Instantiate a IEDriver class. 
		String localURL = "http://localhost:10037/";
		WebDriver driver=new InternetExplorerDriver();

		//Applied wait time + maximize window
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.manage().window().maximize();

		//open browser with desired URL
		driver.get(localURL+"/GFB/index.html");
			
		driver.get(localURL+"/GFB/register_pages/registerPage.jsp");
		
		//Personal info
		WebElement fname = driver.findElement(By.id("fname"));
		fname.click();
		fname.sendKeys("Mike");
		
		WebElement lname = driver.findElement(By.id("lname"));
		lname.click();
		lname.sendKeys("OHara");
		
		WebElement email = driver.findElement(By.id("mail"));
		email.click();
		email.sendKeys("mike@mail.dcu.ie");
				
		WebElement DOB = driver.findElement(By.id("dateBirth"));
		DOB.click();
		DOB.sendKeys("01/04/1998");
				
		WebElement continueBtn = driver.findElement(By.id("btnContinue"));
		continueBtn.click();
		
		
		//check new page is correct
		String URL = driver.getCurrentUrl();
		if(URL == localURL+"/GFB/register_pages/mobilePhoneNumber.jsp" ) {
			//mobile phone
			WebElement phoneNo = driver.findElement(By.id("phone"));
			phoneNo.click();
			phoneNo.sendKeys("0861234567");
			
			continueBtn.click();
		}
		else {
			System.out.println("Incrrect URL");
		}
		
		//check new page is correct
		URL = driver.getCurrentUrl();
		if(URL == localURL+"/GFB/register_pages/homeAddress.jsp" ) {
			//mobile phone
			WebElement houseNum = driver.findElement(By.id("houseNum"));
			houseNum.click();
			houseNum.sendKeys("0");
			
			WebElement streetName = driver.findElement(By.id("streetName"));
			streetName.click();
			streetName.sendKeys("seacrest");
			
			WebElement address1 = driver.findElement(By.id("address1"));
			address1.click();
			address1.sendKeys("k12345");
			
			WebElement address2 = driver.findElement(By.id("address2"));
			address2.click();
			address2.sendKeys("glasnevin");
			
			WebElement address3 = driver.findElement(By.id("address3"));
			address3.click();
			address3.sendKeys("ireland");
			
			
			WebElement additionalInformation = driver.findElement(By.id("additionalInformation"));
			additionalInformation.click();
			additionalInformation.sendKeys("dublin");
			
			
			continueBtn.click();
		}
		else {
			System.out.println("Incrrect URL");
		}
		
		//check new page is correct
		URL = driver.getCurrentUrl();
		if(URL == localURL+"/GFB/register_pages/additionalInformation.jsp" ) {
			//mobile phone
			WebElement nationality = driver.findElement(By.id("nationality"));
			nationality.click();
			nationality.sendKeys("irish");
			
			WebElement cityBirth = driver.findElement(By.id("cityBirth"));
			cityBirth.click();
			cityBirth.sendKeys("dublin");
			
			WebElement countryBirth = driver.findElement(By.id("countryBirth"));
			countryBirth.click();
			countryBirth.sendKeys("ireland");
			
			
			WebElement gender1 = driver.findElement(By.id("gender1"));
			gender1.click();
			
			continueBtn.click();
		}
		else {
			System.out.println("Incrrect URL");
		}
		
		//check new page is correct
		URL = driver.getCurrentUrl();
		if(URL == localURL+"/GFB/register_pages/createPassword.jsp" ) {
			//mobile phone
			WebElement pwd = driver.findElement(By.id("pwd"));
			pwd.click();
			pwd.sendKeys("Password1!");
			
			continueBtn.click();
		}
		else {
			System.out.println("Incrrect URL");
		}
		
		//check new page is correct
		String URL = driver.getCurrentUrl();
		if(URL == localURL+"/GFB/register_pages/createAccount.jsp" ) {
			//mobile phone
			WebElement TC = driver.findElement(By.id("TC"));
			TC.click();
			
			WebElement PP = driver.findElement(By.id("PP"));
			PP.click();
			
			WebElement CV = driver.findElement(By.id("CV"));
			CV.click();
			
			WebElement PU = driver.findElement(By.id("PU"));
			PU.click();
			
			WebElement MP = driver.findElement(By.id("MP"));
			MP.click();
			
			continueBtn.click();
		}
		else {
			System.out.println("Incrrect URL");
		}
		
		
		System.out.println("Test Passed");
		driver.close();

	}
	
	 
}
