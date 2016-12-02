using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
//using System.Transactions;
using System.Net;
using System.Net.Mail;
/// <summary>
/// Summary description for Ccommon
/// </summary>
public class CrmClass
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection LocalConn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string error = "";
  
    public void LocalConnection_Class(SqlConnection Localconn)
    {
        try
        {
            if (Localconn.State == ConnectionState.Open)
            {
                return;
            }
            else
            {
                Localconn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                Localconn.Open();
            }
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
    }

    
    public DataSet RegisterWebClient(int ClientID, string FirstName, string LastName,  string EmailID, string Password, string EmailActivationCode, string MobileOTP, string ClientType, string CompanyName, string WebUrl, string Loyalty,string MobileNo)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("RegisterWebClient", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@Fname", SqlDbType.NVarChar).Value = FirstName;
            cmd.Parameters.Add("@LName", SqlDbType.NVarChar).Value = LastName;
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = EmailID;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = Password;
            cmd.Parameters.Add("@ActivationCode", SqlDbType.NVarChar, 100).Value = EmailActivationCode;
            cmd.Parameters.Add("@OTP", SqlDbType.NVarChar, 5).Value = MobileOTP;
            cmd.Parameters.Add("@ClientType", SqlDbType.Char, 1).Value = ClientType;
            cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar, 50).Value = CompanyName;
            cmd.Parameters.Add("@WebUrl", SqlDbType.NVarChar, 500).Value = WebUrl;
            cmd.Parameters.Add("@Loyalty", SqlDbType.Char, 1).Value = Loyalty;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 10).Value = MobileNo;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public string SendActivationEmail(string RecipantEmailID,string RecipantName, string EmailBody )
    {
        string ans = "N";


        MailAddress from = new MailAddress("task@russsh.com", "RUSSSH");
        MailAddress toemail = new MailAddress(RecipantEmailID, RecipantName);

        System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage(from, toemail);

        Email1.Subject = "Welcome to RUSSSH";
       
        Email1.Body = EmailBody;
        Email1.IsBodyHtml = true;


        Email1.Sender = new MailAddress("task@russsh.com", "RUSSSH");
        Email1.Priority = System.Net.Mail.MailPriority.High;
        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Russsh1380");
        mailClient.UseDefaultCredentials = true;
        mailClient.Host = "us2.smtp.mailhostbox.com";
        mailClient.Port = 25;
        mailClient.EnableSsl = true;
        mailClient.Credentials = basicAuthenticationInfo;

        try
        {
            mailClient.Send(Email1);
            ans="Y";
        }
        catch (Exception ee)
        {
            error = ee.ToString();
            ans="N";
        }


        return ans;
    }

    public string SendConfirmationEmail(string RecipantEmailID, string RecipantName, string EmailBody)
    {
        string ans = "N";


        MailAddress from = new MailAddress("task@russsh.com", "RUSSSH");
        MailAddress toemail = new MailAddress(RecipantEmailID, RecipantName);

        System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage(from, toemail);

        Email1.Subject = "Account Details -RUSSSH";

        Email1.Body = EmailBody;
        Email1.IsBodyHtml = true;


        Email1.Sender = new MailAddress("task@russsh.com", "RUSSSH");
        Email1.Priority = System.Net.Mail.MailPriority.High;
        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Russsh1380");
        mailClient.UseDefaultCredentials = true;
        mailClient.Host = "us2.smtp.mailhostbox.com";
        mailClient.Port = 25;
        mailClient.EnableSsl = true;
        mailClient.Credentials = basicAuthenticationInfo;

        try
        {
            mailClient.Send(Email1);
            ans = "Y";
        }
        catch (Exception ee)
        {
            error = ee.ToString();
            ans = "N";
        }


        return ans;
    }


    public DataSet ActivateAccount(string ActivationCode)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("ActivateAccount", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ActivationCode", SqlDbType.VarChar,250).Value = ActivationCode;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet ValidateClientLogin(string EmailID,string Password)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("ValidateClientLogin", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmailID", SqlDbType.VarChar, 100).Value = EmailID;
            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 100).Value = Password;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet Crm_GetProfileView(int ClientID)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("usp_CrmGetProfileData", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet Crm_SaveProfile(int ClientID, string FirstName, string MiddleName, string LastName, 
        string EmailID, string DateOfBirth, string  MobileNo, int Gender, string Occupation, string Organisation, 
        int MartialStatus, string AnniversaryDate, string Street, string Address, string AreaName, string CityName, string PinCode, string ProfileImage)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("usp_CrmSaveProfile", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar, 50).Value = FirstName;
            cmd.Parameters.Add("@MiddleName", SqlDbType.VarChar, 50).Value = MiddleName;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = LastName;
            cmd.Parameters.Add("@EmailID", SqlDbType.VarChar, 50).Value = EmailID;
            cmd.Parameters.Add("@DateofBirth", SqlDbType.VarChar, 50).Value = DateOfBirth;
            cmd.Parameters.Add("@MobileNO", SqlDbType.VarChar, 50).Value = MobileNo;
            cmd.Parameters.Add("@Gender", SqlDbType.Int).Value = Gender;
            cmd.Parameters.Add("@Occupation", SqlDbType.VarChar, 50).Value = Occupation;
            cmd.Parameters.Add("@Organisation", SqlDbType.VarChar, 50).Value = Organisation;
            cmd.Parameters.Add("@MartialStatus", SqlDbType.Int).Value = MartialStatus;
            cmd.Parameters.Add("@AnniversaryDate", SqlDbType.VarChar, 50).Value = AnniversaryDate;
            cmd.Parameters.Add("@Street", SqlDbType.NVarChar).Value = Street;
            cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = Address;
            cmd.Parameters.Add("@Area", SqlDbType.NVarChar,50).Value = AreaName;
            cmd.Parameters.Add("@CityName", SqlDbType.NVarChar,50).Value = CityName;
            cmd.Parameters.Add("@PinCode", SqlDbType.NVarChar,50).Value = PinCode;
            cmd.Parameters.Add("@ProfileImage", SqlDbType.NVarChar, 250).Value = ProfileImage;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }


    public DataSet Crm_ChangePassword(int ClientID, string CurrentPassword, string NewPasswoerd)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("usp_CrmChangePassword", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@CurrentPassword", SqlDbType.VarChar, 50).Value = CurrentPassword;
            cmd.Parameters.Add("@NewPassword", SqlDbType.VarChar, 50).Value = NewPasswoerd;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet Display_DataBindGridForEdit(string TableName,int ID)
    {
		  ds = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("Display_Data_BindGridFor_Edit", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TableName", SqlDbType.VarChar, 50).Value = TableName;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet  Crm_InsertUpdateContacts( int ContactID, int ClientID, string ContactName, string ContactEmail, string ContactMobileNo, string Remarks)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("usp_CrmInsertUpdateContacts", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = ContactID;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@ContactName", SqlDbType.VarChar, 50).Value = ContactName;
            cmd.Parameters.Add("@ContactEmail", SqlDbType.VarChar, 50).Value = ContactEmail;
            cmd.Parameters.Add("@ContactMobile", SqlDbType.VarChar, 50).Value = ContactMobileNo;
            cmd.Parameters.Add("@Remarks", SqlDbType.NVarChar, 250).Value = Remarks;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet Crm_DeleteContact(int ContactID)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("usp_CrmDeleteContact", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = ContactID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }


    public DataSet Crm_InsertUpdateAddress(int AddressID, int ClientID, string AddressName, string Address, string Area, string City, string Landmark, string PinCode, string MobileNo)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("usp_CrmInsertUpdateAddresses", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = AddressID;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@AddressName", SqlDbType.VarChar, 50).Value = AddressName;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = Address;
            cmd.Parameters.Add("@Area", SqlDbType.VarChar, 50).Value = Area;
            cmd.Parameters.Add("@City", SqlDbType.VarChar, 50).Value = City;
            cmd.Parameters.Add("@Landmark", SqlDbType.NVarChar, 50).Value = Landmark;
            cmd.Parameters.Add("@Pincode", SqlDbType.NVarChar, 6).Value = PinCode;
            cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 10).Value = MobileNo;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet Crm_DeleteAddress(int AddressID)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("usp_CrmDeleteAddress", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = AddressID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet Crm_ValidateMobileNo(string  EmailID)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("VerifyClientMobileNo", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmailID", SqlDbType.VarChar, 100).Value = EmailID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }
    public DataSet Display_Data_BindForEditCrm(string TableName,int ID)
    {
  ds = new DataSet();       
 try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("Display_Data_Bind_ForEdit_Crm", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TableName", SqlDbType.VarChar, 50).Value = TableName;
            cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = ID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }


    public DataSet Crm_GenerateOTPInDatabase(string MobileNo)
    {
        try
        {
            DataSet dss = new DataSet();
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("Crm_GenerateOTP", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 10).Value = MobileNo;
           da = new SqlDataAdapter(cmd);
           da.Fill(dss);
           return dss;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }
   public DataSet Crm_VerifyOTP(string MobileNo,string OTP)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("Crm_VerifyOtp", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 10).Value = MobileNo;
            cmd.Parameters.Add("@OTP", SqlDbType.VarChar, 6).Value = OTP;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }
    public DataSet SaveClient(string FName,string LName,string MNumber,string EmailId,string Password)
    {
        try 
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("RegisterClient", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID",SqlDbType.Int).Value=0;
            cmd.Parameters.Add("@Fname",SqlDbType.NVarChar).Value=FName; 
            cmd.Parameters.Add("@MName",SqlDbType.NVarChar).Value=""; 
            cmd.Parameters.Add("@LName",SqlDbType.NVarChar).Value=LName; 
            cmd.Parameters.Add("@DOB",SqlDbType.NVarChar,100).Value=""; 
            cmd.Parameters.Add("@Email",SqlDbType.NVarChar).Value=EmailId; 
            cmd.Parameters.Add("@MobileNo",SqlDbType.NVarChar).Value=MNumber;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Password;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    
    }

    public string SendContactUsEmail(string RecipantEmailID, string RecipantName, string EmailBody)
    {
        string ans = "N";


        MailAddress from = new MailAddress("task@russsh.com", "RUSSSH");
        MailAddress toemail = new MailAddress(RecipantEmailID, RecipantName);

        System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage(from, toemail);

        Email1.Subject = "New Enquiry Received ";

        Email1.Body = EmailBody;
        Email1.IsBodyHtml = true;


        Email1.Sender = new MailAddress("task@russsh.com", "RUSSSH");
        Email1.Priority = System.Net.Mail.MailPriority.High;
        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Russsh1380");
        mailClient.UseDefaultCredentials = true;
        mailClient.Host = "us2.smtp.mailhostbox.com";
        mailClient.Port = 25;
        mailClient.EnableSsl = true;
        mailClient.Credentials = basicAuthenticationInfo;

        try
        {
            mailClient.Send(Email1);
            ans = "Y";
        }
        catch (Exception ee)
        {
            error = ee.ToString();
            ans = "N";
        }


        return ans;
    }

    public DataSet ValidateFBLogin(string EmailID, string Name)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("ValidateFBLogin", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmailID", SqlDbType.VarChar, 100).Value = EmailID;
            cmd.Parameters.Add("@Name", SqlDbType.VarChar, 100).Value = Name;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }
    public string getpassword(string emailid)
    {
        DataSet ds = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("GetPassword", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@emailid", SqlDbType.VarChar, 100).Value = emailid;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds.Tables[0].Rows[0].ItemArray[0].ToString() + "," + ds.Tables[0].Rows[0].ItemArray[1].ToString();
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds.Tables[0].Rows[0].ItemArray[0].ToString() ;
    }

    public DataSet Crm_updateaddress(int ClientID, string FName, string MobileNo, string Street, string Address, string AreaName, string CityName,string dob,int gender ,int status,string doa)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("UpadateClientAddress", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@fname", SqlDbType.VarChar, 50).Value = FName;
            cmd.Parameters.Add("@address", SqlDbType.VarChar, 50).Value = Address;
            cmd.Parameters.Add("@area", SqlDbType.VarChar, 50).Value = AreaName;
            cmd.Parameters.Add("@street", SqlDbType.VarChar, 50).Value = Street;
            cmd.Parameters.Add("@city", SqlDbType.VarChar, 50).Value = CityName;
            cmd.Parameters.Add("@mobile", SqlDbType.VarChar, 50).Value = MobileNo;
            cmd.Parameters.Add("@dob", SqlDbType.VarChar, 50).Value = dob;
             cmd.Parameters.Add("@gender", SqlDbType.Int).Value = gender;
             cmd.Parameters.Add("@status", SqlDbType.Int).Value = status;
               cmd.Parameters.Add("@doa", SqlDbType.VarChar, 50).Value = doa;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet GetAdditionalAddress(int ClientId)
    {
        DataSet ds1 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("GetAdditionalAddress", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientId", SqlDbType.VarChar, 10).Value = ClientId;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            return ds1;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds1;


    }
    public DataSet InsertUpdateAdditionalAddress(int addressid, int clientid, string aname, string address, string area, string city, string landmark, string pincode, string mobile)
    {

        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("IUAdditionalAddress", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AddressId", SqlDbType.Int).Value = addressid;
            cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = clientid;
            cmd.Parameters.Add("@AddressName", SqlDbType.VarChar, 50).Value = aname;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = address;
            cmd.Parameters.Add("@Area", SqlDbType.VarChar, 50).Value = area;
            cmd.Parameters.Add("@city", SqlDbType.VarChar, 50).Value = city;
            cmd.Parameters.Add("@Landmark", SqlDbType.VarChar, 50).Value = landmark;
            cmd.Parameters.Add("@Pincode", SqlDbType.VarChar, 50).Value = pincode;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 50).Value = mobile;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }


    public DataSet DeleteClientAddress(int AddressID)
    {
        DataSet ds1 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("DeleteAdditionalAddress", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AddressID", SqlDbType.VarChar, 10).Value = AddressID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            return ds1;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds1;


    }

    public DataSet GetMyOrders(int AccountID, string fdate, string todate, int flag)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("GetMyOrders", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Account_ID", SqlDbType.Int).Value = AccountID;
            cmd.Parameters.Add("@FromDate", SqlDbType.VarChar, 50).Value = fdate;
            cmd.Parameters.Add("@ToDate", SqlDbType.VarChar, 50).Value = todate;
            cmd.Parameters.Add("@Flag", SqlDbType.Int).Value = flag;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet VaidateTaskIDwithClientID(int TaskID,  int ClientID)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("ValidateTaskIDwithClient", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }
    public DataSet RecordLogin(int ClientID)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("RecordLogin", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

    public DataSet ReInitiateClientVerificationProcess(int ClientID, string EmailCode,string MobileCode, string MobileNo)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("ResetClientInitiateVerificationProcess", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@EmailVerificationCode", SqlDbType.NVarChar, 100).Value = EmailCode;
            cmd.Parameters.Add("@MobileVerificationCode", SqlDbType.NVarChar, 100).Value = MobileCode;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 10).Value = MobileNo;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;


        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

  public DataSet InsertUpdateAdditionalAddress_Temp(int addressid, int clientid, string aname, string address, string area, string city, string landmark, string pincode, string mobile,int cityid,int areaid)
    {

        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("IUAdditionalAddress_Temp", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AddressId", SqlDbType.Int).Value = addressid;
            cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = clientid;
            cmd.Parameters.Add("@AddressName", SqlDbType.VarChar, 50).Value = aname;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar, 500).Value = address;
            cmd.Parameters.Add("@Area", SqlDbType.VarChar, 50).Value = area;
            cmd.Parameters.Add("@city", SqlDbType.VarChar, 50).Value = city;
            cmd.Parameters.Add("@Landmark", SqlDbType.VarChar, 50).Value = landmark;
            cmd.Parameters.Add("@Pincode", SqlDbType.VarChar, 50).Value = pincode;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 50).Value = mobile;
            cmd.Parameters.Add("@cityid", SqlDbType.VarChar, 50).Value = cityid;
            cmd.Parameters.Add("@areaid", SqlDbType.VarChar, 50).Value = areaid;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }

 public DataSet GetCityArea(string name)
    {
        try
        {
            ds = new DataSet();
            ds.Clear();
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("getcityarea", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds;
    }
public DataSet CreditWallet(int clientid, int amount, string remark)
    {
        DataSet ds2 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("CreditWallet", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = clientid;
            cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = amount;
            cmd.Parameters.Add("@Remarks", SqlDbType.VarChar, 500).Value = remark;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds2);
            return ds2;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds2;

    }
    public DataSet GetWalletData(int clientid, string ttype)
    {
        DataSet dss2 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("Getwalletdetails", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = clientid;
            cmd.Parameters.Add("@ttype", SqlDbType.VarChar, 20).Value = ttype;
            da = new SqlDataAdapter(cmd);
            da.Fill(dss2);
            return dss2;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return dss2;

    }

   
 public DataSet CancelTask(int taskid,int cancelby,string status,string reason)
    { 

        DataSet dss4 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("CancelOrder", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TaskId", SqlDbType.Int).Value = taskid;
            cmd.Parameters.Add("@CancelBy", SqlDbType.Int).Value = cancelby;
            cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = status;
            cmd.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = reason;
            da = new SqlDataAdapter(cmd);
            da.Fill(dss4);
            return dss4;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return dss4;
     
    }


 public DataSet GetTaskStatus(int taskid)  
    { 
      DataSet dss3 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("StatusforCancelation", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TaskID", SqlDbType.Int).Value = taskid;
            da = new SqlDataAdapter(cmd);
            da.Fill(dss3);
            return dss3;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return dss3;
    }
public DataSet CheckCoupanApplicable(int ClientID,string CoupanCode,string date)
 {
     DataSet dss3 = new DataSet();
     try
     {
         LocalConnection_Class(LocalConn);
         cmd = new SqlCommand("CheckCouponCode", LocalConn);
         cmd.CommandType = CommandType.StoredProcedure;
         cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
         cmd.Parameters.Add("@CoupanCode", SqlDbType.VarChar, 50).Value = CoupanCode;
         cmd.Parameters.Add("@date", SqlDbType.VarChar, 10).Value = date;
         da = new SqlDataAdapter(cmd);
         da.Fill(dss3);
         return dss3;
     }
     catch (Exception e)
     {
         error = e.ToString();
     }
     finally
     {
         cmd.Dispose();
         LocalConn.Close();
     }
     return dss3;
 }
public DataSet ProcessSocialLogin(string Name, string Email,string AppID, string platform)
 {
     DataSet dss3 = new DataSet();
     try
     {
         LocalConnection_Class(LocalConn);
         cmd = new SqlCommand("ValidateSocialLogin", LocalConn);
         cmd.CommandType = CommandType.StoredProcedure;
       
         cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = Name;
         cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = Email;
         cmd.Parameters.Add("@AppId", SqlDbType.NVarChar, 100).Value = AppID;
         cmd.Parameters.Add("@Platform", SqlDbType.Char, 1).Value = platform;
         da = new SqlDataAdapter(cmd);
         da.Fill(dss3);
         return dss3;
     }
     catch (Exception e)
     {
         error = e.ToString();
     }
     finally
     {
         cmd.Dispose();
         LocalConn.Close();
     }
     return dss3;
 }

public DataSet WalletTransactionInitiatedOnline(string MarchantID, int amount, string Status, string pgtxnid)
      {
          DataSet ds = new DataSet();
          try
          {
              LocalConnection_Class(LocalConn);
              cmd = new SqlCommand("WalletTransactionInitiatedOnline", LocalConn);
              cmd.CommandType = CommandType.StoredProcedure;
              cmd.Parameters.Add("@MarchantID", SqlDbType.Int).Value = MarchantID;
              cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = amount;
              cmd.Parameters.Add("@Status", SqlDbType.Int).Value = Status;
              cmd.Parameters.Add("@pgtxnid", SqlDbType.VarChar, 500).Value = pgtxnid;
              da = new SqlDataAdapter(cmd);
              da.Fill(ds);
              return ds;
          }
          catch (Exception e)
          {
              error = e.ToString();
          }
          finally
          {
              cmd.Dispose();
              LocalConn.Close();
          }
          return ds;
      }

public int GetClientOutstanding(int ClientId)
{
    DataSet dsOut = new DataSet();
    int amount = 0;
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("GetClientOutstanding", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = ClientId;
        da = new SqlDataAdapter(cmd);
        da.Fill(dsOut);
        if (dsOut.Tables[0].Rows.Count > 0)
        {
            amount = Convert.ToInt32(dsOut.Tables[0].Rows[0].ItemArray[0].ToString());
        }
        return amount;
    }
    catch (Exception e)
    {
        error = e.ToString();
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
    return amount;
}
public DataSet TaskDescriptionCount()
{
    DataSet dss3 = new DataSet();
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("TaskDescriptionCount", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        da.Fill(dss3);
        return dss3;
    }
    catch (Exception e)
    {
        error = e.ToString();
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
    return dss3;
}
public string InsertCitrusTransactionResult(string state, string pgid, string amount, string mid)
{
    DataSet dsOut = new DataSet();
    string ans = "";
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("InsertCitrusTransactionResult", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@state", SqlDbType.NVarChar, 100).Value = state;
        cmd.Parameters.Add("@pgtxnid", SqlDbType.NVarChar, 100).Value = pgid;
        cmd.Parameters.Add("@amount", SqlDbType.NVarChar, 100).Value = amount;
        cmd.Parameters.Add("@marchant_txt_id", SqlDbType.NVarChar, 100).Value = mid;
        da = new SqlDataAdapter(cmd);
        da.Fill(dsOut);
        if (dsOut.Tables[0].Rows.Count > 0)
        {
            ans = dsOut.Tables[0].Rows[0].ItemArray[0].ToString();
        }
       
    }
    catch (Exception e)
    {
       
	error = e.ToString();
       ans="N"+error ;
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
   return ans;
}

public DataSet GetTrackingdetails(int clientid, int taskid)
{
    DataSet dsTrack = new DataSet();
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("GetTrackingDetails", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Taskid", SqlDbType.NVarChar, 100).Value = taskid;
        cmd.Parameters.Add("@ClientId", SqlDbType.NVarChar, 100).Value = clientid;
 
        da = new SqlDataAdapter(cmd);
        da.Fill(dsTrack);
       
    }
    catch (Exception e)
    {
        error = e.ToString();
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
    return dsTrack;
}
public DataSet GetClientTaskCount(int ClientId)
    {
        DataSet ds11 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("GetClientTaskCount", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientId", SqlDbType.VarChar, 10).Value = ClientId;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds11);
            return ds11;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds11;


    }
public DataSet Crm_GetProfileData(int ClientID)
{
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("GetCustomerDetails", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@clientid", SqlDbType.Int).Value = ClientID;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    catch (Exception e)
    {
        error = e.ToString();
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
    return ds;
}
public DataSet Crm_updateprofileinfo(int ClientID, string FName, string MobileNo, int gender, DateTime DOB, string Email)
{
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("UpadateClientProfileInfo", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = ClientID;
        cmd.Parameters.Add("@fname", SqlDbType.VarChar, 50).Value = FName;
        cmd.Parameters.Add("@mobile", SqlDbType.VarChar, 100).Value = MobileNo;
        cmd.Parameters.Add("@dob", SqlDbType.Date).Value = DOB;
        cmd.Parameters.Add("@gender", SqlDbType.Int).Value = gender;
        cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = Email;

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;


    }
    catch (Exception e)
    {
        error = e.ToString();
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
    return ds;
}
public DataSet GetWalletDataByDate(int clientid, string ttype, DateTime StartDate, DateTime EndDate)
{
    DataSet dss2 = new DataSet();
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("GetwalletdetailsbyDate", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@clientid", SqlDbType.Int).Value = clientid;
        cmd.Parameters.Add("@ttype", SqlDbType.VarChar, 20).Value = ttype;
        cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = StartDate;
        cmd.Parameters.Add("@EndDate ", SqlDbType.DateTime).Value = EndDate;

        da = new SqlDataAdapter(cmd);
        da.Fill(dss2);
        return dss2;
    }
    catch (Exception e)
    {
        error = e.ToString();
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
    return dss2;
}
public DataSet GetTaskArea(int taskid)
{
    DataSet dsTrack1 = new DataSet();
    try
    {
        LocalConnection_Class(LocalConn);
        cmd = new SqlCommand("GetTaskinfoformail", LocalConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Taskid", SqlDbType.NVarChar, 100).Value = taskid;
        da = new SqlDataAdapter(cmd);
        da.Fill(dsTrack1);

    }
    catch (Exception e)
    {
        error = e.ToString();
    }
    finally
    {
        cmd.Dispose();
        LocalConn.Close();
    }
    return dsTrack1;
}

}