Payment Module : Mobikwik Wallet
***********************************************************************
   
Mobikwik Wallet - Adding money to your wallet lets you pay for your services and recharges in just one click, or even via SMS or by dialling a number.

Our aim is to solve the payment pain points for eCommerce in India.
		
***********************************************************************

Instruction:
Please fill your merchant id and secret key in file return_process.aspx. In case on testing mode, they are prefilled. 

DESCRIPTION :

Whole payment test which can be made on test server with prefilled details or on live with details u received from mobikwik after your merchant acount is activated . To use this flow you have to open up index.aspx file.   

* index.aspx - This is a sample form where you have to insert the User's order id, amount, email, merchantname, 
Merchant Id. Merchant ID is prefilled for testing mode. 
If you want to run this code live, then you need to select the "live" radio button and insert your Merchant Id instead of the test merchant id.
			  
* prepare.aspx - An intermediate page, where the payment and verification URL are decided according to the mode selected by you.  Please insert your secret key in this file. 

* return_process.aspx - Here verification of the response received is done and response received is printed. Please insert your secret key in this file. 
	This response is received as an XML file with parameters: 
		1. Status Code: 0 for success, and not 0 for error. 
		2. Status message: Success or Failure. 
		3. Order Id
		4. Ref Id
		5. Amount
		6. Order type
		7. Checksum
	In this verification process, the checksum received, amount received and received order id are compared to the ones we sent.
	
************************************************************************
Note: To get Mobikwik wallet Merchant Id and Secret Key, you need to signup at http://wallet.mobikwik.com and fill in the details under integration tab. 
As you fill in all the required details, you will be provided with a merchant id and a secret key that will be generated there at http://wallet.mobikwik.com  
		
***********************************************************************
