using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;



namespace HeadQuarters.BO
{
    public class Validator
    {
        public bool isPresent(TextBox t)
        {  //this method is for mandatory field validation
            if (t.Text.Length == 0)
            {                        
                return false;
            }
            return true;
        }

        //this method is for validating email
        public bool isValidEmail(string inputEmail)
        {
            string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                  @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                  @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            Regex re = new Regex(strRegex);
            if (re.IsMatch(inputEmail))
                return (true);
            else
                return (false);
        }

        //this method is for validating url
        public bool isValidUrl(string inputUrl)
        {
            Regex re= new Regex(@"((file|gopher|news|nntp|telnet|http|ftp|https|ftps|sftp)://)+(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,15})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(/[a-zA-Z0-9\&amp;%_\./-~-]*)?", RegexOptions.Singleline | RegexOptions.IgnoreCase);
            if (re.IsMatch(inputUrl))
                return (true);
            else
                return (false);
        }

        //this method is for validating the length of the string value.
        public bool cusCustom_ServerValidate(string inputString)
        {
            if (inputString.Length >= 8)
                return true;
           else
               return false;
        }

        //this method is for establishing password policy
        //password must contain
        //at least 10 characters
        //at least one one lower case letter
        //at least one upper case letter
        //at least one digit
        //at least a special characters
        public bool isValidPassword(string inputPass){
            string pattern = @"^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$";
            Regex r=new Regex(pattern);
            if(r.IsMatch(inputPass)){
               return true;
            }else{
               return false;
            }
        }

        //this method is for validating italian cab registration number
        public bool isValidCabNumber(string inputRegiNum)
        {
            string pattern = "^[A-Z]{2,3}-[0-9]{4}$";
            Regex r = new Regex(pattern);
            if (r.IsMatch((inputRegiNum)))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //this method is for validating hourly_rate,km_rate,additional distance, additional hrs
        //4562.00->valid
        //4562.0->not valid
        //4562->valid
        //4562.321->not valid
        //sql->total decimal(10,2)
        public bool isValidRate(string inputRegiNum){
         string pattern = "^[0-9]{1,8}.[0-9]{2}$";
         string pattern2 = "^[0-9]{1,8}$";  //?
            Regex r=new Regex(pattern);
            Regex r2 = new Regex(pattern2);
            if (r2.IsMatch(inputRegiNum) || r.IsMatch(inputRegiNum))
            {
                 return true;
            }else {
                return false;
           }
        }

        //this method is for validating italian phone numbers
        //02-123645->valid
        //02/125358->valid
        public bool isValidPhoneNumber(string inputPhoneNum) {
            if (new Regex("^[0-9]{2}-[0-9]{6}$").IsMatch(inputPhoneNum) || new Regex("^[0-9]{2}/[0-9]{6}$").IsMatch(inputPhoneNum))
            {
              return true;
           }else{
              return false;
           }
        }

        //this method is for validating NIC no
        //public bool isValidNic(string inputPass) {
            //couldn't find the format of italian nic number
        //}

        //this method is for validating currency values
        //sql->total decimal(18,2)
        public bool isValidTotal(string inputTot) {
            string pattern = "^[0-9]{1,16}.[0-9]{2}$";
            string pattern2 = "^[0-9]{1,16}$";  //?
            Regex r = new Regex(pattern);
            Regex r2 = new Regex(pattern2);
            if (r2.IsMatch(inputTot) || r.IsMatch(inputTot))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //this method is for validating the date format

        public bool isValidDate(string inputDate)
        {
            if (new Regex("^[0-9]{4}/[0-1][0-9]/[0-3][0-9]$").IsMatch(inputDate))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
