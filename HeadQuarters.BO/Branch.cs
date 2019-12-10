﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool
//     Changes to this file will be lost if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;
using HeadQuarters.DL;
using System.Web.UI.WebControls;

public class Branch
{
    //private variables

    private int branchId;
    private string branchAddress;
    private string contactNo;
    private string loc;

    //Encapsulation using properties

    public virtual int branch_id
    {
        get { return branchId; }
        set { branchId=value;}
    }    

	public virtual string branch_address
	{
        get { return branchAddress; }
        set { branchAddress = value; }
	}

	public virtual string contact_no
	{
        get { return contactNo; }
        set { contactNo = value; }
	}

	public virtual string location
	{
        get { return loc; }
        set { loc = value; }
	}



    public Branch(string branchAddress, string contactNumber, string Location)
    {
        branch_address = branchAddress;
        contact_no = contactNumber;
        location = Location;

    }


    public Branch(int branchId,string branchAddress, string contactNumber, string Location)
    {
        branch_id = branchId;
        branch_address = branchAddress;
        contact_no = contactNumber;
        location = Location;

    }


    public Branch()
    {

    }

	public bool AddBranch(string connString)
	{
        try
        {
            //no need of insert branch id->becuase it is auto incremented

            string query = "INSERT INTO Branch(branch_address,location,contact_no)VALUES(@branch_address,@location,@contact_no)";
            DbHelper.ConnectionString = connString;
            DbParameter[] paraArray = new DbParameter[3];
            paraArray[0] = (DbParameter)DbHelper.CreateParameter("@branch_address", DbType.String,branch_address);
            paraArray[1] = (DbParameter)DbHelper.CreateParameter("@location", DbType.String,location);
            paraArray[2] = (DbParameter)DbHelper.CreateParameter("@contact_no", DbType.String,contact_no);
           
            if (DbHelper.ExecuteNonQuery(CommandType.Text, query, paraArray) > 0)
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {

            throw ex;
        }
	}

	public bool RemoveBranch(string connString)
	{
        try
        {
            string query = "Delete from Branch where branch_id=@branch_id";
            DbHelper.ConnectionString = connString;
            DbParameter[] paraArray = new DbParameter[1];
            paraArray[0] = (DbParameter)DbHelper.CreateParameter("@branch_id", DbType.Int32, branch_id);
            if (DbHelper.ExecuteNonQuery(CommandType.Text, query, paraArray) > 0)
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {

            throw ex;
        }
	}

	public bool UpdateBranch(string connString)
	{
        try
        {
            string query = "Update Branch set branch_address=@branch_address,location=@location,contact_no=@contact_no where branch_id=@branch_id ";
            DbHelper.ConnectionString = connString;
            DbParameter[] paraArray = new DbParameter[4];
            paraArray[0] = (DbParameter)DbHelper.CreateParameter("@branch_address", DbType.String,branch_address);
            paraArray[1] = (DbParameter)DbHelper.CreateParameter("@location", DbType.String,location);
            paraArray[2] = (DbParameter)DbHelper.CreateParameter("@contact_no", DbType.String,contact_no);
            paraArray[3] = (DbParameter)DbHelper.CreateParameter("@branch_id", DbType.Int32,branch_id);
           
            if (DbHelper.ExecuteNonQuery(CommandType.Text, query, paraArray) > 0)
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {

            throw ex;
        }
	}

	public List<Branch> GetBranchInfo(string connString)
        {
            try
            {
                List<Branch> branchList = new List<Branch>();
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();

                string query = "select branch_id,branch_address,location,contact_no from Branch";
                if (branch_id!=0)
                {
                    query += " where branch_id=@branch_id";
                    DbParameter[] paraArray = new DbParameter[1];
                    paraArray[0] = (DbParameter)DbHelper.CreateParameter("@branch_id", DbType.Int32,branch_id);

                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, paraArray);
                }
                else
                {
                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);
 
                }
                while (reader.Read())
                {
                    Branch b = new Branch();
                    b.branch_id= Convert.ToInt32(reader[0].ToString());
                    b.branch_address=reader[1].ToString();
                    b.location =reader[2].ToString();
                    b.contact_no=reader[3].ToString();
                    
                    branchList.Add(b);
                }
                reader.Close();
                conn.Close();
                return branchList;
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }

    public List<string> GetAllBranchLocation(string connString)
    {
        try
        {
            List<string> branchList = new List<string>();
            DbDataReader reader = null;
            DbHelper.ConnectionString = connString;
            DbConnection conn = DbHelper.GetConnection();
            conn.Open();

            string query = "select location from Branch";

            reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);


            while (reader.Read())
            {

                string branch = reader[0].ToString();

                branchList.Add(branch);
            }
            reader.Close();
            conn.Close();
            return branchList;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    //get branch_id accorting to location from the database

    public int GetBranchID(string connString, string location)
    {
        try
        {
            int id = 0;
            DbDataReader reader = null;
            DbHelper.ConnectionString = connString;
            DbConnection conn = DbHelper.GetConnection();
            conn.Open();

            string query = "select branch_id from Branch where location='" + location + "'";


            reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);


            while (reader.Read())
            {
                id = Convert.ToInt32(reader[0].ToString());

            }
            reader.Close();
            conn.Close();
            return id;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    //get location according to branch id
    public string GetLocationAccordingToBranchId(string connString, int branchId)
    {
        try
        {
            string location = "";
            DbDataReader reader = null;
            DbHelper.ConnectionString = connString;
            DbConnection conn = DbHelper.GetConnection();
            conn.Open();

            string query = "select location from Branch where branch_id='" + branchId + "'";

            reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);


            while (reader.Read())
            {

                location = reader[0].ToString();


            }
            reader.Close();
            conn.Close();
            return location;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    }



